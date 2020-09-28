var exec = require("cordova/exec");
var PLUGIN_NAME = "AppReview";

module.exports = {
    requestReviewDialog: function() {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "requestReviewDialog", []);
        });
    },
    requestReview: function(packageName) {
        return new Promise(function(resolve, reject) {
            exec(resolve, reject, PLUGIN_NAME, "requestReview", [packageName || null]);
        });
    }
};