require 'active_support/inflector'

module Devise
  module Models
    module LoginTracker

      # Creates a new login record based on information in provided request
      # object.
      #
      # @param [ActionDispatch::Request] request HTTP request which was used
      # to login
      # @return [UserLogin]
      def mark_login!(request)
        logins.create( ip_address: request.remote_ip,
                      user_agent: request.user_agent,
                      signed_in_at: Time.now
                     )
      end

      # Marks the time when user has logged out on given login record ID.
      #
      # @param [Fixnum, String] login_record_id ID of login record.
      def mark_logout!(login_record_id)
        login_record = logins.find(login_record_id)
        login_record.update_column :signed_out_at, Time.now
      end


    end
  end
end

