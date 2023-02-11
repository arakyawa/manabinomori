class CreateNazos < ActiveRecord::Migration[6.1]
  def change
    create_table :nazos do |t|
      t.string :question

      t.timestamps
    end
  end
end
