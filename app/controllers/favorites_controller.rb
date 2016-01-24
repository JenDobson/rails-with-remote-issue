class FavoritesController < ApplicationController
def create
    @reader = Reader.find(params[:reader_id])
    @book = Book.find(params[:book_id])
    @reader.add_favorite(Book.find(params[:book_id]))
    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end

  def destroy
    fav = Favorite.find(params[:id])
    @book = Book.find(fav.book_id)
    @reader = Reader.find(fav.reader_id)
    fav.destroy
    respond_to do |format|
      format.html { redirect_to @book }
      format.js
    end
  end
end
