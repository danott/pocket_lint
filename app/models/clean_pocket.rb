class CleanPocket
  include Service

  attr_reader :person

  def initialize(person)
    @person = person
  end

  def call
    ModifyPocketItems.call(person, stale_items)
  end

  private

  def stale_items
    GetStalePocketItems.call(person)
  end
end
