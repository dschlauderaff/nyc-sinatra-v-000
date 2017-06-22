class FiguresController < ApplicationController


  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end


  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(id: params[:id])
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/edit'
  end

  get '/figures/:id' do
    # binding.pry
    @figure = Figure.find_by(id: params[:id])
    erb :'/figures/show'
  end


  post '/figures' do
    # binding.pry
    @figure = Figure.new(params[:figure])
    if params[:new_title][:name] != ""
      @figure.titles.build(params[:new_title])
    end
    if params[:new_landmark][:name] != ""
      @figure.landmarks.build(params[:new_landmark])
    end
    @figure.save

    redirect '/figures'
  end

  post '/figures/:id' do
    # binding.pry
    @figure = Figure.find_by(id: params[:id])

    @figure.update(params[:figure])

    if params[:new_landmark][:name] != ""
      @figure.landmarks.build(params[:new_landmark])
    end
    if params[:new_title][:name] != ""
      @figure.titles.build(params[:new_title])
    end
    erb :'/figures/show'
  end
end
