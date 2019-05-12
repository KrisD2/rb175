require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

helpers do
  def count_interests
    @users.each_with_object([]) do |user, array|
      array << @user_data[user][:interests]
    end.flatten.size
  end
end

before do
  @user_data = YAML.load(File.read("users.yaml"))
  @users = @user_data.keys
end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :users
end

get "/:user" do
  @user = params[:user].to_sym
  @other_users = @users - [@user]

  erb :user
end
