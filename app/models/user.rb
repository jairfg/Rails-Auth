class User < ApplicationRecord
  # Devise configuration
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable,
         :omniauthable, omniauth_providers: [:google_oauth2] 

  include Authenticatable
end