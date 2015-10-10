class CombinaisonsController < ApplicationController

  before_filter :redirect_unauthorized_to_show, :only=> [:show]
  before_filter :redirect_unauthorized_to_write, :only=> [:edit, :update, :destroy]

  # GET /combinaisons
  # GET /combinaisons.json
  def index
    if @user.role == User::ROLE_ADMIN
      @combinaisons = Combinaison.paginate(page: params[:page], per_page: 20)
    else
      @combinaisons = Combinaison.none_secret_or_own_routines(@user.id).paginate(page: params[:page], per_page: 20)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @combinaisons }
    end
  end

  # GET /combinaisons/1
  # GET /combinaisons/1.json
  def show
    @combinaison = Combinaison.find(params[:id])
    @combinaisons_disciplines = CombinaisonsDisciplines.where(combinaison_id: @combinaison.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @combinaison }
    end
  end

  # GET /combinaisons/new
  # GET /combinaisons/new.json
  def new
    @combinaison = Combinaison.new
    @combinaisons_disciplines = CombinaisonsDisciplines.where(combinaison_id: @combinaison.id)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @combinaison }
    end
  end

  # GET /combinaisons/1/edit
  def edit
    @combinaison = Combinaison.find(params[:id])
    @combinaisons_disciplines = CombinaisonsDisciplines.where(combinaison_id: @combinaison.id)
  end

  # POST /combinaisons
  # POST /combinaisons.json
  def create
    # raise params.inspect
    @combinaison = Combinaison.new(params[:combinaison])
    @combinaison.user_id = @user.id
    # raise params.inspect
    # @combinaisons_disciplines = CombinaisonsDisciplines.new(params[:combinaisons_disciplines])
    respond_to do |format|
      if @combinaison.save
        # raise params[:combinaisons_disciplines].inspect
        update_combinaisons_disciplines(params[:combinaisons_disciplines])
        format.html { redirect_to @combinaison, notice: 'Combinaison a été crée avec succès.' }
        format.json { render json: @combinaison, status: :created, location: @combinaison }
      else
        @combinaisons_disciplines = CombinaisonsDisciplines.where(combinaison_id: @combinaison.id)
        format.html { render action: "new" }
        format.json { render json: @combinaison.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /combinaisons/1
  # PUT /combinaisons/1.json
  def update
    @combinaison = Combinaison.find(params[:id])

    respond_to do |format|
      if @combinaison.update_attributes(params[:combinaison])
        update_combinaisons_disciplines(params[:combinaisons_disciplines])
        format.html { redirect_to @combinaison, notice: 'Combinaison a été édité avec succès.' }
        format.json { head :no_content }
      else
        @combinaisons_disciplines = CombinaisonsDisciplines.where(combinaison_id: @combinaison.id)
        format.html { render action: "edit" }
        format.json { render json: @combinaison.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /combinaisons/1
  # DELETE /combinaisons/1.json
  def destroy
    @combinaison = Combinaison.find(params[:id])
    @combinaison.destroy

    respond_to do |format|
      format.html { redirect_to combinaisons_url }
      format.json { head :no_content }
    end
  end

  private

  def update_combinaisons_disciplines(combidisciplines)
    if combidisciplines != nil
      combidisciplines.each do |i, cd|
        if !cd.nil? && !is_cd(i) # s'il n'existe pas
          if cd[:niveau].to_i != 0
            CombinaisonsDisciplines.create(combinaison_id: @combinaison.id, discipline_id: i.to_i, niveau: cd[:niveau].to_i)
          end
        else # s'il existe
          cap = CombinaisonsDisciplines.where(combinaison_id: @combinaison.id, discipline_id: i.to_i).first
          cap.update_attributes(cd)
        end
      end
    end
  end

  def is_cd(key)
    begin
      cap = CombinaisonsDisciplines.where(combinaison_id: @combinaison.id, discipline_id: key.to_i)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end

  def redirect_unauthorized_to_show
    @combinaison = Combinaison.find(params[:id])
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_show?(@user)
  end

  def redirect_unauthorized_to_write
    @combinaison = Combinaison.find(params[:id])
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition_write?(@user)
  end

  def permition_show?(user)
    return true if user.role != User::ROLE_NORMA
    return true if @combinaison.user_id == user.id
    return true if !@combinaison.secret
    false
  end

  def permition_write?(user)
    return true if user.role == User::ROLE_ADMIN
    return true if @combinaison.user_id == user.id
    false
  end
end
