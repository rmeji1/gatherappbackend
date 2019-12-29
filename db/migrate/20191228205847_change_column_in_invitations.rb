class ChangeColumnInInvitations < ActiveRecord::Migration[6.0]
  def change
    change_column(:invitations, :confirmed,:boolean , :default => nil)
  end
end
