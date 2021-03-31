class BooksController < ApplicationController
before_action :authenticate_user!
before_action :ensure_correct_user, {only: [:edit, :update]}
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      render 'index'
    end

  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def ensure_correct_user
    @user = Book.find(params[:id]).user
	  if current_user.id != @user.id
		  flash[:notice] = "権限がありません"
		  redirect_to books_path
	  end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)

      flash[:updated] = "Book was successfully updated."

      redirect_to book_path(@book.id)

    else

      render 'edit'

    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
