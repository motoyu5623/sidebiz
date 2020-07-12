class User < ApplicationRecord
  has_one :main_job,
    -> { where(is_main: true) },
    class_name: 'Job',
    autosave: true
  
  has_many :jobs,
    -> { where(is_main: false)},
    class_name: 'Job'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { maximum: 50 }
  validates :birthday, presence: true
  validates :profile, length: { maximum: 300 }
end
