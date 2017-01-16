class User < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "248x248#", thumb: "35x35#" }

  validates_attachment_content_type :avatar, content_type: ["image/jpeg", "image/jpg", "image/png"]

  enum orientation: [:hetero, :homo, :bi]
  enum sex: [:male, :female]

  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :user_rooms
  has_many :rooms, through: :user_rooms

  has_many :conversations, :foreign_key => :sender_id

  has_many :messages, dependent: :destroy
  has_many :identities, dependent: :destroy

  def twitter
    identities.where( :provider => "twitter" ).first
  end

  def twitter_client
    @twitter_client ||= Twitter.client( access_token: twitter.accesstoken )
  end

  def facebook
    identities.where( :provider => "facebook" ).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end

  def google_oauth2
    identities.where( :provider => "google_oauth2" ).first
  end

  def google_oauth2_client
    if !@google_oauth2_client
      @google_oauth2_client = Google::APIClient.new(:application_name => 'Chatter', :application_version => "1.0.0" )
      @google_oauth2_client.authorization.update_token!({:access_token => google_oauth2.accesstoken, :refresh_token => google_oauth2.refreshtoken})
    end
    @google_oauth2_client
  end

  def nick_from_email
    self.nickname = self.email.split('@').first
    self.save!
  end

  def update_profile(auth)
  #sprawdzanie czy nie nadpisuje
    if self.nickname.nil? then self.nickname = auth.info.nickname end
    self.avatar = auth.info.image
    self.orientation = nil
    self.sex = nil
    self.age = nil
    self.save
  end

  def completed_profile?
    self.nickname.present? && self.age.present? && self.sex.present? && self.orientation.present? && self.image.present?
  end

  def join_to_room(room_id)
  founded = false
  rooms.each do |r|
    if (room_id == r.id)
      founded = true
      break;
    end
  end
  if founded == false
      rooms << Room.find(room_id)
  end
  end

end
