class Category < ApplicationRecord
  belongs_to :user

  has_many :messages_categories
  has_many :messages, through: :messages_categories
end
