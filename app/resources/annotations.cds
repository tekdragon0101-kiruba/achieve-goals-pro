using AchieveGoalsService as service from '../../srv/service';

annotate service.Resources with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [

            {
                $Type: 'UI.DataField',
                Value: id,
            },
            {
                $Type: 'UI.DataField',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Descr}',
                Value: descr,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>SourceType}',
                Value: source_type,
            },
            {
                $Type: 'UI.DataFieldWithUrl',
                Value: url,
                Url  : url,
            },
            {
                $Type: 'UI.DataField',
                Value: goal_id,
                Label: '{i18n>Goalid}',
            },
        ],
    },
    UI.Facets                    : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'Resources Details',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],
    UI.LineItem                  : [
        {
            $Type            : 'UI.DataField',
            Value            : imageUrl,
            ![@UI.Importance]: #High
        },
        {
            $Type: 'UI.DataField',
            Value: id,
        },
        {
            $Type: 'UI.DataField',
            Value: title,
        },
        {
            $Type: 'UI.DataFieldWithUrl',
            Value: url,
            Url  : url,
        },
        {
            $Type: 'UI.DataField',
            Value: descr,
        },
        {
            $Type: 'UI.DataField',
            Value: source_type,
        },
        {
            $Type: 'UI.DataField',
            Value: goal_id,
            Label: '{i18n>Goalid}',
        },
    ],
);

annotate service.Resources with {
    goal @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Goals',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: goal_id,
                ValueListProperty: 'id',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'title',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'descr',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'start_date',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'end_date',
            },
        ],
    }
};

annotate service.Resources with @(UI.HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : 'Resource',
    TypeNamePlural: 'Resources',
    Title         : {Value: title},
    Description   : {Value: descr},
    ImageUrl      : imageUrl,
    TypeImageUrl  : imageType,
}, );
