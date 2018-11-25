class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end

# class Genre < ActiveRecord::Base
#   has_many :song_genres
#   has_many :songs, through: :song_genres
#   has_many :artists, through: :songs
# end