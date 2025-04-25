using {com.manage as db} from './schema';


/* Tasks Labels */
annotate db.Tasks with {
    id          @title: '{i18n>TasksNo}';
    title       @title: '{i18n>Title}';
    descr       @title: '{i18n>Descr}';
    priority    @title: '{i18n>Priority}';
    source      @title: '{i18n>SourceType}';
    status      @title: '{i18n>Status}';
    progress    @title: '{i18n>Progress}';
    due_date    @title: '{i18n>DueDate}';
    isFavourite @title: '{i18n>Favourite}';

};

/* Resources Labels */
annotate db.Resources with {
    id           @title: '{i18n>ResourceNo}';
    title        @title: '{i18n>Title}';
    descr       @title: '{i18n>Descr}';
    url          @title: '{i18n>URL}';
    source      @title: '{i18n>SourceType}';
    imagePreview @title: '{i18n>ImagePreview}';
    imageType    @title: '{i18n>ImageType}';
};

/* Goals Labels */
annotate db.Goals with {
    id         @title: '{i18n>GoalNo}';
    title      @title: '{i18n>Title}';
    descr      @title: '{i18n>Descr}';
    start_date @title: '{i18n>StartDate}';
    end_date   @title: '{i18n>EndDate}';
};

/* User Label */
annotate db.Users with {
    id       @title: '{i18n>UserId}';
    username @title: '{i18n>Username}';
    email    @title: '{i18n>Email}';
};

/* Source Types */
annotate db.SourceTypes with {
    type @title: '{i18n>Type}';
};

annotate db.Priority with {
    type     @title: '{i18n>Type}';
    descr    @title: '{i18n>Descr}';
    critical @title: '{i18n>Critical}';
};

annotate db.Status with {
    code  @title: '{i18n>Code}';
    descr @title: '{i18n>Descr}'
};
