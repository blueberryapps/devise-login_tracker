module Devise
  module Models
    module LoginTracker

      def mark_login!(request)
        login_class.create(attrs_for_login(request))
      end

      def mark_logout!(login_record_id)
        login_record = login_class.find(login_record_id)
        login_record.update_column :signed_out_at, Time.now
      end

      protected

      def attrs_for_login(request)
        { user_id: id, ip_address: request.remote_ip,
          user_agent: request.user_agent, signed_in_at: Time.now }
      end

      def login_class
        "#{self.class.name}Login".safe_constantize
      end

    end
  end
end
