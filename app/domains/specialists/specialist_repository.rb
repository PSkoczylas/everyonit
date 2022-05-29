# frozen_string_literal: true

module Specialists
  class SpecialistRepository
    class << self
      def find_active_specialists
        Specialist.all.where(open_for_job: true)
      end
    end
  end
end
