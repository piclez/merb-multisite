class Page
  include DataMapper::Resource

  property :id, Serial

  property :site_id,  Integer, :nullable => false, :index => true
  property :name,     String
  property :body,     Text

  belongs_to :site

end
