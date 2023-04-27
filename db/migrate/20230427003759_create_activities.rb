class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.integer "contact_id"
      t.integer "salesperson_id"
      t.string "occurred_at" 
      t.string "notes"
      t.timestamps
      # t.timestamps comes with created_at and updated_at
    end
  end
end


