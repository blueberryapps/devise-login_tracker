Warden::Manager.after_authentication do |record, warden, opts|
  if record.respond_to?(:mark_login!)
    record.mark_login!(warden.request)
  end
end

