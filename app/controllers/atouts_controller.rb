class AtoutsController < ApplicationController
  # GET /atouts
  # GET /atouts.json
  def index
    @atouts = Atout.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @atouts }
    end
  end

  # GET /atouts/1
  # GET /atouts/1.json
  def show
    @atout = Atout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @atout }
    end
  end

  # GET /atouts/new
  # GET /atouts/new.json
  def new
    return redirect_to root_url if !permition_to_write?(User.find(session["warden.user.user.key"][0].first))
    @atout = Atout.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @atout }
    end
  end

  # GET /atouts/1/edit
  def edit
    return redirect_to root_url if !permition_to_write?(User.find(session["warden.user.user.key"][0].first))
    @atout = Atout.find(params[:id])
  end

  # POST /atouts
  # POST /atouts.json
  def create
    return redirect_to root_url if !permition_to_write?(User.find(session["warden.user.user.key"][0].first))
    @atout = Atout.new(params[:atout])

    respond_to do |format|
      if @atout.save
        format.html { redirect_to @atout, notice: 'Atout was successfully created.' }
        format.json { render json: @atout, status: :created, location: @atout }
      else
        format.html { render action: "new" }
        format.json { render json: @atout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /atouts/1
  # PUT /atouts/1.json
  def update
    return redirect_to root_url if !permition_to_write?(User.find(session["warden.user.user.key"][0].first))
    @atout = Atout.find(params[:id])

    respond_to do |format|
      if @atout.update_attributes(params[:atout])
        format.html { redirect_to @atout, notice: 'Atout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @atout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atouts/1
  # DELETE /atouts/1.json
  def destroy
    return redirect_to root_url if !permition_to_write?(User.find(session["warden.user.user.key"][0].first))
    @atout = Atout.find(params[:id])
    @atout.destroy

    respond_to do |format|
      format.html { redirect_to atouts_url }
      format.json { head :no_content }
    end
  end
end
