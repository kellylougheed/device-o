class CreateExamples < ActiveRecord::Migration
  def change
    create_table :examples do |t|
      t.text :text
      t.string :device

      t.timestamps
    end
  end
end
