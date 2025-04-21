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
    )
};

annotate AchieveGoalsService.Tasks with @(
    UI.LineItem           : [
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
        {
            $Type            : 'UI.DataFieldForAnnotation',
            Label            : '{i18n>Progress}',
            Target           : '@UI.DataPoint#Progress',
            ![@UI.Importance]: #High,
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
            {
                $Type            : 'UI.DataFieldForAnnotation',
                Label            : '{i18n>Progress}',
                Target           : '@UI.DataPoint#Progress',
                ![@UI.Importance]: #High,
            },
        ],
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
