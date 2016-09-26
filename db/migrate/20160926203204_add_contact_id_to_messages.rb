class AddContactIdToMessages < ActiveRecord::Migration[5.0]
  def change
    change_table :messages do |t|
      t.references :contact
    end
  end
end
