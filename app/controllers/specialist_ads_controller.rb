# frozen_string_literal: true

# Controller for IT announcement (description) actions
class UsersController < ApplicationController
  def new
    @specialist_ad = current_user
  end

  private

  def repository
    SpecialistAds::SpecialistAdRepository
  end

  def user_repository
    Users::UserRepository
  end
end
