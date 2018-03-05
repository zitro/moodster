class CreateUserEmotions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_emotions do |t|
      t.integer :user_id
      t.integer :emotion_id

      t.timestamps
    end
  end
end
