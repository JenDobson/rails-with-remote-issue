module BooksHelper
    # Returns the Favorites icon for the given song and user.
  def favorites_link_for(reader, book)
    if reader && Favorite.exists?(book_id: book.id, reader_id: reader.id)
      link_to("Remove From Favorites", Favorite.find_by(book_id: book.id, reader_id: reader.id), :method => 'delete', remote: true)
                                  
    elsif reader && !Favorite.exists?(book_id: book.id, reader_id: reader.id)
      link_to("Add To Favorites", favorites_path(book_id: book.id, reader_id: reader.id), :method => 'post', remote: true)
    end
  end
end
