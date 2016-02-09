class Link
  include DataMapper::Resource
  
  property :id,          Serial
  property :link,        String
  property :link_txt,    String
  property :description, Text
end
