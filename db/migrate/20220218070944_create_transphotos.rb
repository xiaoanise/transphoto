class CreateTransphotos < ActiveRecord::Migration[6.0]
  def change
    create_table :transphotos do |t|
      t.string :title,            null: false
      t.text :from_to,            null: false
      t.text :message,            null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
