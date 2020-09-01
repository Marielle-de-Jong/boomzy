class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :postcode
      t.string :address_line_1
      t.string :address_line_2
      t.references :addressable, polymorphic: true
      t.timestamps
    end
  end
end
