class Group < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged]

  belongs_to :user

  has_many :groups_messages, dependent: :destroy
  has_many :messages, through: :groups_messages, source: :message, dependent: :destroy

  has_many :users_groups, dependent: :destroy
  has_many :participants, through: :users_groups, source: :user

  validates :name, presence: { message: 'El grupo debe tener un nombre.' }

  after_create do
    self.join_creator
  end

  def join_creator
    UsersGroup.create( group_id: self.id, user_id: self.user_id )
  end

end
