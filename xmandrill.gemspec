Gem::Specification.new do |s|
  s.name = "xmandrill"
  s.authors = ["Xin Fan (Fred)"]
  s.version = "0.0.2"
  s.email = "fredxinfan@gmail.com"
  s.summary = "A simple API wrapper for Mandrill."
  s.files = ["xmandrill.gemspec", "lib/xmandrill.rb", "lib/xmandrill/api.rb"]
  
  s.add_dependency("mustache",[">= 0"])
  s.add_dependency("httparty",[">= 0"])
  s.add_dependency("json",[">= 0"])
end