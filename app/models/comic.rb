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
        if comic['description'] == nil
          comic['description'] = 'No description available.'
        else
          comic['description'].gsub!('• ', ' ')
          comic['description'].gsub!("\n", ' ')
        end
        new_comic = Comic.create(:title => comic['title'], :issue_number => comic['issueNumber'], :description => comic['description'], :marvel_id => comic['id'], :week_number => (Date.today.cweek + 1) )
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

end
