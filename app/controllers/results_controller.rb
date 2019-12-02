class ResultsController < ApplicationController
  PER = 15
  def index
    @results = Result.all.search(params[:search]).order(number: 'ASC').page(params[:page]).per(PER)
  end

  def search
    @results = Review.where('word ?', params[:word]).order(created_at: 'DESC')
  end

  def new
    @results=Result.new
  end

  def create
    @result=Result.new(number: params[:number],word: params[:word])
    if @result.save
      redirect_to("/")
    else
      render("/results/new")
    end
  end

  def edit
    @result=Result.find_by(id: params[:id])
  end

  def update
    @result=Result.find_by(id: params[:id])
    @result.number=params[:number]
    @result.word=params[:word]
    @result.save
    redirect_to("/")
  end

  def destroy
    @result=Result.find_by(id: params[:id])
    @result.destroy
    redirect_to("/")
  end
end
