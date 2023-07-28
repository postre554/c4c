class ChangeUserReferenceInPublications < ActiveRecord::Migration[7.0]
  def change
    change_column :publications, :user_id, :bigint, null: true
  end
end
