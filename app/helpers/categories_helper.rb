module CategoriesHelper
  def count_messages category
    if category.messages.empty?
      'No hay mensajes'
    elsif category.messages == 1
      '1 mensaje'
    else
      category.messages.count.to_s + ' mensajes'
    end
  end
end
