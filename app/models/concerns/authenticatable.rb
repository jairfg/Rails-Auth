module Authenticatable
  extend ActiveSupport::Concern

  included do
    validates :username, presence: true, 
                         uniqueness: { case_sensitive: false },
                         length: { minimum: 3, maximum: 20 },
                         format: { 
                           with: /\A[a-zA-Z0-9_]+\z/, 
                           message: "only allows letters, numbers and underscores" 
                         }

    attr_writer :login
  end

  def login = @login || username || email

  class_methods do
    def find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      
      if (login = conditions.delete(:login))
        where(conditions.to_h).find_by(
          "lower(username) = :value OR lower(email) = :value",
          value: login.downcase
        )
      else
        find_by(conditions.to_h)
      end
    end

    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.username = auth.info.email.split('@').first + SecureRandom.hex(3)
        user.skip_confirmation!
      end
    end
  end
end