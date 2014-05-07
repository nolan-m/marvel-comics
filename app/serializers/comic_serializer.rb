class ComicSerializer < ActiveModel::Serializer
  attributes :id, :marvel_id, :title, :issueNumber, :description, :image
end
