# frozen_string_literal: true

module Specialists
  # Repository with active record query to Specialist model
  class SpecialistRepository
    class << self
      def find_active_specialists
        Specialist.all.where(open_for_job: true)
      end

      def find_specialist(id)
        Specialist.find(id)
      end
    end
  end
end
