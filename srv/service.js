const cds = require('@sap/cds');
const { SELECT } = require('@sap/cds/lib/ql/cds-ql');
const axios = require('axios')

module.exports = class AchieveGoalsService extends cds.ApplicationService {
    init() {

        const { Tasks, Goals, Resources, Users } = cds.entities('AchieveGoalsService')

        this.before('CREATE', [Tasks, Tasks.drafts], async (req) => {
            await this.sequenceGenerator(req, Tasks);
        });

        this.before('CREATE', [Goals, Goals.drafts], async (req) => {
            await this.sequenceGenerator(req, Goals);
        });

        this.before('CREATE', [Resources, Resources.drafts], async (req) => {
            await this.sequenceGenerator(req, Resources);
            await this.fetchResourcesDetailsViaURL(req);
        });

        this.before('CREATE', Users, async (req) => {
            console.log('Before CREATE/UPDATE Users', req.data);
        });

        return super.init();
    }
    async sequenceGenerator(req, entity) {
        if (req.subject?.ref && String(req.subject?.ref[0]).search('drafts') !== -1) {
            // const maxTaskNo = await SELECT.one.from(entity).columns('max(id) as maxId');
            // const maxTaskNoDraft = await SELECT.one.from(entity.drafts).columns('max(id) as maxId');
            const maxTask = await this.findMaxId(entity);
            // If no existing entries, start from 1, else increment
            req.data.id = (maxTask?.maxId || 0) + 1;
            return;
        }
        if (!req.data.id) {
            const maxTask = await this.findMaxId(entity);
            // If no existing entries, start from 1, else increment
            req.data.id = (maxTask?.maxId || 0) + 1;
            return;
        }
        return;
    }
    async findMaxId(entity) {
        const maxTaskNo = await SELECT.one.from(entity).columns('max(id) as maxId');
        const maxTaskNoDraft = await SELECT.one.from(entity.drafts).columns('max(id) as maxId');
        const maxTask = (maxTaskNo.maxId > maxTaskNoDraft.maxId ? maxTaskNo : maxTaskNoDraft);
        return maxTask;
    }

    async fetchResourcesDetailsViaURL(req) {
        if (!req.data.imagePreview) {
            const url = req.data.url;
            const videoId = this.extractVideoId(url);
            const thumbnailUrl = `https://img.youtube.com/vi/${videoId}/maxresdefault.jpg`;

            try {
                const response = await axios.get(thumbnailUrl, { responseType: 'arraybuffer' });
                req.data.imagePreview = Buffer.from(response.data, 'binary');
                req.data.imageType = 'image/jpeg';
                req.data.source_type = await this.isVideoUrl(url);
                req.data.imageUrl = thumbnailUrl;
                const data = await this.getYoutubeVideoDetails(url);
                req.data.title = data.title;
                req.data.descr = data.description;
            } catch (error) {
                console.error('Error fetching image:', error);
            }
        }
    }

    extractVideoId(url) {
        const regex = /(?:https?:\/\/)?(?:www\.)?(?:youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/)([a-zA-Z0-9_-]{11})/;
        const matches = url.match(regex);
        return matches ? matches[1] : null;
    }

    async isVideoUrl(url) {
        const youtubeRegex = /^(https?:\/\/)?(www\.)?(youtube\.com|youtu\.be)\/.+$/;
        const sourceType = youtubeRegex.test(url) ? 'Video' : 'Others';
        return sourceType;
    }

    async getYoutubeVideoDetails(url) {
        const oEmbedUrl = `https://www.youtube.com/oembed?url=${url}&format=json`;

        try {
            const response = await axios.get(oEmbedUrl);
            const data = response.data;
            return {
                title: data.title,
                description: data.author_name // Note: oEmbed does not provide the description directly
            };
        } catch (error) {
            console.error('Error fetching video details:', error);
            return null;
        }
    }

}