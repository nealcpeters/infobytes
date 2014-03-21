module ApplicationHelper
  def add_hyper_links(string)
    regex = /(http:\/\/)?(www\.)?(\w{2}\w*)(\.\w{2}\w*)/
    body = string
    body.gsub(regex, "<a href = 'http://\\2\\3\\4'>\\3</a>") 
  end
end
