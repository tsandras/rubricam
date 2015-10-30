class RoyaumesController < ApplicationController
  
  skip_before_filter :authenticate_user!, only: [:index, :show]
  before_filter :redirect_unauthorized_to_write, :only=> [:edit, :update, :destroy, :new, :create]
  # GET /royaumes
  # GET /royaumes.json
  def index
    @royaumes = Royaume.paginate(page: params[:page], per_page: 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @royaumes }
    end
  end

  # GET /royaumes/1
  # GET /royaumes/1.json
  def show
    @royaume = Royaume.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @royaume }
    end
  end

  # GET /royaumes/new
  # GET /royaumes/new.json
  def new
    @royaume = Royaume.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @royaume }
    end
  end

  # GET /royaumes/1/edit
  def edit
    @royaume = Royaume.find(params[:id])
  end

  # POST /royaumes
  # POST /royaumes.json
  def create
    @royaume = Royaume.new(params[:royaume])

    respond_to do |format|
      if @royaume.save
        format.html { redirect_to @royaume, notice: 'Royaume a été crée avec succès.' }
        format.json { render json: @royaume, status: :created, location: @royaume }
      else
        format.html { render action: "new" }
        format.json { render json: @royaume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /royaumes/1
  # PUT /royaumes/1.json
  def update
    @royaume = Royaume.find(params[:id])

    respond_to do |format|
      if @royaume.update_attributes(params[:royaume])
        format.html { redirect_to @royaume, notice: 'Royaume a été édité avec succès.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @royaume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /royaumes/1
  # DELETE /royaumes/1.json
  def destroy
    @royaume = Royaume.find(params[:id])
    @royaume.destroy

    respond_to do |format|
      format.html { redirect_to royaumes_url }
      format.json { head :no_content }
    end
  end

  private

  def redirect_unauthorized_to_write
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_write?(@user)
  end

  def permition_write?(user)
    return true if user.admin?
    false
  end
end
