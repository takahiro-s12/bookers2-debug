class RelationshipsController < ApplicationController
  def create
    current_user.create(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.destroy(params[:id])
    redirect_back(fallback_location: root_path)
  end

end
