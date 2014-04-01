class PocketItemTransformation
  attr_reader :person, :pocket_items

  def initialize(person, pocket_items)
    @person = person
    @pocket_items = pocket_items
  end

  def perform
    person.to_client.modify(actions)
  end

  private

  def actions
    pocket_items.collect do |pocket_item|
      { action: person.lint_action, item_id: pocket_item.id }
    end
  end
end
