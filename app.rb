require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:database.sqlite3"

set :sessions, true
require 'bundler/setup'
require 'rack-flash'
use Rack::Flash, :sweep => true

configure(:development) {set :database, "sqlite3:exampledb.sqlite3"}

require './models.rb'

get '/sign-up' do
  erb :sign_up
end

post '/sign-up-process' do
  @user = User.create
  @user.username = params[:username]
  @user.password = params[:password]
  @user.email = params[:email]
  @profile = Profile.create
  @profile.fname = params[:fname]
  @profile.lname = params[:lname] 
  @profile.user_id = @user.id
  @user.save
  @profile.save
end

get '/' do 
  redirect '/sign-in'
end

get '/sign-in' do
  erb :sign_up
end

get '/home' do
  erb :home
end

#in app.rb
configure(:development){set :
database, "sqlite:///blog.sqlite3"}