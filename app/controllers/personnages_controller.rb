class PersonnagesController < ApplicationController

  def index
    @personnages = Personnage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personnages }
    end
  end

  def show
    @personnage = Personnage.find(params[:id])
    @capacites = CapacitesPersonnages.where(personnage_id: params[:id])
    @historiques = HistoriquesPersonnages.where(personnage_id: params[:id])
    @atouts = AtoutsPersonnages.where(personnage_id: params[:id])
    @to_relations = Relation.where(to_personnage_id: params[:id])
    @from_relations = Relation.where(from_personnage_id: params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @personnage }
    end
  end

  def new
    @personnage = Personnage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @personnage }
    end
  end

  def edit
    @personnage = Personnage.find(params[:id])
    @capacites_personnages = CapacitesPersonnages.where(personnage_id: params[:id])
    @historiques_personnages = HistoriquesPersonnages.where(personnage_id: params[:id])
    @disciplines_personnages = DisciplinesPersonnages.where(personnage_id: params[:id])
    # @atouts_personnages = AtoutsPersonnages.where(personnage_id: params[:id])
  end

  def create
    params[:personnage].delete("capacite_ids")
    params[:personnage].delete("historique_ids")
    params[:personnage].delete("discipline_ids")
    @personnage = Personnage.new(params[:personnage])
    ok = false
    unless @personnage.has_base
        if ok_base(params[:personnage], params[:capacites_personnages], params[:historiques_personnages], params[:spheres_personnages], params[:disciplines_personnages])
          @personnage.has_base = true
          @personnage.caracteristique_base = create_caracteristique_base(params[:personnage], params[:capacites_personnages], params[:historiques_personnages], params[:spheres_personnages], params[:disciplines_personnages])
          ok = true
        else
          params[:personnage][:has_base] = false
        end
    else
      ok = true
    end
    respond_to do |format|
      if ok && @personnage.valid?
        @personnage.save()
        update_capacites(params[:capacites_personnages])
        update_historiques(params[:historiques_personnages])
        update_spheres(params[:spheres_personnages])
        update_disciplines(params[:disciplines_personnages])
        format.html { redirect_to @personnage, notice: 'Personnage was successfully created.' }
        format.json { render json: @personnage, status: :created, location: @personnage }
      else
        format.html { render action: "new" }
        format.json { render json: @personnage.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    params[:personnage].delete("capacite_ids")
    params[:personnage].delete("historique_ids")
    params[:personnage].delete("discipline_ids")
    @personnage = Personnage.find(params[:id])
    # update_atouts(params[:atouts_personnages])
    ok = false
    unless @personnage.has_base
        if ok_base(params[:personnage], params[:capacites_personnages], params[:historiques_personnages])
          params[:personnage][:has_base] = true
          params[:personnage][:caracteristique_base] = create_caracteristique_base(params[:personnage], params[:capacites_personnages], params[:historiques_personnages])
          ok = true
        else
          params[:personnage][:has_base] = false
        end
    else
      unless @personnage.has_bonus
        if ok_bonus(params[:personnage], params[:capacites_personnages], params[:historiques_personnages], params[:atouts_personnages], params[:spheres_personnages], params[:disciplines_personnages])
          params[:personnage][:has_bonus] = true
          params[:personnage][:caracteristique_bonus] = create_caracteristique_bonus(params[:personnage], params[:capacites_personnages], params[:historiques_personnages], params[:atouts_personnages], params[:spheres_personnages], params[:disciplines_personnages])
          ok = true
        else
          params[:personnage][:has_bonus] = false
        end
      else
        ok = true
      end
    end
    respond_to do |format|
      if ok && @personnage.valid?
        @personnage.update_attributes(params[:personnage])
        update_capacites(params[:capacites_personnages])
        update_historiques(params[:historiques_personnages])
        update_spheres(params[:spheres_personnages])
        update_disciplines(params[:disciplines_personnages])
        format.html { redirect_to @personnage, notice: 'Personnage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to edit_personnage_path(@personnage) }
      end
    end
  end

  def destroy
    @personnage = Personnage.find(params[:id])
    @personnage.destroy

    respond_to do |format|
      format.html { redirect_to personnages_url }
      format.json { head :no_content }
    end
  end

  private

  def update_capacites(capacites_personnages)
    if capacites_personnages != nil
      capacites_personnages.each do |i, cp|
        if is_cp(i)
          cap = CapacitesPersonnages.where(id: i, personnage_id: @personnage.id)
          cap.first.update_attributes(cp)
        else
          cap_f = Capacite.find(i)
          CapacitesPersonnages.create(personnage_id: @personnage.id, capacite_id: cap_f.id, niveau: cp[:niveau], specialite: cp[:specialite])
        end
      end
    end
  end

  def update_historiques(historiques_personnages)
    if historiques_personnages != nil
      historiques_personnages.each do |i, cp|
        if is_hp(i)
          cap = HistoriquesPersonnages.find(i)
          cap.update_attributes(cp)
        else
          HistoriquesPersonnages.create(personnage_id: @personnage.id, historique_id: i.to_i, niveau: cp[:niveau])
        end
      end
    end
  end

  def update_disciplines(disciplines_personnages)
    if disciplines_personnages != nil
      raise "disciplines !"
      disciplines_personnages.each do |i, cp|
        if is_dp(i)
          cap = DisciplinesPersonnages.where(id: i, personnage_id: @personnage.id)
          cap.first.update_attributes(cp)
        else
          DisciplinesPersonnages.create(personnage_id: @personnage.id, discipline_id: i.to_i, niveau: cp[:niveau])
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

  def ok_base(personnage, capacites, historiques, spheres, disciplines)
    physique = personnage[:force].to_i + personnage[:dexterite].to_i + personnage[:vigueur].to_i
    social = personnage[:charisme].to_i + personnage[:manipulation].to_i + personnage[:apparence].to_i
    mental = personnage[:perception].to_i + personnage[:intelligence].to_i + personnage[:astuce].to_i
    talent = 0
    competence = 0
    connaissance = 0
    historique = 0
    if capacites != nil
      capacites.each do |key, c|
        if is_cp(key)
          capper = CapacitesPersonnages.find(key)
          cap = capper.capacite
        else
          cap = Capacite.find(key)
        end
        add = 1 if cap.primaire
        add = 0.5 unless cap.primaire
        add = add * c[:niveau].to_i
        if cap.type_cap == "Talent"
          talent = talent + add
        elsif cap.type_cap == "Compétence"
          competence = competence + add
        else
          connaissance = connaissance + add
        end
      end
    end
    if historiques != nil
      historiques.each do |key, c|
        historique = historique + c[:niveau].to_i
      end
    end
    # raise ok_base_surnaturel(personnage, spheres, disciplines).inspect
    return false unless ok_base_surnaturel(personnage, spheres, disciplines)
    return false unless physique != 10 || physique != 8 || physique != 6
    return false unless social != 10 || social != 8 || social != 6
    return false unless mental != 10 || mental != 8 || mental != 6
    return false if physique == mental || physique == social || social == mental
    return false unless talent != 13 || talent != 9 || talent != 5
    return false unless competence != 13 || competence != 9 || competence != 5
    return false unless connaissance != 13 || connaissance != 9 || connaissance != 5
    return false if talent == competence || talent == connaissance || competence == connaissance
    return false if historique != 7
    true
  end

  def ok_base_surnaturel(personnage, spheres, disciplines)
    if personnage[:type_perso] == "Vampire"
      if disciplines != nil
        dis = 0
        disciplines.each do |key, c|
          dis = dis + c[:niveau].to_i
        end
        return false if dis != 4
        return true
      else
        return false
      end
    elsif personnage[:type_perso] == "Mage"
      if spheres != nil
        sph = 0
        spheres.each do |key, c|
          sph = sph + c[:niveau].to_i
        end
        return false if sph != 5
        return true
      else
        return false
      end
    end
    true
  end

  def ok_bonus(personnage, capacites, historiques, atouts, spheres, disciplines)
    perso_base = JSON.parse(@personnage.caracteristique_base)
    points_attributs = 0
    points_capacites = 0
    points_historique = 0
    points_attributs = points_attributs + (personnage[:force].to_i - perso_base["Personnage"]["force"]) * 4;
    points_attributs = points_attributs + (personnage[:dexterite].to_i - perso_base["Personnage"]["dexterite"]) * 4;
    points_attributs = points_attributs + (personnage[:vigueur].to_i - perso_base["Personnage"]["vigueur"]) * 4;
    points_attributs = points_attributs + (personnage[:charisme].to_i - perso_base["Personnage"]["charisme"]) * 4;
    points_attributs = points_attributs + (personnage[:manipulation].to_i - perso_base["Personnage"]["manipulation"]) * 4;
    points_attributs = points_attributs + (personnage[:apparence].to_i - perso_base["Personnage"]["apparence"]) * 4;
    points_attributs = points_attributs + (personnage[:perception].to_i - perso_base["Personnage"]["perception"]) * 4;
    points_attributs = points_attributs + (personnage[:intelligence].to_i - perso_base["Personnage"]["intelligence"]) * 4;
    points_attributs = points_attributs + (personnage[:astuce].to_i - perso_base["Personnage"]["astuce"]) * 4;
    perso_base["Capacites"]["Talent"].each do |key, pb|
      capper = CapacitesPersonnages.where(capacite_id: key, personnage_id: @personnage.id).first
      points_capacites = points_capacites + (capacites[capper.id.to_s][:niveau].to_i - pb.to_i) * 2
    end
    perso_base["Capacites"]["Competence"].each do |key, pb|
      capper = CapacitesPersonnages.where(capacite_id: key, personnage_id: @personnage.id).first
      points_capacites = points_capacites + (capacites[capper.id.to_s][:niveau].to_i - pb.to_i) * 2
    end
    perso_base["Capacites"]["Connaissance"].each do |key, pb|
      capper = CapacitesPersonnages.where(capacite_id: key, personnage_id: @personnage.id).first
      points_capacites = points_capacites + (capacites[capper.id.to_s][:niveau].to_i - pb.to_i) * 2
    end
    perso_base["Historiques"].each do |key, pb|
      hisper = HistoriquesPersonnages.where(historique_id: key, personnage_id: @personnage.id).first
      points_capacites = points_capacites + (historiques[hisper.id.to_s][:niveau].to_i - pb.to_i)
    end
    personnage["atout_ids"].each do |id|
      if id.present?
        at = Atout.find(id)
        points_attributs = points_attributs + at.cout
      end
    end
    points_surnaturels = ok_bonus_surnaturel(perso_base, spheres, disciplines)
    points_bonus = points_attributs + points_capacites + points_historique + points_surnaturels
    return false if points_bonus != personnage[:bonus].to_i
    true
  end

  def ok_bonus_surnaturel(perso_base, spheres, disciplines)
    out = 0
    if spheres != nil
      spheres.each do |key, sphere|
        # raise perso_base["Spheres"].inspect
        out = out + (sphere[:niveau].to_i - perso_base["Spheres"][key].to_i) * 7
      end
    end
    if disciplines != nil
      disciplines.each do |key, discipline|
        if is_dp(key)
          disper = DisciplinesPersonnages.find(key)
          dis_id = disper.discipline.id
        else
          dis_id = key
        end
        out = out + (discipline[:niveau].to_i - perso_base["Disciplines"][dis_id.to_s].to_i) * 7
      end
    end
    out
  end

  def create_caracteristique_bonus(personnage, capacites, historiques, atouts, spheres, disciplines)
    perso_base = JSON.parse(@personnage.caracteristique_base)
    perso_bonus = {}
    perso_bonus["Personnage"] = {}
    perso_bonus["Personnage"]["force"] = personnage[:force].to_i - perso_base["Personnage"]["force"]
    perso_bonus["Personnage"]["dexterite"] = personnage[:dexterite].to_i - perso_base["Personnage"]["dexterite"]
    perso_bonus["Personnage"]["vigueur"] = personnage[:vigueur].to_i - perso_base["Personnage"]["vigueur"]
    perso_bonus["Personnage"]["charisme"] = personnage[:charisme].to_i - perso_base["Personnage"]["charisme"]
    perso_bonus["Personnage"]["manipulation"] = personnage[:manipulation].to_i - perso_base["Personnage"]["manipulation"]
    perso_bonus["Personnage"]["apparence"] = personnage[:apparence].to_i - perso_base["Personnage"]["apparence"]
    perso_bonus["Personnage"]["perception"] = personnage[:perception].to_i - perso_base["Personnage"]["perception"]
    perso_bonus["Personnage"]["intelligence"] = personnage[:intelligence].to_i - perso_base["Personnage"]["intelligence"]
    perso_bonus["Personnage"]["astuce"] = personnage[:astuce].to_i - perso_base["Personnage"]["astuce"]
    perso_bonus["Capacites"] = {}
    perso_bonus["Capacites"]["Talent"] = {}
    perso_bonus["Capacites"]["Competence"] = {}
    perso_bonus["Capacites"]["Connaissance"] = {}
    perso_base["Capacites"]["Talent"].each do |key, pb|
      capper = CapacitesPersonnages.where(capacite_id: key, personnage_id: @personnage.id).first
      perso_bonus["Capacites"]["Talent"][key] = capacites[capper.id.to_s][:niveau].to_i - pb.to_i
    end
    perso_base["Capacites"]["Competence"].each do |key, pb|
      capper = CapacitesPersonnages.where(capacite_id: key, personnage_id: @personnage.id).first
      perso_bonus["Capacites"]["Competence"][key] = capacites[capper.id.to_s][:niveau].to_i - pb.to_i
    end
    perso_base["Capacites"]["Connaissance"].each do |key, pb|
      capper = CapacitesPersonnages.where(capacite_id: key, personnage_id: @personnage.id).first
      perso_bonus["Capacites"]["Connaissance"][key] = capacites[capper.id.to_s][:niveau].to_i - pb.to_i
    end
    perso_bonus["Historiques"] = {}
    perso_base["Historiques"].each do |key, pb|
      hisper = HistoriquesPersonnages.where(historique_id: key, personnage_id: @personnage.id).first
      perso_bonus["Historiques"][key] = historiques[hisper.id.to_s][:niveau].to_i - pb.to_i
    end
    perso_bonus["Atouts"] = {}
    personnage["atout_ids"].each do |id|
      if id.present?
        at = Atout.find(id)
        perso_bonus["Atouts"][id] = at.cout
      end
    end
    if spheres != nil
      perso_bonus["Spheres"] = {}
      spheres.each do |key, c|
        perso_bonus["Spheres"][key] = c[:niveau].to_i - perso_base["Spheres"][key].to_i
      end
    end
    if disciplines != nil
      perso_bonus["Disciplines"] = {}
      disciplines.each do |key, c|
        if is_dp(key)
          hisper = DisciplinesPersonnages.find(key)
          hiss = hisper.discipline
        else
          hiss = Discipline.find(key)
        end
        perso_bonus["Disciplines"][hiss.id] = c[:niveau].to_i - perso_base["Disciplines"][hiss.id.to_s].to_i
      end
    end
    perso_bonus.to_json
  end

  def create_caracteristique_base(personnage, capacites, historiques, spheres, disciplines)
    per = "{\"force\": #{personnage[:force]}, \"dexterite\": #{personnage[:dexterite]}, \"vigueur\": #{personnage[:vigueur]},\"charisme\": #{personnage[:charisme]}, \"manipulation\": #{personnage[:manipulation]}, \"apparence\": #{personnage[:apparence]},\"perception\": #{personnage[:perception]}, \"intelligence\": #{personnage[:intelligence]}, \"astuce\": #{personnage[:astuce]}}"
    talent = {}
    competence = {}
    connaissance = {}
    capacites.each do |key, c|
      if is_cp(key)
        capper = CapacitesPersonnages.find(key)
        cap = capper.capacite
      else
        cap = Capacite.find(key)
      end
      if cap.type_cap == "Talent"
        talent[cap.id] = c[:niveau].to_i
      elsif cap.type_cap == "Compétence"
        competence[cap.id] = c[:niveau].to_i
      else
        connaissance[cap.id] = c[:niveau].to_i
      end
    end
    cap = {}
    cap["Talent"] = talent
    cap["Competence"] = competence
    cap["Connaissance"] = connaissance
    his = {}
    historiques.each do |key, c|
      if is_hp(key)
        hisper = HistoriquesPersonnages.find(key)
        hiss = hisper.historique
      else
        hiss = Historique.find(key)
      end
      his[hiss.id] = c[:niveau].to_i
    end
    out = "{\"Personnage\":"+per+",\"Capacites\":"+cap.to_json+", \"Historiques\":"+his.to_json
    if spheres != nil
      sph = {}
      spheres.each do |key, c|
        sph[key] = c[:niveau].to_i
      end
      out += ", \"Spheres\":"+sph.to_json
    end
    if disciplines != nil
      dis = {}
      disciplines.each do |key, c|
        if is_dp(key)
          hisper = DisciplinesPersonnages.find(key)
          hiss = hisper.discipline
        else
          hiss = Discipline.find(key)
        end
        dis[hiss.id] = c[:niveau].to_i
      end
      out += ", \"Disciplines\":"+dis.to_json
    end
    out += "}"
    out
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

  # def has_sp(key)
  #   begin
  #     cap = Sphere.where(id: key, personnage_id: @personnage.id)
  #   rescue ActiveRecord::RecordNotFound => e
  #     cap = nil
  #   end
  #   return true if cap.count > 0
  #   false
  # end

end
