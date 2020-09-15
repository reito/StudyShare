class AddMicropostIdToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :micropost_id, :integer
  end
end
