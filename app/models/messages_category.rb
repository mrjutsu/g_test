class MessagesCategory < ApplicationRecord
  belongs_to :category
  belongs_to :message
end
