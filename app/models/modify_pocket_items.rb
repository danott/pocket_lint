class ModifyPocketItems
  include Service

  attr_reader :person, :items

  def initialize(person, items)
    @person = person
    @items = items
  end

  def call
    person.to_client.modify(actions)
  end

  private

  def actions
    items.collect do |item|
      { item_id: item.id, action: person.action }
    end
  end
end
