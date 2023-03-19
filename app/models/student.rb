class Student < ApplicationRecord
  validates :age,
            exclusion: {
              in: (0..17).to_a,
              message: 'A student must be above 18 years old.',
            }
  belongs_to :instructor
end
