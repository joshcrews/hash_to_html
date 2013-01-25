class Hash

  def to_html
    hash_to_list_items(self)
  end

  private

  def hash_to_list_items(hash)
    html = hash.map do |key, value|
      if value.is_a?(Hash)
        inner_html = hash_to_list_items(value)
        "<li>#{humanize(key.to_s)}: #{inner_html}</li>"
      else
        "<li>#{humanize(key.to_s)}: #{value}</li>"
      end
    end.join("\n")
    "<ul>\n#{html}\n</ul>\n"
  end

  #
  # mostly borrowed from Rails
  #
  def humanize(string)
    string.gsub(/_/, ' ').gsub(/\b('?[a-z])/) { $1.capitalize }
  end
  
end
