module GroupsHelper

  def count_users group
    if group.participants.empty?
      'Grupo vacío'
    elsif group.participants == 1
      '1 persona'
    else
      group.participants.count.to_s + ' personas'
    end
  end

  def group_messages group
    if group.messages.empty?
      '0 mensajes'
    elsif group.messages.count == 1
      '1 mensaje'
    else
      group.messages.count.to_s + ' mensajes'
    end
  end

end
