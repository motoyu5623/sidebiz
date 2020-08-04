class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :side_job
end
