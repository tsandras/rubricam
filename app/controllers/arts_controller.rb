class ArtsController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:index, :show]
  before_filter :redirect_unauthorized_to_write, :only=> [:edit, :update, :destroy, :new, :create]
  # GET /arts
  # GET /arts.json
  def index
    @arts = Art.paginate(page: params[:page], per_page: 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @arts }
    end
  end

  # GET /arts/1
  # GET /arts/1.json
  def show
    @art = Art.find(params[:id])
    @nivarts = Nivart.where(art_id: @art.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @art }
    end
  end

  # GET /arts/new
  # GET /arts/new.json
  def new
    @art = Art.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @art }
    end
  end

  # GET /arts/1/edit
  def edit
    @art = Art.find(params[:id])
  end

  # POST /arts
  # POST /arts.json
  def create
    @art = Art.new(params[:art])

    respond_to do |format|
      if @art.save
        format.html { redirect_to @art, notice: 'Art a été crée avec succès.' }
        format.json { render json: @art, status: :created, location: @art }
      else
        format.html { render action: "new" }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /arts/1
  # PUT /arts/1.json
  def update
    @art = Art.find(params[:id])

    respond_to do |format|
      if @art.update_attributes(params[:art])
        format.html { redirect_to @art, notice: 'Art a été édité avec succès.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arts/1
  # DELETE /arts/1.json
  def destroy
    @art = Art.find(params[:id])
    @art.destroy

    respond_to do |format|
      format.html { redirect_to arts_url }
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
