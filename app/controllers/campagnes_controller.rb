class CampagnesController < ApplicationController

  def index
    @campagnes = Campagne.paginate(page: params[:page], per_page: 10)
  end

  def new
    @campagne = Campagne.new
  end

  def edit
    @campagne = Campagne.find(params[:id])
  end

  def show
    @campagne = Campagne.find(params[:id])
  end

  def create
    @campagne = Campagne.new(params[:campagne])

    respond_to do |format|
      if @campagne.save
        format.html { redirect_to @campagne, notice: 'Camapgne a été crée avec succès.' }
        format.json { render json: @campagne, status: :created, location: @campagne }
      else
        format.html { render action: "new" }
        format.json { render json: @campagne.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @campagne = Campagne.find(params[:id])

    respond_to do |format|
      if @campagne.update_attributes(params[:campagne])
        format.html { redirect_to @campagne, notice: 'Campagne a été édité avec succès.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @campagne.errors, status: :unprocessable_entity }
      end
    end
  end
end