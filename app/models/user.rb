class User < ApplicationRecord
  # has_many :jobs
  has_many :main_jobs, dependent: :destroy
  has_many :side_jobs, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :stock_side_jobs, through: :stocks, source: :side_job
  has_many :comments
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: { maximum: 50 }
  validates :profile, length: { maximum: 400 }
  validate :validate_avatar

  def validate_avatar
    return unless avatar.attached?

    if avatar.blob.byte_size > 3.megabytes
      avatar.purge
      errors.add(:avatar, 'アップロード可能なファイルの最大サイズは３GBです')
    elsif !image?
      avatar.purge
      errors.add(:avatar, 'アップロード可能なファイルの形式は、jpg, jpeg, gif, pngです')
    end
  end

  def image?
    %w[image/jpg image/jpeg image/gif image/png].include?(avatar.blob.content_type)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com', username: 'ゲストユーザー', birthday: '2000/1/1') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
