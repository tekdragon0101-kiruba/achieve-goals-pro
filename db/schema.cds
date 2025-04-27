namespace com.manage;

using {managed} from '@sap/cds/common';


entity Users {
        id       : UUID;
        username : String(100);
    key email    : String(100);
}

entity Resources : managed {
    key id           : Int16                      @readonly;
        title        : String(200);
        descr        : String(500)                @UI.MultiLineText;
        source       : Association to SourceTypes @mandatory;
    key url          : String(500);
        imagePreview : LargeBinary                @Core.MediaType: imageType  @Core.ContentDisposition.Type: 'inline'  @Core.ContentDisposition.Filename: title;
        imageType    : String(100)                @Core.IsMediaType;
        goal         : Association to Goals;
        tasks        : Association to many Tasks
                           on tasks.resource = $self;
}

@cds.autoexpose
@cds.odata.valuelist
entity SourceTypes {
    key type : String(255);
}

entity Tasks : managed {
    key id          : Int16                      @readonly;
        title       : String(200);
        descr       : String(500)                @UI.MultiLineText;
        source      : Association to SourceTypes @mandatory;
        priority    : Association to Priority;
        status      : Association to Status;
        progress    : UInt8 default 0            @assert.range: [
            0,
            100
        ];
        due_date    : DateTime;
        isFavourite : Boolean default false;
        resource    : Association to Resources;
        goal        : Association to Goals;
};

@cds.autoexpose
@cds.odata.valuelist
entity Status {
    key code  : String(50) enum {
            not_started = 'N';
            in_progress = 'I';
            completed   = 'C';
        } default #not_started;
        descr : String;
}

@cds.autoexpose
@cds.odata.valuelist
entity Priority {
    key type     : String(10) enum {
            low    = 'L';
            medium = 'M';
            high   = 'H';
        } default #medium;
        descr    : String;
        critical : UInt8 default 2 @assert.range: [
            1,
            3
        ];
};

entity Goals : managed {
    key id         : Int16       @readonly;
        title      : String(200);
        descr      : String(500) @UI.MultiLineText;
        start_date : DateTime;
        end_date   : DateTime;
        tasks      : Association to many Tasks
                         on tasks.goal = $self;
        resources  : Association to many Resources
                         on resources.goal = $self;
}
