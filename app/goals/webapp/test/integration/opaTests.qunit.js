sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/manage/goals/test/integration/FirstJourney',
		'com/manage/goals/test/integration/pages/GoalsList',
		'com/manage/goals/test/integration/pages/GoalsObjectPage'
    ],
    function(JourneyRunner, opaJourney, GoalsList, GoalsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/manage/goals') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheGoalsList: GoalsList,
					onTheGoalsObjectPage: GoalsObjectPage
                }
            },
            opaJourney.run
        );
    }
);