class Week < ActiveRecord::Base
  has_many :comics
  validates_uniqueness_of :week_number
end
