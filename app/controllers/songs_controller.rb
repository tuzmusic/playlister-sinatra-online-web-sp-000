require 'sinatra/base'
require 'sinatra/flash'

class SongsController < ApplicationController
  enable :sessions
  register Sinatra::Flash
  
  # Index action
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  # Create action
  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    song = Song.create(params[:song])
    if artist = Artist.find_by_slug(params[:artist][:name]).first
      song.artist = artist
    else 
      song.artist = Artist.create(name:params[:artist][:name])
    end 
    song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}" 
  end

  # Show action
  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end 

  # Edit action

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'

    redirect "/songs/#{song.slug}" 
  end

end
