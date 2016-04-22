class Message < ApplicationRecord
  belongs_to :user

  has_many :messages_categories
  has_many :categories, through: :messages_categories

  enum privacy: [:public,:private,:group]
end
