class AddAnswerIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :answer_id, :integer
  end
end
