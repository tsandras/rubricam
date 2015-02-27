class DisciplinesController < ApplicationController
  # GET /disciplines
  # GET /disciplines.json
  skip_before_filter :authenticate_user!, only: [:index, :show]

  def index
    # raise params.inspect
    @disciplines = Discipline.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @disciplines }
    end
  end

  # GET /disciplines/1
  # GET /disciplines/1.json
  def show
    @discipline = Discipline.find(params[:id])
    @nivdisciplines = Nivdiscipline.where(discipline_id: @discipline.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discipline }
    end
  end

  # GET /disciplines/new
  # GET /disciplines/new.json
  def new
    return redirect_to root_url if !permition_to_write?(@user)
    @discipline = Discipline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discipline }
    end
  end

  # GET /disciplines/1/edit
  def edit
    return redirect_to root_url if !permition_to_write?(@user)
    @discipline = Discipline.find(params[:id])
  end

  # POST /disciplines
  # POST /disciplines.json
  def create
    return redirect_to root_url if !permition_to_write?(@user)
    @discipline = Discipline.new(params[:discipline])

    respond_to do |format|
      if @discipline.save
        format.html { redirect_to @discipline, notice: 'Discipline was successfully created.' }
        format.json { render json: @discipline, status: :created, location: @discipline }
      else
        format.html { render action: "new" }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /disciplines/1
  # PUT /disciplines/1.json
  def update
    return redirect_to root_url if !permition_to_write?(@user)
    @discipline = Discipline.find(params[:id])

    respond_to do |format|
      if @discipline.update_attributes(params[:discipline])
        format.html { redirect_to @discipline, notice: 'Discipline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    return redirect_to root_url if !permition_to_write?(@user)
    @discipline = Discipline.find(params[:id])
    @discipline.destroy

    respond_to do |format|
      format.html { redirect_to disciplines_url }
      format.json { head :no_content }
    end
  end
end
