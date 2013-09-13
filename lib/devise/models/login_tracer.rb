module Devise
  module Models
    module LoginTracer

      def mark_login!(request)
        UserLogin.create(attrs_for_user_login(request))
      end

      protected

      def attrs_for_user_login(request)
        { user_id: id, ip_address: request.remote_ip,
          user_agent: request.user_agent, signed_in_at: Time.now }
      end

    end
  end
end
