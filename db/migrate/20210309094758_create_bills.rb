class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.belongs_to :cart, index: true
      t.belongs_to :item, index: true
      t.timestamps
    end
  end
end
