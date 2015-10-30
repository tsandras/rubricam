class NivartsController < ApplicationController
  # GET /nivarts
  # GET /nivarts.json
  def index
    @nivarts = Nivart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nivarts }
    end
  end

  # GET /nivarts/1
  # GET /nivarts/1.json
  def show
    @nivart = Nivart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nivart }
    end
  end

  # GET /nivarts/new
  # GET /nivarts/new.json
  def new
    @nivart = Nivart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nivart }
    end
  end

  # GET /nivarts/1/edit
  def edit
    @nivart = Nivart.find(params[:id])
  end

  # POST /nivarts
  # POST /nivarts.json
  def create
    @nivart = Nivart.new(params[:nivart])

    respond_to do |format|
      if @nivart.save
        format.html { redirect_to @nivart, notice: 'Nivart was successfully created.' }
        format.json { render json: @nivart, status: :created, location: @nivart }
      else
        format.html { render action: "new" }
        format.json { render json: @nivart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nivarts/1
  # PUT /nivarts/1.json
  def update
    @nivart = Nivart.find(params[:id])

    respond_to do |format|
      if @nivart.update_attributes(params[:nivart])
        format.html { redirect_to @nivart, notice: 'Nivart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nivart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nivarts/1
  # DELETE /nivarts/1.json
  def destroy
    @nivart = Nivart.find(params[:id])
    @nivart.destroy

    respond_to do |format|
      format.html { redirect_to nivarts_url }
      format.json { head :no_content }
    end
  end
end
