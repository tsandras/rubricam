class LieusController < ApplicationController
  # GET /lieus
  # GET /lieus.json
  def index
    @lieus = Lieu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lieus }
    end
  end

  # GET /lieus/1
  # GET /lieus/1.json
  def show
    @lieu = Lieu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lieu }
    end
  end

  # GET /lieus/new
  # GET /lieus/new.json
  def new
    @lieu = Lieu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lieu }
    end
  end

  # GET /lieus/1/edit
  def edit
    @lieu = Lieu.find(params[:id])
  end

  # POST /lieus
  # POST /lieus.json
  def create
    @lieu = Lieu.new(params[:lieu])

    respond_to do |format|
      if @lieu.save
        format.html { redirect_to @lieu, notice: 'Lieu was successfully created.' }
        format.json { render json: @lieu, status: :created, location: @lieu }
      else
        format.html { render action: "new" }
        format.json { render json: @lieu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lieus/1
  # PUT /lieus/1.json
  def update
    @lieu = Lieu.find(params[:id])

    respond_to do |format|
      if @lieu.update_attributes(params[:lieu])
        format.html { redirect_to @lieu, notice: 'Lieu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lieu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lieus/1
  # DELETE /lieus/1.json
  def destroy
    @lieu = Lieu.find(params[:id])
    @lieu.destroy

    respond_to do |format|
      format.html { redirect_to lieus_url }
      format.json { head :no_content }
    end
  end
end
