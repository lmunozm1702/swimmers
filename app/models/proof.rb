class Proof < ApplicationRecord
    validates :abbreviation, :presence => true, uniqueness: true
    validates :description, :presence => true, uniqueness: true
end
