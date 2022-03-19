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
    # book変数保存
    @book.save
    redirect_to book_path(@book.id)



  end

  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end



  # ストロングパラメータ

  private

  def book_params
    params.require(:book).permit(:title, :caption)
  end
end
