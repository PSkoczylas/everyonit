# frozen_string_literal: true

# Controller for IT Users actions
class UsersController < ApplicationController
  def index
    @users = repository.find_active_users # dodac rowniez atrybut public profile, ktory tez musi byc true
  end

  def show
    @user = repository.find_user(params[:id])
  end

  private

  def repository
    Users::UserRepository
  end
end
