sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.manage.resources',
            componentId: 'ResourcesList',
            contextPath: '/Resources'
        },
        CustomPageDefinitions
    );
});