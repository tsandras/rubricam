class HistoriquesController < ApplicationController
  # GET /historiques
  # GET /historiques.json
  skip_before_filter :authenticate_user!, only: [:index, :show]
  before_filter :redirect_unauthorized_to_write, :only=> [:edit, :update, :destroy, :new, :create]

  def index
    @historiques = Historique.paginate(page: params[:page], per_page: 20)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @historiques }
    end
  end

  # GET /historiques/1
  # GET /historiques/1.json
  def show
    @historique = Historique.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @historique }
    end
  end

  # GET /historiques/new
  # GET /historiques/new.json
  def new
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_to_write?(@user)
    @historique = Historique.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @historique }
    end
  end

  # GET /historiques/1/edit
  def edit
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_to_write?(@user)
    @historique = Historique.find(params[:id])
  end

  # POST /historiques
  # POST /historiques.json
  def create
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_to_write?(@user)
    @historique = Historique.new(params[:historique])

    respond_to do |format|
      if @historique.save
        format.html { redirect_to @historique, notice: 'Historique a été crée avec succès.' }
        format.json { render json: @historique, status: :created, location: @historique }
      else
        format.html { render action: "new" }
        format.json { render json: @historique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /historiques/1
  # PUT /historiques/1.json
  def update
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_to_write?(@user)
    @historique = Historique.find(params[:id])

    respond_to do |format|
      if @historique.update_attributes(params[:historique])
        format.html { redirect_to @historique, notice: 'Historique a été édité avec succès.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @historique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historiques/1
  # DELETE /historiques/1.json
  def destroy
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_to_write?(@user)
    @historique = Historique.find(params[:id])
    @historique.destroy

    respond_to do |format|
      format.html { redirect_to historiques_url }
      format.json { head :no_content }
    end
  end

  private

  def redirect_unauthorized_to_write
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_write?(@user)
  end

  def permition_write?(user)
    return true if user.role == User::ROLE_ADMIN || user.role == User::ROLE_MODER
    false
  end
end
