class Person < ActiveRecord::Base
  include NullObject

  store :preferences, accessors: [:action, :considered_lint_s], coder: JSON

  after_initialize :apply_defaults

  validates_inclusion_of :action, in: %w[archive delete]
  validates_inclusion_of :considered_lint_unit, in: %w[day days week weeks month months year years]
  validates_numericality_of :considered_lint_magnitude, greater_than: 0

  def considered_lint
    considered_lint_magnitude.send(considered_lint_unit)
  end

  def clean
    ModifyPocketItems.call(self, pocket_lint)
  end

  def to_client
    Pocket.client(access_token: access_token)
  end

  def pocket_items
    @pocket_items ||= RetrievePocketItems.call(self)
  end

  def pocket_lint
    pocket_items.select do |item|
      item.time_added < considered_lint.ago
    end
  end

  private

  def apply_defaults
    preferences[:action] ||= "archive"
    preferences[:considered_lint_s] ||= "1 month"
  end

  def considered_lint_magnitude
    considered_lint_s.to_i
  end

  def considered_lint_unit
    considered_lint_s.split.last
  end
end
