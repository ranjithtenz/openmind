# 
# string_utils.rb
# 
# Created on Jan 29, 2008, 3:34:37 PM
# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

module StringUtils
  # I create this method here because the pluralize that is used in screens is
  # only available from within the rhtml or helper file
  def self.pluralize count, noun
    return "#{count} #{noun}" if count == 1
    "#{count} #{ActiveSupport::Inflector.pluralize noun}"
  end
  
  def self.strip_html str
    str.gsub(/<\/?[^>]*>/, "")
  end
  
  def self.truncate(string, length)
    s = string.slice(0..length - 1)
    s = s + "..." if s.length < string.length
    s
  end

  def self.strip_wildcards str
    str.gsub(/[*?"'"]*/,'') unless str.nil?
  end

  def self.init_cap str
    str.gsub(/\b\w/){$&.upcase}
  end

  def self.sanitize_search_terms search
    search.gsub(/^[\s\*?]*/, "").downcase unless search.nil?
  end
  
#  def self.strip_html_tags html    
#    #remove <script ...>...</script> tags
#    html = html.gsub(/<script(.*)>(.*)<\/script(.*)>/, "")
#
#    html = html.gsub(/(:on(blur|c(hange|lick)|dblclick|focus|keypress|(key|mouse)(down|up)|(un)?load|mouse(move|o(ut|ver))|reset|s(elect|ubmit)))/, "");
#    html = html.gsub(/<(.*?)$event_attribs=(.*?)(\s*?)(.*?)>/, "")
#
#    #remove href=javascript:
#    html = html.gsub(/<(.*?)javascript\:(.*?)/, "")
#    html
#  end
end
