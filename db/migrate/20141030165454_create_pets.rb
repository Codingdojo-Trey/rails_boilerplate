class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.references :user, index: true

      t.timestamps
    end
  end
end
