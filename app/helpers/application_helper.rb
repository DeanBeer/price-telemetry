module ApplicationHelper

  def title_and_banner(text)
    title_content text
    content_tag :h2, text, class: 'page_title', id: 'page_title'
  end

  def title_content(title)
    content_for(:title) { title }
  end

end
