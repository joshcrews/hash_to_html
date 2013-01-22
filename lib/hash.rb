unless defined?(Rails)
  require 'active_support/concern'
  require 'action_view/helpers/capture_helper'
  require 'action_view/helpers/tag_helper'
  require 'active_support/core_ext/string/inflections'
end

class Hash

  include ActionView::Helpers::TagHelper
  
  def to_html
    hash_to_list_items(self)
  end

  private

  def hash_to_list_items(hash)
    html = hash.map do |key, value|
      if value.is_a?(Hash)
        inner_html = hash_to_list_items(value)
        content_tag(:li, "#{key.to_s.humanize}: #{inner_html}".html_safe)
      else
        content_tag(:li, "#{key.to_s.humanize}: #{value}".html_safe)
      end
    end.join("\n")
    content_tag(:ul, "\n#{html}\n".html_safe) + "\n"
  end
  
end
