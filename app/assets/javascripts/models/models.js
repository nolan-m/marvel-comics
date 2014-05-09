ComicTracker.Comic = DS.Model.extend({
  marvel_id: DS.attr(),
  title: DS.attr(),
  issue_number: DS.attr(),
  description: DS.attr(),
  image: DS.attr(),
  week: DS.belongsTo('week')
})

ComicTracker.Week = DS.Model.extend({
  week_number: DS.attr(),
  comics: DS.hasMany('comic', {async:true})
})
