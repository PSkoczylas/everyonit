class SpecialistAdsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_advertisement, only: %i[edit update]

  def index
    @pagy, @users = pagy(user_repository.find_active_users.includes(:specialist_ad), items: 8)
  end

  def show
    @user = user_repository.find_user_by_ad(params[:id])
    response.headers["Cache-Control"] = "no-cache, no-store"
    respond_to do |format|
      format.html { render layout: false } # Dodaj to, aby wymusić renderowanie bez layoutu
    end
  end

  def new
    @advertisement = current_user.build_specialist_ad
  end

  def create
    @advertisement = current_user.build_specialist_ad(advertisement_params)
    if @advertisement.save
      redirect_to specialist_ads_path, notice: 'Ogłoszenie zostało pomyślnie utworzone.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @advertisement.update(advertisement_params)
      # binding.pry
      redirect_to specialist_ads_path, notice: 'Ogłoszenie zostało pomyślnie zaktualizowane.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_advertisement
    @advertisement = SpecialistAd.find(params[:id])
    redirect_to new_specialist_ad_path, alert: 'Ogłoszenie nie znalezione.' if @advertisement.nil?
  end

  def advertisement_params
    params.require(:specialist_ad).permit(:title, :description)
  end

  def repository
    SpecialistAds::SpecialistAdRepository
  end

  def user_repository
    Users::UserRepository
  end
end
