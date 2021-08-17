class BooksController < ApplicationController

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
        redirect_to book_path(@book), notice: 'Book was successfully created.'
      else
        @books = Book.all
        render :index
      end
  end

  def index
    @users= User.all
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

  def show
    @users = User.all
    @user = current_user
    @books = @user.books
    @book = Book.new
  end
 
 def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
 end
 
  private

    def book_params
    params.require(:book).permit(:title, :body)
    end
end
