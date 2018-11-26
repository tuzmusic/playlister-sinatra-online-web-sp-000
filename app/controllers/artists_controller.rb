class ArtistsController < ApplicationController

  # Index action
  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

end
