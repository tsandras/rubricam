class OrganisationsController < ApplicationController

  before_filter :redirect_unauthorized_to_show, :only=> [:show]
  before_filter :redirect_unauthorized_to_write, :only=> [:edit, :update, :destroy]

  # GET /organisations
  # GET /organisations.json
  def index
    if @user.role == User::ROLE_ADMIN
      @organisations = Organisation.paginate(page: params[:page], per_page: 20)
    else
      @organisations = Organisation.none_secret.paginate(page: params[:page], per_page: 20)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organisations }
    end
  end

  # GET /organisations/1
  # GET /organisations/1.json
  def show
    @organisation = Organisation.find(params[:id])
    if @user.role == User::ROLE_ADMIN
      @membres = @organisation.personnages
    else
      @membres = @organisation.personnages.none_secret
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organisation }
    end
  end

  # GET /organisations/new
  # GET /organisations/new.json
  def new
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if @user.role != User::ROLE_ADMIN
    @organisation = Organisation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organisation }
    end
  end

  # GET /organisations/1/edit
  def edit
    @organisation = Organisation.find(params[:id])
  end

  # POST /organisations
  # POST /organisations.json
  def create
    @organisation = Organisation.new(params[:organisation])

    respond_to do |format|
      if @organisation.save
        format.html { redirect_to @organisation, notice: 'Organisation a été crée avec succès.' }
        format.json { render json: @organisation, status: :created, location: @organisation }
      else
        format.html { render action: "new" }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organisations/1
  # PUT /organisations/1.json
  def update
    @organisation = Organisation.find(params[:id])

    respond_to do |format|
      if @organisation.update_attributes(params[:organisation])
        format.html { redirect_to @organisation, notice: 'Organisation a été édité avec succès.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisations/1
  # DELETE /organisations/1.json
  def destroy
    @organisation = Organisation.find(params[:id])
    @organisation.destroy

    respond_to do |format|
      format.html { redirect_to organisations_url }
      format.json { head :no_content }
    end
  end

  private

  def redirect_unauthorized_to_show
    @organisation = Organisation.find(params[:id])
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_show?(@user)
  end

  def redirect_unauthorized_to_write
    @organisation = Organisation.find(params[:id])
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_write?(@user)
  end

  def permition_show?(user)
    return true if user.role != User::ROLE_NORMA
    return true if !@organisation.secret
    false
  end

  def permition_write?(user)
    return true if user.role == User::ROLE_ADMIN
    false
  end
end
