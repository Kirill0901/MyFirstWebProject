class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def created_at
    attributes['created_at'].strftime("%d.%m.%Y %H:%m")
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
