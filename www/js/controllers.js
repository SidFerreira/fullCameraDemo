angular.module('starter.controllers', [])

.controller('homeCtrl', function($scope, $fullCamera, $ionicPopup) {
  $scope.items = [];
  $scope.options = {
    galleryPhoto: true,
    galleryVideo: true,
    cameraPhoto: true,
    cameraVideo: true
  }
  $scope.get = function() {
    var sources = [];
    var options = {};
    if(navigator.fullCamera && navigator.fullCamera.Sources) {
      if($scope.options.galleryPhoto)
        sources[sources.length] = navigator.fullCamera.Sources.GalleryPhoto;
      if($scope.options.galleryVideo)
        sources[sources.length] = navigator.fullCamera.Sources.GalleryVideo;
      if($scope.options.cameraPhoto)
        sources[sources.length] = navigator.fullCamera.Sources.CameraPhoto;
      if($scope.options.cameraVideo)
        sources[sources.length] = navigator.fullCamera.Sources.CameraVideo;

      options.allowedSources = sources.join();
    }
    
    $fullCamera.get(options).then(function(resultData) {
      console.log(resultData);
      if(resultData && resultData.items) {
        for (var i = 0; i < resultData.items.length; i++) {
          var item = resultData.items[i];
          if(item.source.substr(-5) == "photo")
            item.img = "data:image/jpeg;base64," + item.data;
          item.name = item.path.split('/').pop();
          $scope.items[$scope.items.length] = item;
        };
      } else {
        var alertPopup = $ionicPopup.alert({
          title: 'Oops!',
          template: '<div class="text-center">Nothing Returned</div>'
        });
      }
    }, function(err) {
      console.log('NO');
    });
  };
})


