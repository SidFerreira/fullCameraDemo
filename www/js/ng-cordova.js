
(function(){

  angular.module('ngCordova', [
    'ngCordova.plugins'
  ]);

  angular.module('ngCordova.plugins', [
    'ngCordova.plugins.camera',
    'fullCamera'
  ]);

  //#### Begin Individual Plugin Code ####

  // install   :   cordova plugin add org.apache.cordova.camera
  // link      :   https://github.com/apache/cordova-plugin-camera/blob/master/doc/index.md#orgapachecordovacamera

  angular.module('ngCordova.plugins.camera', []).factory('$cordovaCamera', ['$q', function ($q) {

      return {
        getPicture: function (options) {
          var q = $q.defer();

          if (!navigator.camera) {
            q.resolve(null);
            return q.promise;
          }

          navigator.camera.getPicture(function (imageData) {
            q.resolve(imageData);
          }, function (err) {
            q.reject(err);
          }, options);

          return q.promise;
        },

        cleanup: function () {
          var q = $q.defer();

          navigator.camera.cleanup(function () {
            q.resolve();
          }, function (err) {
            q.reject(err);
          });

          return q.promise;
        }
      };
    }]);

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
