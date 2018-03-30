({
    doInit: function (component, event, helper) {
        helper.getLeadtree(component);
    },
    openModel: function(component,event, helper) {
        var TaskId = event.getParam('name');  
        helper.getTaskDetails(component,TaskId);
    },
    
    closeModel: function(component, event, helper) {
        // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
        component.set("v.isOpen", false);
    },
    
    
})
