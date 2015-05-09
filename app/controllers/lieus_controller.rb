class LieusController < ApplicationController

  before_filter :redirect_unauthorized_to_show, :only=> [:show]
  before_filter :redirect_unauthorized_to_write, :only=> [:edit, :update, :destroy]

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
    if @user.role == User::ROLE_ADMIN
      @membres = @lieu.personnages
    else
      @membres = @lieu.personnages.none_secret
    end
    if @user.role == User::ROLE_ADMIN
      @organisations = @lieu.organisations
    else
      @organisations = @lieu.organisations.none_secret
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lieu }
    end
  end

  # GET /lieus/new
  # GET /lieus/new.json
  def new
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if @user.role != User::ROLE_ADMIN
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
        format.html { redirect_to @lieu, notice: 'Lieu a été crée avec succès.' }
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
        format.html { redirect_to @lieu, notice: 'Lieu a été édité avec succès.' }
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

  private

  def redirect_unauthorized_to_show
    @lieu = Lieu.find(params[:id])
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_show?(@user)
  end

  def redirect_unauthorized_to_write
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_write?(@user)
  end

  def permition_show?(user)
    return true if user.role != User::ROLE_NORMA
    return true if !@lieu.secret
    false
  end

  def permition_write?(user)
    return true if user.role == User::ROLE_ADMIN
    false
  end
end
