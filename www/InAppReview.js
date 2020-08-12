var exec = require("cordova/exec");
var PLUGIN_NAME = "InAppReview";

module.exports = {
    askToReview: function(name, params) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "askToReview", []);
        });
    }
};
