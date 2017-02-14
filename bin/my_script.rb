require 'addressable/uri'
require 'rest-client'

def index_users
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users.html'
    ).to_s

    puts RestClient.get(url)
end

def req_user_5
  url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/5.json',
  query_values: {
    'some_category[a_key]' => 'another value',
    'some_category[a_second_key]' => 'yet another value',
    'some_category[inner_inner_hash][key]' => 'value',
    'something_else' => 'aaahhhhh'
  }
  ).to_s

  puts RestClient.get(url)
end

def create_user(username)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { username: username } }
  )
end

def destroy_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/2.json'
  ).to_s

  puts RestClient.delete(url)
end

def show_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/3.json'
  ).to_s

  puts RestClient.get(url)
end

show_user
# begin
# create_user("Gizmo", "gizmo@gizmo.gizmo")
# rescue
#   puts "rescue"
# end

#index_users
#req_user_5
