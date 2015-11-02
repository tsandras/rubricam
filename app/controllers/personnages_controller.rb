class PersonnagesController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:get_infos]
  skip_before_filter :authenticate_user!, only: [:get_infos]

  def index
    if @user.admin?
      @personnages = Personnage.order("created_at desc").paginate(page: params[:page], per_page: 10)
    else
      @personnages = Personnage.where(user_id: @user.id).paginate(page: params[:page], per_page: 10)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personnages }
    end
  end

  def pnjs
    if @user.admin?
      @pnjs = Personnage.pnjs.none_test.where("description_publique is not null").paginate(page: params[:page], per_page: 9)
    else
      @pnjs = Personnage.none_secret_and_pnjs.none_test.where("description_publique is not null").paginate(page: params[:page], per_page: 9)
    end
  end

  def pjs
    @pjs = Personnage.pjs.none_test.where("description_publique is not null").paginate(page: params[:page], per_page: 9)
  end

  def show
    @personnage = Personnage.find(params[:id])
    if !permition?(@user)
      return redirect_to public_show_personnage_url(@personnage)
    end
    @personnage.calcule_rang
    @personnage.calcule_graph
    @capacites = CapacitesPersonnages.where(personnage_id: params[:id])
    @historiques = HistoriquesPersonnages.where(personnage_id: params[:id])

    @atouts = AtoutsPersonnages.where(personnage_id: params[:id])
    @arts = ArtsPersonnages.where(personnage_id: params[:id])
    @royaumes = PersonnagesRoyaumes.where(personnage_id: params[:id])
    @to_relations = Relation.where(to_personnage_id: params[:id])
    @from_relations = Relation.where(from_personnage_id: params[:id])
    @organisations = @personnage.organisations
    @lieus = @personnage.lieus
    @routines = @personnage.routines
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @personnage }
    end
  end

  def new
    @personnage = Personnage.new
    gon.traditions = Personnage::TRADITION_DESCRIPTION
    gon.clans = Personnage::CLAN_DESCRIPTION
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @personnage }
    end
  end

  def edit
    @personnage = Personnage.find(params[:id])
    return redirect_to root_url, notice: "Vous n'avez pas accès à cette ressource." if !permition?(@user)
    @capacites_personnages = CapacitesPersonnages.where(personnage_id: params[:id])
    @historiques_personnages = HistoriquesPersonnages.where(personnage_id: params[:id])
    @disciplines_personnages = DisciplinesPersonnages.where(personnage_id: params[:id])
    @atouts_personnages = AtoutsPersonnages.where(personnage_id: params[:id])
    @arts_personnages = ArtsPersonnages.where(personnage_id: params[:id])
    @royaumes_personnages = PersonnagesRoyaumes.where(personnage_id: params[:id])
  end

  def public_edit
    @personnage = Personnage.find(params[:id])
  end

  def public_update
    @personnage = Personnage.find(params[:id])
    @personnage.update_attributes(params[:personnage])
    redirect_to personnage_path(@personnage)
  end

  def public_show
    @personnage = Personnage.find(params[:id])
  end

  def discipline_edit
    @personnage = Personnage.find(params[:id])
    @disciplines_personnages = DisciplinesPersonnages.where(personnage_id: @personnage.id).where("niveau > 5")
  end

  def discipline_update
    @personnage = Personnage.find(params[:id])
    @personnage.update_attributes(params[:personnage])
    redirect_to personnage_path(@personnage)
  end

  def combinaison_edit
    @personnage = Personnage.find(params[:id])
  end

  def combinaison_update
    @personnage = Personnage.find(params[:id])
    combinaisons_before = @personnage.combinaisons.sum(:cout)
    @personnage.update_attributes(params[:personnage])
    @personnage.reste_xps = @personnage.reste_xps + (combinaisons_before - @personnage.combinaisons.sum(:cout))
    @personnage.save
    redirect_to personnage_path(@personnage)
  end

  def routine_edit
    @personnage = Personnage.find(params[:id])
  end

  def routine_update
    @personnage = Personnage.find(params[:id])
    @personnage.update_attributes(params[:personnage])
    redirect_to personnage_path(@personnage)
  end

  def background_edit
    @personnage = Personnage.find(params[:id])
  end

  def background_update
    @personnage = Personnage.find(params[:id])
    @personnage.update_attributes(params[:personnage])
    redirect_to personnage_path(@personnage)
  end

  def secret_update
    @personnage = Personnage.find(params[:id])
    if @personnage.secret
      @personnage.secret = false 
    else
      @personnage.secret = true
    end
    @personnage.update_attributes(params[:personnage])
    redirect_to personnage_path(@personnage)
  end

  def pnj_update
    @personnage = Personnage.find(params[:id])
    if @personnage.pnj
      @personnage.pnj = false 
    else
      @personnage.pnj = true
    end
    @personnage.update_attributes(params[:personnage])
    redirect_to personnage_path(@personnage)
  end

  def test_update
    @personnage = Personnage.find(params[:id])
    if @personnage.test
      @personnage.test = false 
    else
      @personnage.test = true
    end
    @personnage.update_attributes(params[:personnage])
    redirect_to personnage_path(@personnage)
  end

  def create
    @personnage = Personnage.new(params[:personnage])
    @personnage.user = @user
    @personnage.base_all
    respond_to do |format|
      if @personnage.save
        if params[:random].present?
          @personnage.random_base!
          return redirect_to personnage_path(@personnage)
        end
        format.html { redirect_to edit_personnage_path(@personnage), notice: 'Personnage a été crée avec succès.' }
        format.json { render action: 'edit', status: :created, location: @personnage }
      else
        format.html { render action: "new" }
        format.json { render json: @personnage.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @personnage = Personnage.find(params[:id])
    pcapacites_p = params[:capacites_personnages]
    phistoriques_p = params[:historiques_personnages]
    pspheres_p = params[:spheres_personnages]
    pdisciplines_p = params[:disciplines_personnages]
    patouts_p = params[:atouts_personnages]
    parts_p = params[:arts_personnages]
    proyaumes_p = params[:royaumes_personnages]
    pp = params[:personnage]
    @personnage.trace = ""
    ok = false
    unless @personnage.has_base
      ok_base = @personnage.ok_base(pp, pcapacites_p, phistoriques_p, pspheres_p, pdisciplines_p, parts_p, proyaumes_p)
      if ok_base
        params[:personnage][:has_base] = true
        params[:personnage][:caracteristique_base] = @personnage.create_caracteristique_base(pp, pcapacites_p, phistoriques_p, pspheres_p, pdisciplines_p, parts_p, proyaumes_p)
        ok = true
      else
        if @personnage.none_validation
          params[:personnage][:has_base] = true
          params[:personnage][:caracteristique_base] = @personnage.create_caracteristique_base(pp, pcapacites_p, phistoriques_p, pspheres_p, pdisciplines_p, parts_p, proyaumes_p)
        else
          params[:personnage][:has_base] = false
        end
      end
    else
      unless @personnage.has_bonus
        if @personnage.ok_bonus(params[:personnage], pcapacites_p, phistoriques_p, patouts_p, pspheres_p, pdisciplines_p, parts_p, proyaumes_p)
          params[:personnage][:has_bonus] = true
          params[:personnage][:caracteristique_bonus] = @personnage.create_caracteristique_bonus(pp, pcapacites_p, phistoriques_p, patouts_p, pspheres_p, pdisciplines_p, parts_p, proyaumes_p)
          ok = true
        else
          if @personnage.none_validation
            params[:personnage][:has_bonus] = true
            params[:personnage][:caracteristique_bonus] = @personnage.create_caracteristique_bonus(pp, pcapacites_p, phistoriques_p, patouts_p, pspheres_p, pdisciplines_p, parts_p, proyaumes_p)
          else
            params[:personnage][:has_bonus] = false
          end
        end
      else
        ok = true
      end
    end
    respond_to do |format|
      if (ok || @personnage.none_validation) && @personnage.valid?
        params[:personnage].delete("capacite_ids")
        params[:personnage].delete("historique_ids")
        params[:personnage].delete("discipline_ids")
        @personnage.lock = false
        @personnage.update_attributes(params[:personnage])
        @personnage.check_and_add_if
        update_capacites(pcapacites_p)
        update_historiques(phistoriques_p)
        update_spheres(pspheres_p)
        update_disciplines(pdisciplines_p)
        update_atouts(patouts_p)
        update_arts(parts_p)
        update_royaumes(proyaumes_p)
        @personnage.calcule_rang
        @personnage.calcule_graph
        format.html { redirect_to @personnage, notice: 'Personnage a été édité avec succès.' }
        format.json { head :no_content }
      else
        flash[:notice] = @personnage.trace if @personnage.trace.present?
        @personnage.lock = true
        @personnage.update_attributes(params[:personnage])
        @capacites_personnages = CapacitesPersonnages.where(personnage_id: params[:id])
        @historiques_personnages = HistoriquesPersonnages.where(personnage_id: params[:id])
        @disciplines_personnages = DisciplinesPersonnages.where(personnage_id: params[:id])
        @arts_personnages = ArtsPersonnages.where(personnage_id: params[:id])
        @royaumes_personnages = PersonnagesRoyaumes.where(personnage_id: params[:id])
        @atouts_personnages = AtoutsPersonnages.where(personnage_id: params[:id]) + recover_values_atouts(params[:personnage][:atout_ids])
        @values_capacites = recover_values_capacites(pcapacites_p)
        @values_historiques = recover_values_historiques(phistoriques_p)
        @values_spheres = recover_values_spheres(pspheres_p)
        @values_disciplines = recover_values_disciplines(pdisciplines_p)
        format.html { render action: "edit" }
        format.json { head :no_content }
      end
    end
  end

# For Ajax test
  def get_infos
    respond_to do |format|
      format.html "toto"
      # format.json { render json: {"foo" => 1} }
    end
  end

  def destroy
    @personnage = Personnage.find(params[:id])
    redirect_to root_url if !permition?(@user)
    CapacitesPersonnages.where(personnage_id: @personnage.id).destroy_all
    HistoriquesPersonnages.where(personnage_id: @personnage.id).destroy_all
    DisciplinesPersonnages.where(personnage_id: @personnage.id).destroy_all
    AtoutsPersonnages.where(personnage_id: @personnage.id).destroy_all
    Sphere.where(personnage_id: @personnage.id).destroy_all
    @personnage.destroy

    respond_to do |format|
      format.html { redirect_to personnages_url }
      format.json { head :no_content }
    end
  end

  def reset_xps
    @personnage = Personnage.find(params[:id])
    @personnage.reset_xps
    redirect_to personnage_path(@personnage)
  end

  def reset_bonus
    @personnage = Personnage.find(params[:id])
    @personnage.reset_bonus
    redirect_to personnage_path(@personnage)
  end

  def reset_base
    @personnage = Personnage.find(params[:id])
    @personnage.reset_base
    redirect_to personnage_path(@personnage)
  end

  private

  def recover_values_capacites(capacites_personnages)
    out = {}
    if capacites_personnages != nil
      capacites_personnages.each do |i, cp|
        ii = i
        ii = Capacite.find(i.split("_")[1].to_i).id if i.split("_")[0] == "t"
        out[ii.to_i] = cp[:niveau].to_i
      end
    end
    out
  end

  def recover_values_disciplines(disciplines_personnages)
    out = {}
    if disciplines_personnages != nil
      disciplines_personnages.each do |i, cp|
        ii = i
        ii = Discipline.find(i.split("_")[1].to_i).id if i.split("_")[0] == "t"
        out[ii.to_i] = cp[:niveau].to_i
      end
    end
    out
  end

  def recover_values_historiques(historiques_personnages)
    out = {}
    if historiques_personnages != nil
      historiques_personnages.each do |i, cp|
        ii = i
        ii = Historique.find(i.split("_")[1].to_i).id if i.split("_")[0] == "t"
        out[ii.to_i] = cp[:niveau].to_i
      end
    end
    out
  end

  def recover_values_atouts(atout_ids)
    out = []
    if atout_ids != nil
      atout_ids.each do |i|
        out.push(AtoutsPersonnages.new(atout_id: i.to_i, personnage_id: @personnage.id)) if i.present?
      end
    end
    out
  end

  def recover_values_spheres(spheres_personnages)
    out = {}
    if spheres_personnages != nil
      spheres_personnages.each do |i, s|
        sphere = Sphere.find i.to_i if i.present?
        sphere.niveau = s["niveau"]
        sphere.specialite = s["specialite"]
        out[sphere.name] = sphere
      end
    end
    out
  end

  def permition?(user)
    return true if user.role != User::ROLE_NORMA
    return true if @personnage.user == user
    false
  end

  def update_capacites(capacites_personnages)
    if capacites_personnages != nil
      capacites_personnages.each do |i, cp|
        ii = i
        ii = Capacite.find(i.split("_")[1].to_i).id if i.split("_")[0] == "t"
        if is_cp(i)
          cap = CapacitesPersonnages.where(id: i, personnage_id: @personnage.id)
          cap.first.update_attributes(cp)
        else
          CapacitesPersonnages.create(personnage_id: @personnage.id, capacite_id: ii, niveau: cp[:niveau], specialite: cp[:specialite])
        end
      end
    end
  end

  def update_historiques(historiques_personnages)
    if historiques_personnages != nil
      historiques_personnages.each do |i, cp|
        ii = i
        ii = Historique.find(i.split("_")[1].to_i).id if i.split("_")[0] == "t"
        if is_hp(i)
          cap = HistoriquesPersonnages.find(i)
          cap.update_attributes(cp)
        else
          HistoriquesPersonnages.create(personnage_id: @personnage.id, historique_id: ii.to_i, niveau: cp[:niveau])
        end
      end
    end
  end

  def update_disciplines(disciplines_personnages)
    if disciplines_personnages != nil
      # raise "disciplines !"
      disciplines_personnages.each do |i, cp|
        ii = i
        ii = Discipline.find(i.split("_")[1].to_i).id if i.split("_")[0] == "t"
        if is_dp(i)
          cap = DisciplinesPersonnages.where(id: i, personnage_id: @personnage.id)
          cap.first.update_attributes(cp)
        else
          DisciplinesPersonnages.create(personnage_id: @personnage.id, discipline_id: ii.to_i, niveau: cp[:niveau])
        end
      end
    end
  end

  def update_arts(arts_personnages)
    if arts_personnages != nil
      arts_personnages.each do |i, ap|
        ii = i
        ii = Art.find(i.split("_")[1].to_i).id if i.split("_")[0] == "t"
        if is_arp(ii)
          art = ArtsPersonnages.where(id: i, personnage_id: @personnage.id)
          art.first.update_attributes(ap)
        else
          ArtsPersonnages.create(personnage_id: @personnage.id, art_id: ii.to_i, niveau: ap[:niveau].to_i)
        end
      end
    end
  end

  def update_royaumes(royaumes_personnages)
    if royaumes_personnages != nil
      royaumes_personnages.each do |i, ap|
        ii = i
        ii = Royaume.find(i.split("_")[1].to_i).id if i.split("_")[0] == "t"
        if is_rp(ii)
          art = PersonnagesRoyaumes.where(id: i, personnage_id: @personnage.id)
          art.first.update_attributes(ap)
        else
          PersonnagesRoyaumes.create(personnage_id: @personnage.id, art_id: ii.to_i, niveau: ap[:niveau].to_i)
        end
      end
    end
  end

  def update_spheres(spheres_personnages)
    if spheres_personnages != nil
      spheres_personnages.each do |i, cp|
        sph = Sphere.find(i)
        # raise cp["niveau"].inspect if cp["niveau"].to_i != 0
        sph.update_attributes(cp)
        sph.update_attribute(:personnage_id,  @personnage.id) if sph.personnage_id.blank?
      end
    end
  end

  def update_atouts(atouts_personnages)
    if atouts_personnages != nil
      # raise atouts_personnages.inspect
      atouts_personnages.each do |i, ap|
        ii = i
        ii = Atout.find(i.split("_")[1].to_i).id if i.split("_")[0] == "t"
        if is_ap(ii)
          ato = AtoutsPersonnages.where(id: ii, personnage_id: @personnage.id)
          ato.first.update_attributes(ap)
        else
          AtoutsPersonnages.create(personnage_id: @personnage.id, atout_id: ii.to_i, detail: ap[:detail])
        end
      end
    end
  end

  def is_cp(key)
    begin
      cap = CapacitesPersonnages.where(id: key, personnage_id: @personnage.id)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end

  def is_hp(key)
    begin
      cap = HistoriquesPersonnages.where(id: key, personnage_id: @personnage.id)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end

  def is_dp(key)
    begin
      cap = DisciplinesPersonnages.where(id: key, personnage_id: @personnage.id)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end

  def is_ap(key)
    begin
      ato = AtoutsPersonnages.where(id: key, personnage_id: @personnage.id)
    rescue ActiveRecord::RecordNotFound => e
      ato = nil
    end
    return true if ato.count > 0
    false
  end

  def is_arp(key)
    begin
      ato = ArtsPersonnages.where(id: key, personnage_id: @personnage.id)
    rescue ActiveRecord::RecordNotFound => e
      ato = nil
    end
    return true if ato.count > 0
    false
  end

  def has_sp(key)
    begin
      cap = Sphere.where(id: key, personnage_id: @personnage.id)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end

  def is_rp(key)
    begin
      cap = PersonnagesRoyaumes.where(id: key, personnage_id: @personnage.id)
    rescue ActiveRecord::RecordNotFound => e
      cap = nil
    end
    return true if cap.count > 0
    false
  end

end
