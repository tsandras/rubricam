class PartiesController < ApplicationController

  before_filter :redirect_unauthorized_to_write, :only=> [:edit, :update, :destroy]

  # GET /parties
  # GET /parties.json
  def index
    @parties = Partie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parties }
    end
  end

  # GET /parties/1
  # GET /parties/1.json
  def show
    @party = Partie.find(params[:id])
    if @user.role == User::ROLE_ADMIN
      @membres = @party.personnages.group_by{|p| p.pnj }
    else
      @membres = @party.personnages.none_secret.group_by{|p| p.pnj }
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @party }
    end
  end

  # GET /parties/new
  # GET /parties/new.json
  def new
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if @user.role != User::ROLE_ADMIN
    @party = Partie.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @party }
    end
  end

  # GET /parties/1/edit
  def edit
    @party = Partie.find(params[:id])
  end

  # POST /parties
  # POST /parties.json
  def create
    # raise "foo"
    @party = Partie.new(params[:partie])

    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: 'Partie a été crée avec succès.' }
        format.json { render json: @party, status: :created, location: @party }
      else
        format.html { render action: "new" }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /parties/1
  # PUT /parties/1.json
  def update
    @party = Partie.find(params[:id])

    respond_to do |format|
      if @party.update_attributes(params[:partie])
        format.html { redirect_to @party, notice: 'Partie a été édité avec succès.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.json
  def destroy
    @party = Partie.find(params[:id])
    @party.destroy

    respond_to do |format|
      format.html { redirect_to parties_url }
      format.json { head :no_content }
    end
  end

  private

  def redirect_unauthorized_to_write
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_write?(@user)
  end

  def permition_write?(user)
    return true if user.role == User::ROLE_ADMIN
    false
  end
end
