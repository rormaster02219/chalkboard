class AddImageToQuestionChoices < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      t.attachment :choice_a_image
      t.attachment :choice_b_image
      t.attachment :choice_c_image
      t.attachment :choice_d_image
    end
  end

  def self.down
    drop_attached_file :questions, :choice_a_image
    drop_attached_file :questions, :choice_b_image
    drop_attached_file :questions, :choice_c_image
    drop_attached_file :questions, :choice_d_image
  end
end
