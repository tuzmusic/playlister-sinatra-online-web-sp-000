class SongsController < ApplicationController

  # Index action
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

end
