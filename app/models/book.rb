class Book < ApplicationRecord
 
  belongs_to :User
  validates :title,presence: true
  validates :opinion, presence: true
end
