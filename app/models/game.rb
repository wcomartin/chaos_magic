class Game < ApplicationRecord
  has_many :players
  has_many :people, through: :players
  has_many :turns

  attribute :status, :string, default: "playing"

  scope :archived, -> { where.not(archived_at: nil) }


validates_presence_of :players
end
