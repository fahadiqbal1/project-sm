module ErrorMessagesHelper
  def error_messages_for(objects)
    return "" if objects.errors.empty?

    messages = objects
               .errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-danger"> <button type="button"
    class="close" data-dismiss="alert">×</button>
      #{messages}
    </div>
    HTML

    sanitize html,
             :tags => %w(div button),
             :attributes => %w(type class data-dismiss)
  end
end
