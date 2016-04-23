class GroupsMessage < ApplicationRecord
  belongs_to :group
  belongs_to :message

  scope :groups_messages, -> (groups_ids) { where(group_id: groups_ids).order(created_at: :desc).pluck(:message_id) }

end
