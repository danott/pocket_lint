class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :username
      t.string :access_token
      t.text :preferences

      t.timestamps
    end
  end
end
