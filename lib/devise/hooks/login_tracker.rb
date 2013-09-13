Warden::Manager.after_authentication do |record, warden, opts|
  if record.respond_to?(:mark_login!)
    login_record = record.mark_login!(warden.request)
    scope = opts[:scope]
    warden.session["#{scope}.login_id"] = login_record.id
  end
end


Warden::Manager.before_logout do |record, warden, opts|
  if record.respond_to?(:mark_logout!)
    scope = opts[:scope]
    login_record_id = warden.session["#{scope}.login_id"]
    record.mark_logout!(login_record_id) if login_record_id
  end
end
