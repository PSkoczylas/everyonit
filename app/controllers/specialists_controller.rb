# frozen_string_literal: true

# Controller for IT Specialists actions
class SpecialistsController < ApplicationController
  def index
    @specialists = repository.find_active_specialists # dodac rowniez atrybut public profile, ktory tez musi byc true
  end

  def show
    @specialist = repository.find_specialist(params[:id])
  end

  private

  def repository
    Specialists::SpecialistRepository
  end
end
