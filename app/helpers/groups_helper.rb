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

  def join_leave_group group
    if current_user.joined_groups.include? group
      link_to 'Salir Del Grupo', leave_group_path( group.slug ), method: :delete
    else
      link_to 'Unirse Al Grupo', join_group_path( group.slug ), method: :post
    end
  end

end
