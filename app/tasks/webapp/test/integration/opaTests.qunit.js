sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/manage/tasks/test/integration/FirstJourney',
		'com/manage/tasks/test/integration/pages/TasksList',
		'com/manage/tasks/test/integration/pages/TasksObjectPage'
    ],
    function(JourneyRunner, opaJourney, TasksList, TasksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/manage/tasks') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheTasksList: TasksList,
					onTheTasksObjectPage: TasksObjectPage
                }
            },
            opaJourney.run
        );
    }
);