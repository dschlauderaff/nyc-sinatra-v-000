class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do

    erb :'landmarks/new'
  end

  post '/landmarks' do
    # binding.pry
    @landmark = Landmark.new(params[:landmark])
    @landmark.save
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by(id: params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find_by(id: params[:id])
    # binding.pry
    @landmark.update(params[:landmark])
    @landmark.save
    erb :'landmarks/show'
  end
end
