class SideJob <  ApplicationRecord
  belongs_to :user, foreign_key:"user_id"
  belongs_to :main_job

  has_many :skills, dependent: :destroy
  accepts_nested_attributes_for :skills, allow_destroy: true
end
