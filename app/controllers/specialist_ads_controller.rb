# frozen_string_literal: true

# Controller for IT announcement (description) actions
class SpecialistAdsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_advertisement, only: %i[create_or_update new_or_edit]

  def new_or_edit; end

  def create_or_update
    if @advertisement.update(advertisement_params)
      redirect_to specialist_ads_path, notice: 'Ogłoszenie zostało pomyślnie zaktualizowane.'
    else
      render :new_or_edit
    end
  end

  def index
    @users = user_repository.find_active_users.includes(:specialist_ad)
  end

  def show
    @user = user_repository.find_user(params[:id])
  end

  private

  def set_advertisement
    @advertisement = current_user.specialist_ad || current_user.build_specialist_ad
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
