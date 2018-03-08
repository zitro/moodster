class AddAttachmentAvatarToFeatures < ActiveRecord::Migration[5.1]
  def self.up
    change_table :features do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :features, :avatar
  end
end
