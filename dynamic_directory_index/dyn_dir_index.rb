require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @files = Dir.entries("public")[2..-1].sort
  @sort_ascending = true

  erb :home
end

get "/sort_ascending" do
  @files = Dir.entries("public")[2..-1].sort
  @sort_ascending = true

  erb :home
end

get "/sort_descending" do
  @files = Dir.entries("public")[2..-1].sort.reverse
  @sort_ascending = false

  erb :home
end
