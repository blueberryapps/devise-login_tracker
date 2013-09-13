Warden::Manager.after_authentication do |record, warden, opts|
  record.mark_login!(warden.request) if record.respond_to?(:mark_login!)
end

