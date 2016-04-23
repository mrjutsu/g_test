class Message < ApplicationRecord
  belongs_to :user

  has_many :messages_categories, dependent: :destroy
  has_many :categories, through: :messages_categories

  enum privacy: [:visible,:invisible,:groups]

  validates :body, presence: { message: 'El mensaje no puede estar vacío.' }
  # validates :messages_categories, presence: { message: 'El mensaje necesita al menos una categoría.' }

  scope :public_messages, -> (id) { where(privacy: 0).or( Message.where( privacy: 1, user_id: id ) ).order(created_at: :desc) }

  scope :visible_messages, -> (id,ids) { self.public_messages(id) + Message.find( GroupsMessage.groups_messages(ids) ) }

end
