class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.string :hashreturn
      t.integer :user_id

      t.timestamps
    end
  end
end
