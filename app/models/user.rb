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

    has_one_attached :profile_image

    has_many :books,dependent: :destroy
    has_many :view_counts, dependent: :destroy

    def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
    end

    validates :name,
    presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
    validates :introduction, length: { maximum: 50 }



end
