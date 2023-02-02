class Event < ApplicationRecord
  attr_reader :past, :upcoming

  belongs_to :creator, class_name: "User"
  has_many :rsvps, foreign_key: :attended_event_id
  has_many :attendees, through: :rsvps

  # Class methods replaced by Scopes below:
  # def self.upcoming
  #   return Event.all.where('date >= ?', Date.today).order(:date)
  # end

  # def self.past
  #   return Event.all.where('date < ?', Date.today)
  # end

  # Scopes replace the class methods above
  scope :upcoming_scope, -> { where('date >= ?', Date.today).order(:date) }
  scope :past_scope, -> { where('date < ?', Date.today) }

end