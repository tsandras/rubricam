class RoutinesController < ApplicationController

  before_filter :redirect_unauthorized_to_show, :only=> [:show]
  before_filter :redirect_unauthorized_to_write, :only=> [:edit, :update, :destroy]

  # GET /routines
  # GET /routines.json
  def index
    if @user.admin?
      @routines = Routine.paginate(page: params[:page], per_page: 20)
    else
      @routines = Routine.none_secret_or_own_routines(@user.id).paginate(page: params[:page], per_page: 20)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @routines }
    end
  end

  # GET /routines/1
  # GET /routines/1.json
  def show
    @routine = Routine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @routine }
    end
  end

  # GET /routines/new
  # GET /routines/new.json
  def new
    @routine = Routine.new
    @users = User.all if @user.admin?
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @routine }
    end
  end

  # GET /routines/1/edit
  def edit
    @routine = Routine.find(params[:id])
    @users = User.all if @user.admin?
  end

  # POST /routines
  # POST /routines.json
  def create
    @routine = Routine.new(params[:routine])
    @routine.user_id = @user.id if !@user.admin?
    @users = User.all if @user.admin?
    respond_to do |format|
      if @routine.save
        format.html { redirect_to @routine, notice: 'Routine a été crée avec succès.' }
        format.json { render json: @routine, status: :created, location: @routine }
      else
        format.html { render action: "new" }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /routines/1
  # PUT /routines/1.json
  def update
    @routine = Routine.find(params[:id])
    # @routine.user_id = @user.id
    @users = User.all if @user.admin?
    respond_to do |format|
      if @routine.update_attributes(params[:routine])
        format.html { redirect_to @routine, notice: 'Routine a été édité avec succès.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routines/1
  # DELETE /routines/1.json
  def destroy
    @routine = Routine.find(params[:id])
    @routine.destroy

    respond_to do |format|
      format.html { redirect_to routines_url }
      format.json { head :no_content }
    end
  end

  private

  def redirect_unauthorized_to_show
    @routine = Routine.find(params[:id])
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_show?(@user)
  end

  def redirect_unauthorized_to_write
    @routine = Routine.find(params[:id])
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_write?(@user)
  end

  def permition_show?(user)
    return true if !user.norma?
    return true if @routine.user_id == user.id
    return true if !@routine.secret
    false
  end

  def permition_write?(user)
    return true if user.admin?
    return true if @routine.user_id == user.id
    false
  end
end
