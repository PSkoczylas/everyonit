# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      # is_anonymous
      # is_admin
      # dodac jeszcze rzeczy, ktore sie przydadza od razu
      # gdy bede dodawal mentorow i dodawanie do projektow
      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      # zastanowic sie nad polymorphic assocation jeszcze
      # t.string :type # for STI

      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      # t.integer :role # do STI trzeba zmienic na string type
      t.text :description
      t.string :main_specialization
      t.string :title
      t.string :repository_link
      t.integer :current_level
      t.integer :desired_level
      t.integer :desired_salary
      t.integer :account_type, default: 0
      t.integer :open_for_job, default: 0
      t.boolean :looking_for_mentor
      t.boolean :open_for_mentorship
      t.boolean :open_for_project_to_learn
      t.boolean :is_anonymous, default: false
      # t.boolean :is_admin, default: false
      t.boolean :has_own_company
      t.datetime :date_added_open_for_job

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
