module ApplicationHelper
  def paragraph_formater(string)
    # regex = /(http:\/\/)?(www\.)?(\w{2}\w*)(\.\w{2}\w*)/
    # body.gsub(regex, "<a href = 'http://\\2\\3\\4'>\\3</a>") 
    # (<)\w+(>)[\w\s]*(<)\/\w+(>)

    body = string.inspect
    body.gsub!(/(<(?=[^a][^(\/a)]))/, '&lt;')
    body.gsub!(/(href\s*=\s*)(\\*?")([^"]*)(\\*")/, "\\1'\\3'")
    body.gsub!(/\\r\\n/, '<br>')
    body.gsub!(/\\s/, '&nbsp')    
    body.gsub!(/\\t/, '&nbsp &nbsp &nbsp')
    # body.chop!
    # body[0] = ""
    body = body[1...-1]
  end
end



