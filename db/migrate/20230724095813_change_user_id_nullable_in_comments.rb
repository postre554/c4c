class ChangeUserIdNullableInComments < ActiveRecord::Migration[7.0]
  def change
    change_column :comments, :user_id, :bigint, null: true
  end
end
