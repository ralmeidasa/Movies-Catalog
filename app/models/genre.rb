class Genre < ApplicationRecord
    has_many :movies
    validates :name, presence: {message: "precisa ser preenchido!"}
end
