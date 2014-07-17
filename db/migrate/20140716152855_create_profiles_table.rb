class CreateProfilesTable < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.date :bday
      t.integer :user_id
    end
  end
end
