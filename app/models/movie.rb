class Movie < ApplicationRecord
    enum status: {draft: 0, published: 2}
    belongs_to :genre
    belongs_to :director
    validates :title, :release_year, :synopsis, :country_of_origin, :time, :director_id, :genre_id, presence: { message: "precisa ser preenchido!" }
end
