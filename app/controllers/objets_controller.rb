class ObjetsController < ApplicationController
  # GET /objets
  # GET /objets.json

  before_filter :redirect_unauthorized_to_show, :only=> [:show]
  before_filter :redirect_unauthorized_to_write, :only=> [:edit, :update, :destroy]

  def index
    @objets = Objet.none_secret_and_own_objets(@user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @objets }
    end
  end

  # GET /objets/1
  # GET /objets/1.json
  def show
    @objet = Objet.find(params[:id])
    @personnage = @objet.personnage
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @objet }
    end
  end

  # GET /objets/new
  # GET /objets/new.json
  def new
    @objet = Objet.new
    load_ressources

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @objet }
    end
  end

  # GET /objets/1/edit
  def edit
    @objet = Objet.find(params[:id])
    load_ressources
  end

  # POST /objets
  # POST /objets.json
  def create
    @objet = Objet.new(params[:objet])
    @objet.user_id = @user.id
    respond_to do |format|
      if @objet.save
        format.html { redirect_to @objet, notice: 'Objet a été crée avec succès.' }
        format.json { render json: @objet, status: :created, location: @objet }
      else
        format.html { render action: "new" }
        format.json { render json: @objet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /objets/1
  # PUT /objets/1.json
  def update
    @objet = Objet.find(params[:id])
    @objet.user_id = @user.id
    respond_to do |format|
      if @objet.update_attributes(params[:objet])
        format.html { redirect_to @objet, notice: 'Objet a été édité avec succès.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @objet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objets/1
  # DELETE /objets/1.json
  def destroy
    @objet = Objet.find(params[:id])
    @objet.destroy

    respond_to do |format|
      format.html { redirect_to objets_url }
      format.json { head :no_content }
    end
  end

  private

  def load_ressources
    if @user.role == User::ROLE_ADMIN
      @personnages = Personnage.all
      @routines = Routine.all
    else
      @personnages = Personnage.own_personnages(@user)
      @routines = Routine.none_secret_or_own_routines(@user)
    end
  end

  def redirect_unauthorized_to_show
    @objet = Objet.find(params[:id])
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_show?(@user)
  end

  def redirect_unauthorized_to_write
    @objet = Objet.find(params[:id])
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_write?(@user)
  end

  def permition_show?(user)
    return true if user.role != User::ROLE_NORMA
    return true if @objet.user_id == user.id
    return true if !@objet.secret
    false
  end

  def permition_write?(user)
    return true if user.role == User::ROLE_ADMIN
    return true if @objet.user_id == user.id
    false
  end
end
