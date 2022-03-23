class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    # 新規登録
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:success] = 'You have created book successfully.'
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    @user = current_user
      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new

  end

  def show
    @book_find = Book.find(params[:id])
    @user = @book_find.user
    @book = Book.new


  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
     render "edit"
    else
     redirect_to books_path
    end
  end


  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
  flash[:success] = 'You have updated book successfully.'
   redirect_to book_path(@book.id)
   else
   render :edit
   end
  end


  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to books_path

  end



  # ストロングパラメータ

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
