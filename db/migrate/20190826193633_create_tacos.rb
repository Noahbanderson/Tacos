class CreateTacos < ActiveRecord::Migration[6.0]
  def change
    create_table :tacos do |t|
      t.string :name
      t.float :value
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
