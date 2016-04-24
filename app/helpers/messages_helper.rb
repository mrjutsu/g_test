module MessagesHelper

  def posted_to message
    grupos = []
    if message.groups.empty?
      grupos
    else
      current_user.joined_groups.each do |g|
        ( message.groups.include? g ) ? grupos.push(g) : ''
      end
      grupos
    end
  end

end
