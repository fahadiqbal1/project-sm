module CoursesHelper
  def badge(x, text, _pill=false)
    if x
      sanitize("<span class='badge badge-pill badge-primary'>#{text}</span>")
    else
      sanitize("<span class='badge badge-pill badge-danger'>Not #{text}</span>")
    end
  end
end
