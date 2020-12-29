class Timetable < ApplicationRecord
    validates :group, presence: true, uniqueness: true, length: { maximum: 50 }
    serialize :monday
    serialize :tuesday
    serialize :wednesday
    serialize :thursday
    serialize :friday
    serialize :saturday
end
