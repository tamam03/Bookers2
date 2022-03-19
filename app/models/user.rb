class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
  # （パスワードの正確性を検証）
  :registerable,
  # （ユーザ登録や編集、削除）
  :recoverable,
  # （パスワードをリセット）
  :rememberable,
  # （ログイン情報を保存）
  :validatable
  # （email のフォーマットなどのバリデーション）

    has_one_attached :image
    
    has_many :books,dependent: :destroy
end
