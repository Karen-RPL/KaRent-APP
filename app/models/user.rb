class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :validate_username, on: %i[create]
  has_one_attached :avatar
  after_validation :add_default_avatar, on: %i[create update]

  attr_writer :login
  has_one :company


  enum role: {customer: 0, owner: 10, admin: 99}, _default: 0

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "150x150!").processed
    else
      '/default_profiles.png'
    end
  end


  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def validate_username
    if User.where(username: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def company_exist?
    User.find(id).company != nil
  end

  private
    def add_default_avatar
      unless avatar.attached?
        avatar.attach(
          io: File.open(
            Rails.root.join(
              "app", "assets", "images", "default_profile.jpg"
            )
          ), filename: "default_profile.jpg",
          content_type: "'image/jpeg'"
        )
      end
    end
end
