class AddUserInfoToIdentities < ActiveRecord::Migration[5.1]
  def change
  	add_column :identities, :info, :jsonb, index: true, default: {}
  end
end
