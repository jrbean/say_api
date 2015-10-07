require "sinatra/base"
require "json"
require "pry"
# require "./voices.txt"

#Voices = File.read("./voices.txt")
class Say < Sinatra::Base
  set :bind, "0.0.0.0"
  set :logging, true


  get "/say" do
  "Post a request with parameters :voice and :phrase."
  end

  post "/say" do
    voice = params[:voice] || "kyoko"
    phrase = params[:phrase]
    allowed_chars = ["a".."z", " "]
    if phrase.downcase.chars.all? { |c| allowed_chars.include? c }
      system "say -v #{voice} #{phrase}"
    else
      status 400
      body "Please use only characters from A - Z."
    end
  end

end


Say.run!
