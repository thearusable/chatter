class User < ActiveRecord::Base
  has_many :identities

  devise :omniauthable, :omniauth_providers => [:google_oauth2, :twitter, :facebook]

  #def self.create_with_omniauth(info)
  #  create(name: info['name'])
  #end

  SOCIALS = {
  facebook: 'Facebook',
  google_oauth2: 'Google',
  linkedin: 'Linkedin'
}

def self.from_omniauth(auth, current_user)
  identity = Identity.where(:provider => auth.provider, :uid => auth.uid.to_s,
                                      :token => auth.credentials.token,
                                      :secret => auth.credentials.secret).first_or_initialize
  identity.profile_page = auth.info.urls.first.last unless identity.persisted?
  if identity.user.blank?
    user = current_user.nil? ? User.where('email = ?', auth['info']['email']).first : current_user
    if user.blank?
      user = User.new
      #user.skip_confirmation!
      user.password = Devise.friendly_token[0, 20]
      user.fetch_details(auth)
      user.save
    end
    identity.user = user
    identity.save
  end
  identity.user
end

def fetch_details(auth)
  self.name = auth.info.name
  self.email = auth.info.email
  self.photo = URI.parse(auth.info.image)
end

end
