class CapacitesController < ApplicationController
  # GET /capacites
  # GET /capacites.json
  def index
    @capacites = Capacite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @capacites }
    end
  end

  # GET /capacites/1
  # GET /capacites/1.json
  def show
    @capacite = Capacite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @capacite }
    end
  end

  # GET /capacites/new
  # GET /capacites/new.json
  def new
    return redirect_to root_url if !permition_to_write?(User.find(session["warden.user.user.key"][0].first))
    @capacite = Capacite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @capacite }
    end
  end

  # GET /capacites/1/edit
  def edit
    return redirect_to root_url if !permition_to_write?(User.find(session["warden.user.user.key"][0].first))
    @capacite = Capacite.find(params[:id])
  end

  # POST /capacites
  # POST /capacites.json
  def create
    return redirect_to root_url if !permition_to_write?(User.find(session["warden.user.user.key"][0].first))
    @capacite = Capacite.new(params[:capacite])

    respond_to do |format|
      if @capacite.save
        format.html { redirect_to @capacite, notice: 'Capacite was successfully created.' }
        format.json { render json: @capacite, status: :created, location: @capacite }
      else
        format.html { render action: "new" }
        format.json { render json: @capacite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /capacites/1
  # PUT /capacites/1.json
  def update
    return redirect_to root_url if !permition_to_write?(User.find(session["warden.user.user.key"][0].first))
    @capacite = Capacite.find(params[:id])

    respond_to do |format|
      if @capacite.update_attributes(params[:capacite])
        format.html { redirect_to @capacite, notice: 'Capacite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @capacite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capacites/1
  # DELETE /capacites/1.json
  def destroy
    return redirect_to root_url if !permition_to_write?(User.find(session["warden.user.user.key"][0].first))
    @capacite = Capacite.find(params[:id])
    @capacite.destroy

    respond_to do |format|
      format.html { redirect_to capacites_url }
      format.json { head :no_content }
    end
  end
end
