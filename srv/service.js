const cds = require('@sap/cds');
const { SELECT } = require('@sap/cds/lib/ql/cds-ql');

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
        });

        this.before('CREATE', Users, async (req) => {
            console.log('Before CREATE/UPDATE Users', req.data);
        });

        return super.init();
    }
    async sequenceGenerator(req, entity) {
        if (req.subject?.ref && String(req.subject?.ref[0]).search('drafts') !== -1) {
            const maxTaskNo = await SELECT.one.from(entity).columns('max(id) as maxId');
            const maxTaskNoDraft = await SELECT.one.from(entity.drafts).columns('max(id) as maxId');
            const maxTask = (maxTaskNo.maxId > maxTaskNoDraft.maxId ? maxTaskNo : maxTaskNoDraft);
            // If no existing entries, start from 1, else increment
            req.data.id = (maxTask?.maxId || 0) + 1;
            return;
        }
        return;
    }
}