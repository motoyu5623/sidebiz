class User < ApplicationRecord
  # has_many :jobs
  has_many :main_jobs, dependent: :destroy
  has_many :side_jobs, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :stock_side_jobs, through: :stocks, source: :side_job
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { maximum: 50 }
  validates :birthday, presence: true
  validates :profile, length: { maximum: 400 }

  def self.guest
    find_or_create_by!(email: 'guest@example.com', username: 'ゲストユーザー', birthday: '2000/1/1') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
