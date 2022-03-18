class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true
  validates :content, length: { minimum: 4, maximum: 150 }

  scope :created_today, -> { where('created_at < ? ', Time.now - 5.minutes)}
  scope :with_legth, -> { where("LENGTH(content) > 1") }
end
