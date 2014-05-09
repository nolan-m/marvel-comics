// For more information see: http://emberjs.com/guides/routing/

ComicTracker.Router.map(function() {
  this.resource('index', { path: '/' }, function() {
    this.resource('week', { path: '/:week_id' }, function() {
      this.resource('comic', { path: '/:comic_id' });
    });
  });
});


