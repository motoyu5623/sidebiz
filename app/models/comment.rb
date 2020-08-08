class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :side_job
  validates :content, presence: true, length: { maximum: 300}
end
