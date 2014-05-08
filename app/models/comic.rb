require 'open-uri'

class Comic < ActiveRecord::Base
  validates_uniqueness_of :title
  def self.create_url
    public_key = ENV['MARVEL_PUBLIC_KEY']
    private_key = ENV['MARVEL_PRIVATE_KEY']
    ts = Time.now.to_i.to_s
    hash = Digest::MD5.hexdigest("#{ts}#{private_key}#{public_key}")
    uri = "http://gateway.marvel.com:80/v1/public/comics?format=comic&formatType=comic&noVariants=true&dateDescriptor=nextWeek&ts=#{ts}&apikey=#{public_key}&hash=#{hash}"
  end

  def self.next_week(url)
    doc = JSON.parse(open(url).read)
    if doc['code'] == 200
      results = doc['data']['results']
      results.each do |comic|
        new_comic = Comic.create(:title => comic['title'], :issue_number => comic['issueNumber'], :description => comic['description'], :marvel_id => comic['id'], :week_number => (Date.today.cweek + 1) )
        if comic['images'].first != nil
          if new_comic.save
            new_comic.update(:image => comic['images'].first['path'] + "." + comic['images'].first['extension'])
          end
        end
      end
    end
  end

end
