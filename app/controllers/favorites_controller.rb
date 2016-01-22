class FavoritesController < ApplicationController
def create
    reader = Reader.find(params[:reader_id])
    @book = Book.find(params[:book_id])
    reader.add_favorite(Book.find(params[:book_id]))
    redirect_to @book
  end

  def destroy
    fav = Favorite.find(params[:id])
    @book = Book.find(fav.book_id)
    fav.destroy
    redirect_to @book
  end
end
