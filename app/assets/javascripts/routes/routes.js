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

var find_week = function(weeknumber){
  var weeks = this.get('store').findAll('week');
  return weeks;
}.property('find_week.@each');

ComicTracker.IndexRoute = Ember.Route.extend({
  model: function() {
    var weeks = this.get('store').findAll('week');
    return weeks;
  }
})

ComicTracker.WeekRoute = Ember.Route.extend({
  model: function(params) {
    if (params.week_id === 'current') {
      var week = this.store.find('week', 2);
    } else if (params.week_id === 'next') {
      var week = this.store.find('week', 3);
    } else {
      var week = this.store.find('week', 1);
    }
    return week;
  }
})

ComicTracker.ComicRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('comic', params.id);
  }
})
