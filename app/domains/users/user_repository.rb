# frozen_string_literal: true

module Users
  # Repository with active record query to User model
  class UserRepository
    class << self
      IS_OPEN_FOR_JOB = 2
      def find_active_users
        User.joins(:specialist_ad).where(open_for_job: IS_OPEN_FOR_JOB, is_anonymous: false)
      end

      def find_user(id)
        User.find(id)
      rescue ActiveRecord::RecordNotFound
        raise Errors::UserNotFoundError, "No user found for id #{id}"
      end

      def find_user_by_ad(specialist_ad_id)
        SpecialistAd.find(specialist_ad_id).user
      end
    end
  end
end
