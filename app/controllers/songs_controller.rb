class SongsController < ApplicationController

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

  # Show action
  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end 

end
