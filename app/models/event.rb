class Event < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :user
  validates_presence_of :date_time

  belongs_to :user
  has_many :notifications


end
