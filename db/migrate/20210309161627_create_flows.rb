class CreateFlows < ActiveRecord::Migration[5.2]
  def change
    create_table :flows do |t|
      t.belongs_to :item, index: true
      t.belongs_to :order, index: true
      t.timestamps
    end
  end
end
