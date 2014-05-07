// For more information see: http://emberjs.com/guides/routing/

ComicTracker.Router.map(function() {
  this.resource('comics', { path: '/' });
  this.resource('comic', { path: '/comics/:id' });
});
