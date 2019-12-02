class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :number
      t.text :word

      t.timestamps
    end
  end
end
