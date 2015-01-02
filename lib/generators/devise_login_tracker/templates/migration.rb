class DeviseCreate<%= table_name.camelize.singularize %>Logins < ActiveRecord::Migration

  def up
    create_table :<%= table_name.singularize %>_logins do |t|
      t.integer  :<%= table_name.classify.foreign_key  %>
      t.inet     :ip_address
      t.string   :user_agent
      t.datetime :signed_in_at
      t.datetime :signed_out_at
    end

    add_index :<%= table_name.singularize %>_logins, :<%= table_name.classify.foreign_key  %>
  end

  def down
    drop_table :<%= table_name.singularize %>_logins
  end

end
