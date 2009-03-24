Factory.define :page do |p|
  p.name    'Welcome'
  p.body    'MerbMultiSite demo app is very sexy.'
  p.association :site
end
