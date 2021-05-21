class AddCommenterIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :commenter_id, :int
  end
end
