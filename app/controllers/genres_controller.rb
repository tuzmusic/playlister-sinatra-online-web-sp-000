class GenresController < ApplicationController

  # Index action
  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

end
