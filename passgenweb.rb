require 'rubygems'
require 'sinatra'
require 'haml'
require File.join(File.dirname(__FILE__),'passgen')

get '/' do
  haml :pass_form
end

# convert the params into a uri
get '/action' do
  redirect "/passgen/#{params[:number]}/#{params[:length]}"
end

get '/passgen/:number/:length' do |num,len|
  @passwords = Passgen.new.generate_series(num,len)
  haml :passwords
end

get '/stylesheet.css' do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass :stylesheet
end