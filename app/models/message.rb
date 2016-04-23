class Message < ApplicationRecord
  belongs_to :user

  has_many :messages_categories, dependent: :destroy
  has_many :categories, through: :messages_categories

  has_many :groups_messages, dependent: :destroy
  has_many :groups, through: :groups_messages, source: :group, dependent: :destroy

  enum privacy: [:visible,:invisible,:groups]

  validates :body, presence: { message: 'El mensaje no puede estar vacío.' }
  # validates :messages_categories, presence: { message: 'El mensaje necesita al menos una categoría.' }

  accepts_nested_attributes_for :messages_categories, :allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :groups_messages, :allow_destroy => true, reject_if: :all_blank

  scope :public_messages, -> (id) { where(privacy: 0).or( Message.where( privacy: 1, user_id: id ) ).order(created_at: :desc) }

  scope :groups_messages, -> (ids) { Message.find( GroupsMessage.groups_messages(ids) ).order(created_at: :desc) }
  scope :feed, -> (id,ids) {
    public_messages = self.public_messages(id)
    group_messages = GroupsMessage.groups_messages(ids)
    messages = public_messages + group_messages
    Message.where( id: messages ).order(created_at: :desc)
  }

end
