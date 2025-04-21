using {AchieveGoalsService as serv} from './service';


annotate serv.Tasks with @(
    UI.SelectionFields : [
        title,
        priority_type,
        status_code
    ],
    UI.HeaderInfo      : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Task',
        TypeNamePlural: 'Tasks',
        Title         : {
            $Type: 'UI.DataField',
            Value: title,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: descr,
        },
    },
    UI.LineItem        : [
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
            Value: descr,
        },
        {
            $Type: 'UI.DataField',
            Value: due_date,
        },
        {
            $Type: 'UI.DataField',
            Value: priority_type,
        },
        {
            $Type: 'UI.DataField',
            Value: source_type,
        },
        {
            $Type: 'UI.DataField',
            Value: status_code,
        },
    ],
    UI.FieldGroup #Task: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: id
            },
            {
                $Type: 'UI.DataField',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Value: descr,

            },
            {
                $Type: 'UI.DataField',
                Value: due_date,
            },
            {
                $Type            : 'UI.DataField',
                Value            : priority_type,
                ![@UI.Importance]: #High,
            },
            {
                $Type: 'UI.DataField',
                Value: source_type,
            },
            {
                $Type: 'UI.DataField',
                Value: status_code,
            },
        ],
    },
    UI.Facets          : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>TaskDetails}',
        Target: '@UI.FieldGroup#Task',
    }, ],
);

annotate serv.Tasks with {
    source
    @Common: {
        ValueListWithFixedValues: true,
        ValueList               : {
            CollectionPath: 'SourceTypes',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: source_type,
                ValueListProperty: 'type'
            }]
        }
    };

}

annotate serv.Goals with @UI: {
    SelectionFields  : [title],
    HeaderInfo       : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>Goal}',
        TypeNamePlural: '{i18n>Goals}',
        Title         : {
            $Type: 'UI.DataField',
            Value: title,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: descr,
        },
    },
    LineItem         : [
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
            Value: descr,
        },
        {
            $Type: 'UI.DataField',
            Value: start_date,
        },
        {
            $Type: 'UI.DataField',
            Value: end_date,
        }
    ],
    FieldGroup #Goals: {
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
                Value: descr,
            },
            {
                $Type: 'UI.DataField',
                Value: start_date,
            },
            {
                $Type: 'UI.DataField',
                Value: end_date,
            }
        ],
    },
    Facets           : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>GoalDetails}',
        Target: '@UI.FieldGroup#Goals',
    }, ],
};
