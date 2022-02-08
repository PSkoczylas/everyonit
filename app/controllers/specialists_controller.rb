class SpecialistsController < ApplicationController
  def index
    @specialists = Specialist.all
  end
end
