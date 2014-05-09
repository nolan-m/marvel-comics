Date.prototype.getWeek = function() {
  var determinedate = new Date();
  determinedate.setFullYear(this.getFullYear(), this.getMonth(), this.getDate());
  var D = determinedate.getDay();
  if(D == 0) D = 7;
  determinedate.setDate(determinedate.getDate() + (4 - D));
  var YN = determinedate.getFullYear();
  var ZBDoCY = Math.floor((determinedate.getTime() - new Date(YN, 0, 1, -6)) / 86400000);
  var WN = 1 + Math.floor(ZBDoCY / 7);
  return WN;
}
var mydate = new Date();
var weeknumber = mydate.getWeek();


ComicTracker.IndexRoute = Ember.Route.extend({
  model: function() {
    var weeks = this.get('store').findAll('week');
    return weeks;
  }
})

ComicTracker.WeekRoute = Ember.Route.extend({
  model: function(params) {
    var week = this.store.find('week', params.week_id);
    return week;
  }
})

// ComicTracker.ComicRoute = Ember.Route.extend({
//   model: function(params) {
//     return this.store.find('comic', params.id);
//   }
// })


// ComicTracker.NextRoute = Ember.Route.extend({
//   model: function(){
//       return this.modelFor('comics').filterBy('week_number', weeknumber + 1);
//   },
//   renderTemplate: function(controller) {
//     this.render('next', {controller: controller});
//   }
// });




// ComicTracker.LastRoute = Ember.Route.extend({
//   model: function(){
//       return this.modelFor('comics').filterBy('week_number', weeknumber - 1);
//   },
//   renderTemplate: function(controller) {
//     this.render('last', {controller: controller});
//   }
// });



// ComicTracker.CurrentRoute = Ember.Route.extend({
//   model: function(){
//       return this.modelFor('comics').filterBy('week_number', weeknumber);
//   },
//   renderTemplate: function(controller) {
//     this.render('current', {controller: controller});
//   }
// });
















