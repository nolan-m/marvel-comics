ComicTracker.Comic = DS.Model.extend({
  marvel_id: DS.attr(),
  week_number: DS.attr(),
  title: DS.attr(),
  issueNumber: DS.attr(),
  description: DS.attr(),
  image: DS.attr()
})
