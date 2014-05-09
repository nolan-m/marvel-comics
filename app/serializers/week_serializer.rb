class WeekSerializer < ActiveModel::Serializer
  attributes :id, :week_number
  embed :ids, include: :true
  has_many :comics
end
