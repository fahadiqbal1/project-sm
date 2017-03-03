module CoursesHelper
  def badge(x)
    sanitize(
      "<span class='badge badge-pill badge-primary'>#{x.capitalize}</span>"
    )
  end
end
