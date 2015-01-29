angular.module('starter.controllers', [])

.controller('DashCtrl', function($scope, $fullCamera) {
  $scope.items = [];
  $scope.get = function() {
    $fullCamera.get().then(function(resultData) {
      console.log(resultData);
      if(resultData.items) {
        for (var i = 0; i < resultData.items.length; i++) {
          var item = resultData.items[i];
          if(resultData.source == "photo")
            item.img = "data:image/jpeg;base64," + item.data;
          console.log(item);
          $scope.items[$scope.items.length] = item;
        };
      }
    }, function(err) {
      console.log('NO');
    });
  };
})

.controller('ChatsCtrl', function($scope, Chats) {
  $scope.chats = Chats.all();
  $scope.remove = function(chat) {
    Chats.remove(chat);
  }
})

.controller('ChatDetailCtrl', function($scope, $stateParams, Chats) {
  $scope.chat = Chats.get($stateParams.chatId);
})

.controller('FriendsCtrl', function($scope, Friends) {
  $scope.friends = Friends.all();
})

.controller('FriendDetailCtrl', function($scope, $stateParams, Friends) {
  $scope.friend = Friends.get($stateParams.friendId);
})

.controller('AccountCtrl', function($scope) {
  $scope.settings = {
    enableFriends: true
  };
})



