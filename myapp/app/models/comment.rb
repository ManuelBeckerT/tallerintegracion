class Comment < ApplicationRecord
  belongs_to :noticium
  validates :name, presence: true
  validates :body, presence: true
end
