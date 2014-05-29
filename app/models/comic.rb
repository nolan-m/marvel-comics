require 'open-uri'

class Comic < ActiveRecord::Base
  validates_uniqueness_of :title
  belongs_to :week

  def self.create_url(week)
    public_key = ENV['MARVEL_PUBLIC_KEY']
    private_key = ENV['MARVEL_PRIVATE_KEY']
    ts = Time.now.to_i.to_s
    hash = Digest::MD5.hexdigest("#{ts}#{private_key}#{public_key}")
    url = "http://gateway.marvel.com:80/v1/public/comics?format=comic&formatType=comic&noVariants=true&dateDescriptor=#{week}&ts=#{ts}&apikey=#{public_key}&hash=#{hash}"
  end

  def self.fetch_week(url, week)
    doc = JSON.parse(open(url).read)
    if doc['code'] == 200
      results = doc['data']['results']
      results.each do |comic|
        if comic['description'] == nil
          comic['description'] = 'No description available.'
        else
          comic['description'].gsub!('• ', ' ')
          comic['description'].gsub!("\n", ' ')
        end
        new_comic = Comic.create(:title => comic['title'], :issue_number => comic['issueNumber'], :description => comic['description'], :marvel_id => comic['id'], :week_id => week.id )
        if new_comic.save
          if comic['images'].first == nil
            new_comic.update(:image => 'http://img4.wikia.nocookie.net/__cb20091008022508/marveldatabase/images/3/35/Generic_Comic_Book_Vol_1_1.jpg')
          else
            new_comic.update(:image => comic['images'].first['path'] + "." + comic['images'].first['extension'])
          end
        end
      end
    end
  end

  def self.seed
    weeks = {'lastWeek' => -1, 'thisWeek' => 0, 'nextWeek' => 1}

    weeks.each do |key, value|
      url = Comic.create_url(key)
      week = Week.create(:week_number => Date.today.cweek + value)
      Comic.fetch_week(url, week)
    end
  end
end
