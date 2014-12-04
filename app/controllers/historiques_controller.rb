class HistoriquesController < ApplicationController
  # GET /historiques
  # GET /historiques.json
  def index
    @historiques = Historique.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @historiques }
    end
  end

  # GET /historiques/1
  # GET /historiques/1.json
  def show
    @historique = Historique.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @historique }
    end
  end

  # GET /historiques/new
  # GET /historiques/new.json
  def new
    @historique = Historique.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @historique }
    end
  end

  # GET /historiques/1/edit
  def edit
    @historique = Historique.find(params[:id])
  end

  # POST /historiques
  # POST /historiques.json
  def create
    @historique = Historique.new(params[:historique])

    respond_to do |format|
      if @historique.save
        format.html { redirect_to @historique, notice: 'Historique was successfully created.' }
        format.json { render json: @historique, status: :created, location: @historique }
      else
        format.html { render action: "new" }
        format.json { render json: @historique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /historiques/1
  # PUT /historiques/1.json
  def update
    @historique = Historique.find(params[:id])

    respond_to do |format|
      if @historique.update_attributes(params[:historique])
        format.html { redirect_to @historique, notice: 'Historique was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @historique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historiques/1
  # DELETE /historiques/1.json
  def destroy
    @historique = Historique.find(params[:id])
    @historique.destroy

    respond_to do |format|
      format.html { redirect_to historiques_url }
      format.json { head :no_content }
    end
  end
end
