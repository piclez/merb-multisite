class Site
  include DataMapper::Resource

  property :id, Serial

  property :name,         String, :nullable => false
  property :domain,       String
  property :description,  Text
  property :path,         String

  has n, :pages

end
