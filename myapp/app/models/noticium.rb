class Noticium < ApplicationRecord
  has_many :comments, dependent: :destroy

end
