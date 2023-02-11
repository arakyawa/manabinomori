class CreateNakamas < ActiveRecord::Migration[6.1]
  def change
    create_table :nakamas do |t|
      t.string :question

      t.timestamps
    end
  end
end
