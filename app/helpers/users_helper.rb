module UsersHelper

  def error_message_for(model, attribute)
    if model.errors[attribute]
      content_tag :div, class: :errors do
        model.errors[attribute].join(', ')
      end
    end
  end

end
