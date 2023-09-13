class AddColumnsToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :date_of_birth, :date
    add_column :accounts, :company_number, :string
  end
end
