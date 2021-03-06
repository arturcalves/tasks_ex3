storageEngine = function() {
	var initialized = false;
	//var initializedObjectStores = {};
	return {
		init : function(successCallback, errorCallback) {
			initialized = true;
			successCallback(null);
		},
		initObjectStore : function(type, successCallback, errorCallback) {
			if (!initialized) {
				errorCallback('storage_api_not_initialized', 'The storage engine has not been initialized');
			} 
			successCallback(null);
		},
		save: function(type, obj, successCallback, errorCallback) {
            $.ajax({
                method: "post",
                url: "task/save",
                data: obj
            })
            .done(function( msg ) {                 
               successCallback(obj);
            });

        },
		findAll : function(type, successCallback, errorCallback) {

            $.ajax({
               method : 'get',
               dataType: "json",
               url: "task/getall",               
               success: function (data) {
                   var result = [];
                   $.each(data, function(i, v) {
                       result.push(v);
                   });
                   successCallback(result);
               }
            });
        },
        delete : function(type, id, successCallback, errorCallback) { 
            $.ajax({
                method : 'get',
                dataType: "json",
                url: "task/delete/"+id,                
                success: function (data) {                      
                    successCallback(id);
                }
            });
        },
		findById : function (type, id, successCallback, errorCallback)	{
            $.ajax({
                method : 'get',
                dataType: "json",
                url: "task/get/"+id,
                success: function (data) {
                    successCallback(data);
                }           
            }); 
        }
	}
	function getStorageObject(type) {
    	var item = localStorage.getItem(type);
    	var parsedItem = JSON.parse(item);
    	return parsedItem;
    }
}();