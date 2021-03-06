class RelationsController < ApplicationController
  # GET /relations
  # GET /relations.json
  def index
    if @user.admin?
      @relations = Relation.paginate(page: params[:page], per_page: 20)
    else
      @relations = Relation.where(secret: false).paginate(page: params[:page], per_page: 20)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @relations }
    end
  end

  # GET /relations/1
  # GET /relations/1.json
  def show
    @relation = Relation.find(params[:id])
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition?(@user, @relation)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @relation }
    end
  end

  # GET /relations/new
  # GET /relations/new.json
  def new
    @relation = Relation.new
    @personnages = Personnage.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @relation }
    end
  end

  # GET /relations/1/edit
  def edit
    @relation = Relation.find(params[:id])
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition?(@user, @relation)
    @personnages = Personnage.all
    # @from_personnage = get_personnage(@relation.from_personnage_id)
    # @to_personnage = get_personnage(@relation.to_personnage_id)
  end

  # POST /relations
  # POST /relations.json
  def create
    @relation = Relation.new(params[:relation])
    @relation.secret = false if !@user.admin?
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
    @relation = Relation.find(params[:id])
    params[:relation][:secret] = false if !@user.admin?
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
    @relation = Relation.find(params[:id])
    @relation.destroy

    respond_to do |format|
      format.html { redirect_to relations_url }
      format.json { head :no_content }
    end
  end

  def visuel
    if @user.admin?
      if (params[:commit] == "Filtrer" && params[:personnages].present?) || params[:commit] != "Filtrer"
        @relations = Relation.all
        @personnages = Personnage.none_test
      else
        @relations = []
        @personnages = []
      end
      if (params[:commit] == "Filtrer" && params[:organisations].present?) || params[:commit] != "Filtrer"
        @organisations = Organisation.all
        @relations_organisations = OrganisationsPersonnages.all
        @relations_organisations_organisations = RelationsOrganisation.all
      else
        @organisations = []
        @relations_organisations = []
        @relations_organisations_organisations = []
      end
    else
      if (params[:commit] == "Filtrer" && params[:personnages].present?) || params[:commit] != "Filtrer"
        @relations = Relation.none_secret
        @personnages = Personnage.none_secret.none_test
      else
        @relations = []
        @personnages = []
      end
      if (params[:commit] == "Filtrer" && params[:organisations].present?) || params[:commit] != "Filtrer"
        @organisations = Organisation.none_secret
        @relations_organisations = OrganisationsPersonnages.none_secret
        @relations_organisations_organisations = RelationsOrganisation.none_secret
      else
        @organisations = []
        @relations_organisations = []
        @relations_organisations_organisations = []
      end
    end
  end

  private

  def permition?(user, relation)
    return true if user.role == User::ROLE_ADMIN
    return true if relation.secret == false
    false
  end
end
