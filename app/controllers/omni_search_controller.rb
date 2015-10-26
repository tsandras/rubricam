class OmniSearchController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:search]

  def search
    @omni_search = OmniSearch.new(@user, {text: params[:query]})
    @omni_search.global
    respond_to do |format|
      format.json { render json: @omni_search.results }
    end
  end
end
