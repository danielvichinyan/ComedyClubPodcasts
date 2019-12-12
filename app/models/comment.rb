class Comment < ApplicationRecord
  belongs_to :podcast
  belongs_to :user

  validates :content, :presence => true, length: {minimum: 3}
end
