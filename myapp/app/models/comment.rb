class Comment < ApplicationRecord
  belongs_to :noticium
  validates :title, presence: true
  validates :body, presence: true
end
