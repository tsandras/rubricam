class VersionCommentsController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:index, :show]
  before_filter :redirect_unauthorized_to_write, only: [:new, :edit, :create, :update, :destroy]

  # GET /version_comments
  # GET /version_comments.json
  def index
    @version_comments = VersionComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @version_comments }
    end
  end

  # GET /version_comments/1
  # GET /version_comments/1.json
  def show
    @version_comment = VersionComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @version_comment }
    end
  end

  # GET /version_comments/new
  # GET /version_comments/new.json
  def new
    @version_comment = VersionComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @version_comment }
    end
  end

  # GET /version_comments/1/edit
  def edit
    @version_comment = VersionComment.find(params[:id])
  end

  # POST /version_comments
  # POST /version_comments.json
  def create
    @version_comment = VersionComment.new(params[:version_comment])

    respond_to do |format|
      if @version_comment.save
        format.html { redirect_to @version_comment, notice: 'Version comment was successfully created.' }
        format.json { render json: @version_comment, status: :created, location: @version_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @version_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /version_comments/1
  # PUT /version_comments/1.json
  def update
    @version_comment = VersionComment.find(params[:id])

    respond_to do |format|
      if @version_comment.update_attributes(params[:version_comment])
        format.html { redirect_to @version_comment, notice: 'Version comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @version_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /version_comments/1
  # DELETE /version_comments/1.json
  def destroy
    @version_comment = VersionComment.find(params[:id])
    @version_comment.destroy

    respond_to do |format|
      format.html { redirect_to version_comments_url }
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
