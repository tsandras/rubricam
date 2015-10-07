class NivdisciplinesController < ApplicationController
  # GET /disciplines
  # GET /disciplines.json
  skip_before_filter :authenticate_user!, only: [:index, :show]
  before_filter :redirect_unauthorized_to_write, :only=> [:edit, :update, :destroy, :new, :create]

  def index
    # raise params.inspect
    @nivdisciplines = Nivdiscipline.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @disciplines }
    end
  end

  # GET /disciplines/1
  # GET /disciplines/1.json
  def show
    # raise params.inspect
    @nivdiscipline = Nivdiscipline.find(params[:id])
    @discipline = @nivdiscipline.discipline
    @nivdiscipline = @nivdiscipline
    # raise @nivdiscipline.inspect
    # @nivdisciplines = Nivdiscipline.where(discipline_id: @discipline.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nivdiscipline }
    end
  end

  # GET /disciplines/new
  # GET /disciplines/new.json
  def new
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_to_write?(@user)
    @nivdiscipline = Nivdiscipline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nivdiscipline }
    end
  end

  # GET /disciplines/1/edit
  def edit
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_to_write?(@user)
    @nivdiscipline = Nivdiscipline.find(params[:id])
  end

  # POST /disciplines
  # POST /disciplines.json
  def create
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_to_write?(@user)
    @nivdiscipline = Nivdiscipline.new(params[:nivdiscipline])
    # raise @nivdiscipline.inspect
    respond_to do |format|
      if @nivdiscipline.save
        format.html { redirect_to @nivdiscipline, notice: 'Niveau discipline a été crée avec succès.' }
        format.json { render json: @nivdiscipline, status: :created, location: @nivdiscipline }
      else
        format.html { render action: "new" }
        format.json { render json: @nivdiscipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /disciplines/1
  # PUT /disciplines/1.json
  def update
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_to_write?(@user)
    @nivdiscipline = Nivdiscipline.find(params[:id])

    respond_to do |format|
      if @nivdiscipline.update_attributes(params[:discipline])
        format.html { redirect_to @nivdiscipline, notice: 'Discipline a été édité avec succès.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nivdiscipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_to_write?(@user)
    @nivdiscipline = Nivdiscipline.find(params[:id])
    @nivdiscipline.destroy

    respond_to do |format|
      format.html { redirect_to disciplines_url }
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
