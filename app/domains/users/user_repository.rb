# frozen_string_literal: true

module Users
  # Repository with active record query to User model
  class UserRepository
    class << self
      def find_active_users
        User.all.where(open_for_job: 2, is_anonymous: false)
      end

      def find_user(id)
        User.find(id)
      end
    end
  end
end
