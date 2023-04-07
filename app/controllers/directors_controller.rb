class DirectorsController < ApplicationController
    def index
        @directors = Director.all
        @backpath = root_path
    end

    def show
        @movies = Movie.all
        @director = Director.find(params[:id])
        @backpath = directors_path
    end

    def new
        @director = Director.new
        @backpath = directors_path
    end

    def create
        @director = Director.new(name: params[:director][:name])

        if @director.save
            flash[:notice] = 'Diretor(a) cadastrado com sucesso!'
            return redirect_to new_director_path
        else
            flash.now[:error] = "Não foi possível cadastrar o(a) diretor(a)!"
            render action: "new"
        end
    end

    def edit
        @director = Director.find(params[:id])
        @backpath = director_path
    end

    def update
        @director = Director.find(params[:id])

        if @director.update(name: params[:director][:name])
            flash[:notice] = "Diretor(a) atualizado com sucesso!"
            return redirect_to @director
        end
        render :edit
    end
end