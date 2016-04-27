module ApplicationHelper

  def nav
    if user_signed_in?
      render partial: 'layouts/nav'
    end
  end

  def nav_name
    current_user.show_name
  end

end
