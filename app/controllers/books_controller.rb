class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    # 新規登録
    @book = Book.new(book_params)
    # "[モデル名].[カラム名]" 保存するカラムの中身を操作
    # current_user は、現在ログイン中のユーザーに関する情報を取得できる
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)



  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user



  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
   @book = Book.find(params[:id])
   @book.update(book_params)
   redirect_to book_path(@book.id)
  end

  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to books_path

  end



  # ストロングパラメータ

  private

  def book_params
    params.permit(:title, :body)
  end
end
