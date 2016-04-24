module ApplicationHelper

  def nav
    if user_signed_in?
      render partial: 'layouts/nav'
    end
  end

  def nav_name
    if current_user.name.nil?
      'Bienvenido/a'
    else
      current_user.name
    end
  end

end
