class AddAccountRoleToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :account_role, :string
  end
end
