class CreateSpecialistAds < ActiveRecord::Migration[7.0]
  def change
    create_table :specialist_ads do |t|
      t.text :description
      t.string :title
      t.integer :desired_level
      t.integer :desired_salary

      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
