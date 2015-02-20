
(function(){

  angular.module('ngCordova', [
    'ngCordova.plugins'
  ]);

  angular.module('ngCordova.plugins', [
    'fullCamera'
  ]);

  //#### Begin Individual Plugin Code ####

  // install   :   cordova plugin add org.apache.cordova.camera
  // link      :   https://github.com/apache/cordova-plugin-camera/blob/master/doc/index.md#orgapachecordovacamera

    angular.module('fullCamera', []).factory("$fullCamera", ['$q', function ($q) {
      return {
          get: function(options) {
            options = options || {};

            var q = $q.defer();

            if (!navigator.fullCamera) {
              q.resolve(null);
              return q.promise;
            }

            navigator.fullCamera.get(function (resultData) {
              q.resolve(resultData);
            }, function (err) {
              q.reject(err);
            }, options);

            return q.promise;
          }
      };
  }]);
})();
