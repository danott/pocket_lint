class Person < ActiveRecord::Base
  include NullObject

  store :preferences, accessors: [:action, :frequency, :criteria], coder: JSON

  after_initialize :apply_defaults

  validates_inclusion_of :action, in: %w[archive delete]
  validates_inclusion_of :frequency, in: %w[daily weekly monthly]
  validates_numericality_of :criteria, greater_than: 0, less_than: 366

  def apply_defaults
    preferences[:action] ||= "archive"
    preferences[:frequency] ||= "monthly"
    preferences[:criteria] ||= 7
  end

  def criteria
    super.to_i
  end

  def to_client
    Pocket.client(access_token: access_token)
  end

  def clean_pocket
    CleanPocket.call(person)
  end
end
