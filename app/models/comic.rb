require 'open-uri'

class Comic < ActiveRecord::Base
  def self.create_url
    public_key = ENV['MARVEL_PUBLIC_KEY']
    private_key = ENV['MARVEL_PRIVATE_KEY']
    ts = Time.now.to_i.to_s
    hash = Digest::MD5.hexdigest("#{ts}#{private_key}#{public_key}")
    uri = "http://gateway.marvel.com:80/v1/public/comics?format=comic&formatType=comic&noVariants=true&dateDescriptor=thisWeek&ts=#{ts}&apikey=#{public_key}&hash=#{hash}"
  end

  def self.this_week(url)
    doc = Nokogiri::HTML(open(url))
    info = JSON.parse(doc)
    if info['code'] == 200
      results = info['data']['results']
      results.each do |comic|
        if Comic.last.week_number != Date.today.cweek
          new_comic = Comic.create(:title => comic['title'], :issueNumber => comic['issueNumber'], :description => comic['description'], :marvel_id => comic['id'], :week_number => Date.today.cweek )
          if comic['images'].first != nil
            new_comic.update(:image => comic['images'].first['path'] + "." + comic['images'].first['extension'])
          end
        end
      end
    end
  end

end
