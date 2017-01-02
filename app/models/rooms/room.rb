class Room < ApplicationRecord
  has_attached_file :image, styles: { medium: "248x248>", thumb: "40x40>" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :user, through: :conversations
  has_many :messages, dependent: :destroy

  validates_presence_of :title, presence: true
  validates_presence_of :category, presence: true
  validates_presence_of :description, presence: true
  validates_presence_of :owner_id, presence: true
  validates_presence_of :users_count, presence: true

end
