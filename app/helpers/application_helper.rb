module ApplicationHelper
  def nav
    if user_signed_in?
      render partial: 'layouts/nav'
    end
  end
end
