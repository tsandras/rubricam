class CombinaisonsController < ApplicationController
  # GET /combinaisons
  # GET /combinaisons.json

  def index
    @combinaisons = Combinaison.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @combinaisons }
    end
  end

  # GET /combinaisons/1
  # GET /combinaisons/1.json
  def show
    @combinaison = Combinaison.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @combinaison }
    end
  end

  # GET /combinaisons/new
  # GET /combinaisons/new.json
  def new
    @combinaison = Combinaison.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @combinaison }
    end
  end

  # GET /combinaisons/1/edit
  def edit
    @combinaison = Combinaison.find(params[:id])
  end

  # POST /combinaisons
  # POST /combinaisons.json
  def create
    @combinaison = Combinaison.new(params[:combinaison])

    respond_to do |format|
      if @combinaison.save
        format.html { redirect_to @combinaison, notice: 'Combinaison a été crée avec succès.' }
        format.json { render json: @combinaison, status: :created, location: @combinaison }
      else
        format.html { render action: "new" }
        format.json { render json: @combinaison.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /combinaisons/1
  # PUT /combinaisons/1.json
  def update
    @combinaison = Combinaison.find(params[:id])

    respond_to do |format|
      if @combinaison.update_attributes(params[:combinaison])
        format.html { redirect_to @combinaison, notice: 'Combinaison a été édité avec succès.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @combinaison.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /combinaisons/1
  # DELETE /combinaisons/1.json
  def destroy
    @combinaison = Combinaison.find(params[:id])
    @combinaison.destroy

    respond_to do |format|
      format.html { redirect_to combinaisons_url }
      format.json { head :no_content }
    end
  end
end
