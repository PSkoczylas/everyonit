# frozen_string_literal: true

class SpecialistsController < ApplicationController
  def index
    @specialists = repository.find_active_specialists
  end

  private

  def repository
    Specialists::SpecialistRepository
  end
end
