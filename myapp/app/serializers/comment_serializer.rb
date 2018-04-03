class CommentSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :timestamps
end
