class PartiesController < ApplicationController
  def index
    @parties = Party.all
    render json: @parties
  end

  def create
    @party = Party.new(name: params[:name], table_id: params[:table_id])
    @party.save
    render json: @party, status: 201
  end

  def update
    @party = Party.find_by(id: params[:id])
    @party.update(name: params[:name])
    render json: @party
  end

  def destroy
    @party = Party.find(params[:id])
    @party.destroy
    render json: @party
  end
end
