class MoviesController < ApplicationController
    def index
        @movies_published = Movie.published
        @movies_draft = Movie.draft
        @backpath = root_path
    end

    def show
        @movie = Movie.find(params[:id])
        @backpath = movies_path
    end

    def new
        @movie = Movie.new
        @backpath = movies_path
    end

    def create
        @movie = Movie.new( title: params[:movie][:title],
                            release_year: params[:movie][:release_year],
                            synopsis: params[:movie][:synopsis],
                            country_of_origin: params[:movie][:country_of_origin],
                            time: params[:movie][:time],
                            director_id: params[:movie][:director_id],
                            genre_id: params[:movie][:genre_id]
        )
        if @movie.save
            flash[:notice] = 'Filme cadastrado com sucesso!'
            return redirect_to new_movie_path
        else 
            flash.now[:error] = "Não foi possível cadastrar o livro!"
            render action: "new"
        end
    end

    def edit
        @movie = Movie.find(params[:id])
    end

    def update
        @movie = Movie.find(params[:id])

        if @movie.update(title: params[:movie][:title],
                        release_year: params[:movie][:release_year],
                        synopsis: params[:movie][:synopsis],
                        country_of_origin: params[:movie][:country_of_origin],
                        time: params[:movie][:time],
                        director_id: params[:movie][:director_id],
                        genre_id: params[:movie][:genre_id]
            )
            flash[:notice] = "Filme atualizado com sucesso!"
            return redirect_to @movie
        end
        render :edit
    end

    def publish
        movie = Movie.find(params[:id])
        movie.published!
        redirect_to movie_path(movie.id)
    end
end