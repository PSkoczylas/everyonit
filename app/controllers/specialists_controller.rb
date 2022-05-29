# frozen_string_literal: true

# Controller for IT Specialists actions
class SpecialistsController < ApplicationController
  def index
    @specialists = repository.find_active_specialists # dodac rowniez atrybut public profile, ktory tez musi byc true
  end

  private

  def repository
    Specialists::SpecialistRepository
  end
end
