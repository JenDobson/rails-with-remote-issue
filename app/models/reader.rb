class Reader < ActiveRecord::Base
  has_many :favorites, class_name: "Favorite",
                        foreign_key: "reader_id",
                        dependent: :destroy
  
  has_many :books, through: :favorites
 
  def add_favorite(book)
    return if Favorite.exists?(book_id:book.id,reader_id:self.id)
    favorites.create(book_id: book.id, reader_id: self.id)
    self.reload
  end

end
