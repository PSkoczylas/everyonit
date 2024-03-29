# frozen_string_literal: true

class CreateSpecialistAds < ActiveRecord::Migration[7.0]
  def change
    create_table :specialist_ads do |t|
      t.text :description
      t.string :title
      t.integer :desired_salary
      t.string :portfolio_url

      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
