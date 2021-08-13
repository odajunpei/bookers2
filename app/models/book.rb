class Book < ApplicationRecord
 
  belongs_to :User
  attachment :title,:opinion
  
end
