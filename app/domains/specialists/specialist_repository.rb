# frozen_string_literal: true

module Specialists
  class SpecialistRepository
    class << self
      def find_active_specialists
        Specialist.find_by(open_for_job: true)
      end
    end
  end
end
