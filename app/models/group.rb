class Group < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged]

  belongs_to :user

  has_many :groups_messages, dependent: :destroy
  has_many :messages, through: :groups_messages, dependent: :destroy

  has_many :users_groups, dependent: :destroy
  has_many :participants, through: :users_groups, class_name: 'User'

  validates :name, presence: { message: 'El grupo debe tener un nombre.' }

end
