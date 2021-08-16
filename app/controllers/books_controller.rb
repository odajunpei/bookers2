class BooksController < ApplicationController

  def _list
    @book = Book.new
    @user = user.all
  end

  def create
      @user = current_user
      @book = Book.new(book_params[:id])
      if @book.save
        redirect_to books_path(@book), notice: 'Book was successfully created.'
      else
        @books = Book.all
        render :index
      end
  
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end


  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end

  private

    def book_params
    params.require(:book).permit(:Title, :Opinion)
    end
end
