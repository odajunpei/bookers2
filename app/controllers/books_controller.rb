class BooksController < ApplicationController

  def _new
    @book = Book.new
    @user = user.all
  end

  def create
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path, notice: 'Book was successfully created.'
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end


  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

    def book_params
    params.require(:book).permit(:title, :opinion)
    end
end
