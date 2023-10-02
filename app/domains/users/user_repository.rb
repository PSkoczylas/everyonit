# frozen_string_literal: true

module Users
  # Repository with active record query to User model
  class UserRepository
    class << self
      IS_OPEN_FOR_JOB = 2
      def find_active_users
        User.all.where(open_for_job: IS_OPEN_FOR_JOB, is_anonymous: false)
      end

      def find_user(id)
        User.find(id)
      end
    end
  end
end
