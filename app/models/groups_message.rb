class GroupsMessage < ApplicationRecord
  belongs_to :group
  belongs_to :message
end
