class GenresController < ApplicationController
    def index
        @genres = Genre.all
        @backpath = root_path
    end

    def show
        @movies = Movie.all
        @genre = Genre.find(params[:id])
        @backpath = genres_path
    end

    def new
        @genre = Genre.new
        @backpath = genres_path
    end

    def create
        @genre = Genre.new(name: params[:genre][:name])

        if @genre.save
            flash[:notice] = 'Gênero cadastrado com sucesso!'
            return redirect_to new_genre_path
        else
            flash.now[:error] = "Não foi possível cadastrar o gênero!"
            render action: "new"
        end
    end

    def edit
        @genre = Genre.find(params[:id])
        @backpath = genre_path
    end

    def update
        @genre = Genre.find(params[:id])

        if @genre.update(name: params[:genre][:name])
            flash[:notice] = "Gênero atualizado com sucesso!"
            return redirect_to @genre
        end
        render :edit
    end
end