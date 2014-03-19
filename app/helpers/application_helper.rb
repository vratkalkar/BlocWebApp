module ApplicationHelper
  def form_group_tag(errors,&block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end
  
def markdown(text)
  renderer = Redcarpet::Render::HTML.new
  extensions = {fences_code_blocks: true}
  redcarpet = Redcarpet::Markdown.new(renderer, extensions)
  (redcarpet.render text).html_safe
  end
 end

