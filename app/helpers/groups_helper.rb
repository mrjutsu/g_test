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
end
