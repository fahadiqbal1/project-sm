module ApplicationHelper
  def markdown(text)
    options = {
      :filter_html => true, :hard_wrap => true,
      :link_attributes => { :rel => "nofollow", :target => "_blank" },
      :space_after_headers => true, :fenced_code_blocks => true
    }

    extensions = {
      :autolink => true,
      :superscript => true,
      :disable_indented_code_blocks => true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    sanitize markdown.render(text),
             :attributes => %w(type class data-dismiss rel target href)
  end

  def yesno(x)
    x ? "Yes" : "No"
  end
end
