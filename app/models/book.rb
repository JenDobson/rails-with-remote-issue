class Book < ActiveRecord::Base
  has_many :favorites, class_name: "Favorite",
                        foreign_key: "book_id",
                        dependent: :destroy
  
  has_many :readers, through: :favorites
  
end
