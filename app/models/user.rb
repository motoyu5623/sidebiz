class User < ApplicationRecord
  # has_many :jobs
  has_many :main_jobs, dependent: :destroy
  # ,
  #         -> { where(is_main: true) },
  #         class_name: 'Job',
  #         autosave: true,
  #         dependent: :destroy

  has_many :side_jobs, dependent: :destroy
  #  -> { where(is_main: false) },
  #  class_name: 'Job',
  #  dependent: :destroy

  has_many :stocks, dependent: :destroy
  has_many :stock_side_jobs, through: :stocks, source: :side_job

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { maximum: 50 }
  validates :birthday, presence: true
  validates :profile, length: { maximum: 300 }
end
