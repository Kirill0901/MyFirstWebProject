class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def created_at
    attributes['created_at'].strftime("%d.%m.%Y %H:%m")
  end
end
