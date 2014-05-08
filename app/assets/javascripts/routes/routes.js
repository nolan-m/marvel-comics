ComicTracker.ComicsRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('comic');
  }
})

ComicTracker.ComicRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('comic', params.id);
  }
})

ComicTracker.ComicsIndexRoute = Ember.Route.extend({
  model: function() {
    return this.modelFor('comics');
  }
});

ComicTracker.NextRoute = Ember.Route.extend({
  model: function(){
      return this.modelFor('comics').filterBy('week_number', 20);
  },
  renderTemplate: function(controller) {
    this.render('next', {controller: controller});
  }
});

ComicTracker.CurrentRoute = Ember.Route.extend({
  model: function(){
      return this.modelFor('comics').filterBy('week_number', 19);
  },
  renderTemplate: function(controller) {
    this.render('current', {controller: controller});
  }
});


//   Date.prototype.getWeek = function() {
//     var determinedate = new Date();
//     determinedate.setFullYear(this.getFullYear(), this.getMonth(), this.getDate());
//     var D = determinedate.getDay();
//     if(D == 0) D = 7;
//     determinedate.setDate(determinedate.getDate() + (4 - D));
//     var YN = determinedate.getFullYear();
//     var ZBDoCY = Math.floor((determinedate.getTime() - new Date(YN, 0, 1, -6)) / 86400000);
//     var WN = 1 + Math.floor(ZBDoCY / 7);
//     return WN;
//   }
// var mydate = new Date();
// var weeknumber = mydate.getWeek();

