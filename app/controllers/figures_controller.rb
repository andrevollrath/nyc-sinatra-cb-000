class FiguresController < ApplicationController

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    #binding.pry
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create_from_web(params)
    redirect to "figures/#{@figure.id}"
    #binding.pry
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.update_from_web(params)
    #binding.pry
    redirect to "/figures/#{@figure.id}"
  end 

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures' do
    @all = Figure.all
    erb :'figures/index'
  end

end