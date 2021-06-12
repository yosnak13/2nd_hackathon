class FavoritesController < ApplicationControllerdo
  def create
    @favorite = current_user.favorites.create(station_id: params[:station_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @station = Station.find(params[:station_id])
    @favorite = current_user.favorites.find_by(station_id: @station.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
