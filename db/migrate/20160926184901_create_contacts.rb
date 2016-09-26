class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.references :user, foreign_key: true
      t.string :phone
      t.string :name

      t.timestamps
    end
  end
end
