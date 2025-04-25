using from '../../srv/annotations';
using from '../../db/schema';

annotate AchieveGoalsService.Tasks with {
    priority @(
        Common.Text                    : {
            $value                : priority.descr,
            ![@UI.TextArrangement]: #TextOnly
        },
        Common.ValueList               : {
            CollectionPath: 'Priority',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: priority_type,
                ValueListProperty: 'type',
            }, ],
            Label         : '{i18n>Priority}',
        },
        Common.ValueListWithFixedValues: true,
        Common.Label : '{i18n>Priority}',
    )
};

annotate AchieveGoalsService.Tasks with @(
    UI.LineItem           : [
        {
            $Type: 'UI.DataField',
            Value: id,
            Label : '{i18n>TasksNo}',
        },
        {
            $Type: 'UI.DataField',
            Value: title,
            Label : '{i18n>Title}',
        },
        {
            $Type: 'UI.DataField',
            Value: descr,
            Label : '{i18n>Descr}',
        },
        {
            $Type: 'UI.DataField',
            Value: due_date,
            Label : '{i18n>DueDate}',
        },
        {
            $Type: 'UI.DataField',
            Value: priority_type,
            Label : '{i18n>Priority}',
        },
        {
            $Type: 'UI.DataField',
            Value: source_type,
            Label : '{i18n>SourceType}',
        },
        {
            $Type: 'UI.DataField',
            Value: status_code,
            Label : '{i18n>Status}',
        },
        {
            $Type            : 'UI.DataFieldForAnnotation',
            Label            : '{i18n>Progress}',
            Target           : '@UI.DataPoint#Progress',
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataField',
            Value : goal_id,
            Label : '{i18n>Goalid}',
        },
        {
            $Type : 'UI.DataField',
            Value : resource_id,
            Label : '{i18n>Resourceid}',
        },
    ],
    UI.DataPoint #Progress: {
        $Type        : 'UI.DataPointType',
        Value        : progress,
        TargetValue  : 100,
        Visualization: #Progress,
    },
    UI.FieldGroup #Task   : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: id,
                Label : '{i18n>TasksNo}',
            },
            {
                $Type: 'UI.DataField',
                Value: title,
                Label : '{i18n>Title}',
            },
            {
                $Type: 'UI.DataField',
                Value: descr,
                Label : '{i18n>Descr}',
            },
            {
                $Type: 'UI.DataField',
                Value: due_date,
                Label : '{i18n>DueDate}',
            },
            {
                $Type            : 'UI.DataField',
                Value            : priority_type,
                Label : '{i18n>Priority}',
                ![@UI.Importance]: #High,
            },
            {
                $Type: 'UI.DataField',
                Value: source_type,
                Label : '{i18n>SourceType}',
            },
            {
                $Type: 'UI.DataField',
                Value: status_code,
                Label : '{i18n>Status}',
            },
            {
                $Type            : 'UI.DataFieldForAnnotation',
                Label            : '{i18n>Progress}',
                Target           : '@UI.DataPoint#Progress',
                ![@UI.Importance]: #High,
            },
        ],
    },
    UI.HeaderInfo : {
        $Type : 'UI.HeaderInfoType',
        TypeName : '{i18n>Task}',
        TypeNamePlural : '{i18n>Tasks}',
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
    },
);

annotate AchieveGoalsService.Tasks with {
    status @(
        Common.Text                    : {
            $value                : status.descr,
            ![@UI.TextArrangement]: #TextOnly
        },
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Status',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: status_code,
                ValueListProperty: 'code',
            }, ],
            Label         : '{i18n>Status}',
        },
        Common.ValueListWithFixedValues: true,
        Common.Label : '{i18n>Status}',
    )
};

annotate AchieveGoalsService.Priority with {
    type @Common.Text: {
        $value                : descr,
        ![@UI.TextArrangement]: #TextOnly,
    }
};

annotate AchieveGoalsService.Status with {
    code @Common.Text: {
        $value                : descr,
        ![@UI.TextArrangement]: #TextOnly,
    }
};
annotate AchieveGoalsService.Tasks with {
    title @Common.Label : '{i18n>Title}'
};

