class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.string :title
      t.integer :amount
      t.string :category
      t.date :occurred_on
      t.text :note

      t.timestamps
    end
  end
end
