class ComicSerializer < ActiveModel::Serializer
  attributes :id, :marvel_id, :title, :issue_number, :description, :image
end
