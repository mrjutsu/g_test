class Message < ApplicationRecord
  belongs_to :user

  has_many :messages_categories
  has_many :categories, through: :messages_categories

  enum privacy: [:public,:private,:group]

  validates :body, presence: { message: 'El mensaje no puede estar vacío.' }
  validates :messages_categories, presence: { message: 'El mensaje necesita al menos una categoría.' }

end