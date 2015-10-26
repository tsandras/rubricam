class RelationsOrganisationsController < ApplicationController
  # GET /relations
  # GET /relations.json
  def index
    if @user.role == User::ROLE_ADMIN
      @relations = RelationsOrganisation.paginate(page: params[:page], per_page: 20)
    else
      @relations = RelationsOrganisation.where(secret: false).paginate(page: params[:page], per_page: 20)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @relations }
    end
  end

  # GET /relations/1
  # GET /relations/1.json
  def show
    @relation = RelationsOrganisation.find(params[:id])
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition?(@user, @relation)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @relation }
    end
  end

  # GET /relations/new
  # GET /relations/new.json
  def new
    @relation = RelationsOrganisation.new
    @organisations = Organisation.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @relation }
    end
  end

  # GET /relations/1/edit
  def edit
    @relation = RelationsOrganisation.find(params[:id])
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition?(@user, @relation)
    @organisations = Organisation.all
    @from_organisation = get_organisation(@relation.from_organisation_id)
    @to_organisation = get_organisation(@relation.to_organisation_id)
  end

  # POST /relations
  # POST /relations.json
  def create
    # raise params.inspect
    @relation = RelationsOrganisation.new(params[:relations_organisation])
    # raise @relation.inspect
    @relation.secret = false if @user.role != User::ROLE_ADMIN
    respond_to do |format|
      if @relation.save
        format.html { redirect_to @relation, notice: 'Relation a été crée avec succès.' }
        format.json { render json: @relation, status: :created, location: @relation }
      else
        format.html { render action: "new" }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /relations/1
  # PUT /relations/1.json
  def update
    @relation = RelationsOrganisation.find(params[:id])
    params[:relation][:secret] = false if @user.role != User::ROLE_ADMIN
    respond_to do |format|
      if @relation.update_attributes(params[:relation])
        format.html { redirect_to @relation, notice: 'Relation a été édité avec succès.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relations/1
  # DELETE /relations/1.json
  def destroy
    @relation = RelationsOrganisation.find(params[:id])
    @relation.destroy

    respond_to do |format|
      format.html { redirect_to relations_url }
      format.json { head :no_content }
    end
  end

  private

  def permition?(user, relation)
    return true if user.role == User::ROLE_ADMIN
    return true if relation.secret == false
    false
  end

  def get_organisation(id)
    begin
      org = Organisation.find(id)
    rescue ActiveRecord::RecordNotFound => e
      org = nil
    end
    org
  end

end
