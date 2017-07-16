class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Association
  has_many :bookings

  # callback for generate API
  before_create :generate_api_key

  def generate_api_key
    self.api_key = SecureRandom.hex
  end
end
