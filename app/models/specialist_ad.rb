# frozen_string_literal: true

class SpecialistAd < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10 }

  validates :desired_salary, numericality: { greater_than_or_equal_to: 0, only_integer: true }, allow_nil: true

  validates :portfolio_url, url: { allow_blank: true }
end
