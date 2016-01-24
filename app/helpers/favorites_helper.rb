module FavoritesHelper
   def favorites_link_for(reader, book)
    if reader && Favorite.exists?(book_id: book.id, reader_id: reader.id)
      link_to("Remove From Favorites", favorite_path(Favorite.find_by(book_id: book.id, reader_id: reader.id)), :method => 'delete', remote: true, id: "add_remove_favorites_link")
                                  
    elsif reader && !Favorite.exists?(book_id: book.id, reader_id: reader.id)
      link_to("Add To Favorites", favorites_path(book_id: book.id, reader_id: reader.id), :method => 'post', remote: true,  id: "add_remove_favorites_link")
    end
  end
end
