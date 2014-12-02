module ApplicationHelper

  def current_link_to(title, url)
    link_to title, url, :class => current_page_class(url)
  end

  def current_posi(target)
    if current_page?(target)
      "lif"
    else
      "lib"
    end
  end

  protected

  def current_page_class(target)
    if current_page?(target)
      "selecta"
    else
      ""
    end
  end

end
