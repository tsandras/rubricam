class AtoutsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show]
  before_filter :redirect_unauthorized_to_show, only: [:show]
  before_filter :redirect_unauthorized_to_write, only: [:edit, :update, :destroy, :new, :create]

  # GET /atouts
  # GET /atouts.json
  def index
    if @user.admin?
      @atouts = Atout.paginate(page: params[:page], per_page: 25)
    else
      @atouts = Atout.none_secret.paginate(page: params[:page], per_page: 25)
    end

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
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_to_write?(@user)
    @atout = Atout.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @atout }
    end
  end

  # GET /atouts/1/edit
  def edit
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_to_write?(@user)
    @atout = Atout.find(params[:id])
  end

  # POST /atouts
  # POST /atouts.json
  def create
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_to_write?(@user)
    @atout = Atout.new(params[:atout])

    respond_to do |format|
      if @atout.save
        format.html { redirect_to @atout, notice: 'Atout a été crée avec succès.' }
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
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_to_write?(@user)
    @atout = Atout.find(params[:id])

    respond_to do |format|
      if @atout.update_attributes(params[:atout])
        format.html { redirect_to @atout, notice: 'Atout a été édité avec succès.' }
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
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_to_write?(@user)
    @atout = Atout.find(params[:id])
    @atout.destroy

    respond_to do |format|
      format.html { redirect_to atouts_url }
      format.json { head :no_content }
    end
  end

  private

  def redirect_unauthorized_to_show
    @atout = Atout.find(params[:id])
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_show?(@user)
  end

  def redirect_unauthorized_to_write
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_write?(@user)
  end

  def permition_write?(user)
    return true if user.admin? || user.moder?
    false
  end

  def permition_show?(user)
    return true if !user.norma?
    return true if !@atout.secret
    false
  end
end
