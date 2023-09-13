class ChangePasswordDiggestToPasswordDigest < ActiveRecord::Migration[7.0]
  def change
    rename_column :accounts, :password_diggest, :password_digest
  end
end
