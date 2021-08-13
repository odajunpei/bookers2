class BooksController < ApplicationController
  
  def _new
    @book = Book.new
    @user = user.all
  end
  
  def create
    @book = book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @books = Book.all
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  
    def post_image_params
    params.require(:book).permit(:title, :opinion)
    end
end
