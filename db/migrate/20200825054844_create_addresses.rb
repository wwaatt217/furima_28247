class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postal_cord,        null: false
      t.integer     :prefecture,         null: false
      t.string      :city,               null: false
      t.string      :block,              null: false
      t.string      :buliding_name,      null: false
      t.integer     :phone_number,       null: false
      t.references  :buy,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
