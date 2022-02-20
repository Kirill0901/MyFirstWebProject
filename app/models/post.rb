class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :title, :body, :category_id, :rating, presence: true

  def created_at
    attributes['created_at'].strftime("%d.%m.%Y %H:%m")
  end
end
