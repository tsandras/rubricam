class SpheresController < ApplicationController
  # GET /spheres
  # GET /spheres.json
  def index
    @spheres = Sphere.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spheres }
    end
  end

  # GET /spheres/1
  # GET /spheres/1.json
  def show
    @sphere = Sphere.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sphere }
    end
  end

  # GET /spheres/new
  # GET /spheres/new.json
  def new
    @sphere = Sphere.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sphere }
    end
  end

  # GET /spheres/1/edit
  def edit
    @sphere = Sphere.find(params[:id])
  end

  # POST /spheres
  # POST /spheres.json
  def create
    @sphere = Sphere.new(params[:sphere])

    respond_to do |format|
      if @sphere.save
        format.html { redirect_to @sphere, notice: 'Sphere was successfully created.' }
        format.json { render json: @sphere, status: :created, location: @sphere }
      else
        format.html { render action: "new" }
        format.json { render json: @sphere.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /spheres/1
  # PUT /spheres/1.json
  def update
    @sphere = Sphere.find(params[:id])

    respond_to do |format|
      if @sphere.update_attributes(params[:sphere])
        format.html { redirect_to @sphere, notice: 'Sphere was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sphere.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spheres/1
  # DELETE /spheres/1.json
  def destroy
    @sphere = Sphere.find(params[:id])
    @sphere.destroy

    respond_to do |format|
      format.html { redirect_to spheres_url }
      format.json { head :no_content }
    end
  end
end
