sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/manage/resources/test/integration/FirstJourney',
		'com/manage/resources/test/integration/pages/ResourcesList',
		'com/manage/resources/test/integration/pages/ResourcesObjectPage'
    ],
    function(JourneyRunner, opaJourney, ResourcesList, ResourcesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/manage/resources') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheResourcesList: ResourcesList,
					onTheResourcesObjectPage: ResourcesObjectPage
                }
            },
            opaJourney.run
        );
    }
);