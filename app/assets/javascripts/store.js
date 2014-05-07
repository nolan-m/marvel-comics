ComicTracker.Store = DS.Store.extend({
  adapter: '-active-model'
});

// Override the default adapter with the `DS.ActiveModelAdapter` which
// is built to work nicely with the ActiveModel::Serializers gem.
ComicTracker.ApplicationAdapter = DS.ActiveModelAdapter.extend({

});
