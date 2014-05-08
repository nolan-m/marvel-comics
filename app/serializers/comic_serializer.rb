class ComicSerializer < ActiveModel::Serializer
  attributes :id, :marvel_id, :title, :issue_number, :description, :image, :week_number
end
