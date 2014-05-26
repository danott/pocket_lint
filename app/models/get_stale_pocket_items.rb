class GetStalePocketItems
  include Service

  attr_reader :person

  def initialize(person)
    @person = person
  end

  def call
    items.select do |item|
      item.time_added < person.criteria.days.ago
    end
  end

  private

  def items
    GetPocketItems.call(person)
  end
end
