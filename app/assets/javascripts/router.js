// For more information see: http://emberjs.com/guides/routing/

ComicTracker.Router.map(function() {
  this.resource('comics', { path: '/' }, function() {
    this.resource('current', function() {
      this.resource('comic', { path: '/:id' });
    });
    this.resource('next', function() {
      this.resource('comic', { path: '/:id' });
    });
    this.resource('last', function() {
      this.resource('comic', { path: '/:id' });
    });

  });
});


