class SpecialistAdsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_advertisement, only: %i[edit update]

  def index
    @users = user_repository.find_active_users.includes(:specialist_ad)
  end

  def show
    @user = user_repository.find_user(params[:id])
  end

  def new
    @advertisement = current_user.build_specialist_ad
  end

  def create
    @advertisement = current_user.build_specialist_ad(advertisement_params)
    if @advertisement.save
      redirect_to specialist_ads_path, notice: 'Ogłoszenie zostało pomyślnie utworzone.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @advertisement.update(advertisement_params)
      redirect_to specialist_ads_path, notice: 'Ogłoszenie zostało pomyślnie zaktualizowane.'
    else
      render :edit
    end
  end

  private

  def set_advertisement
    @advertisement = current_user.specialist_ad
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
