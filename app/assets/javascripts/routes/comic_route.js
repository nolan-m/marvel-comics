ComicTracker.ComicRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('comic', params.id);
  }
})
