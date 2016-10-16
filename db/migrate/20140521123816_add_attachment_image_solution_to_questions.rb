class AddAttachmentImageSolutionToQuestions < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      t.attachment :image_solution
    end
  end

  def self.down
    drop_attached_file :questions, :image_solution
  end
end
