ComicTracker.Comic = DS.Model.extend({
  marvel_id: DS.attr(),
  title: DS.attr(),
  issue_number: DS.attr(),
  description: DS.attr(),
  image: DS.attr(),
  week_number: DS.attr()
})
