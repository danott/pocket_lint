class PocketItemTransformation
  include PocketCredentials

  def initialize(person, pocket_items)
    @person = person
    @pocket_items = pocket_items
  end

  def perform
    Typhoeus.post "https://getpocket.com/v3/send", body: post_body
  end

  private

  attr_reader :person, :pocket_items

  def post_body
    { consumer_key: consumer_key,
      access_token: person.access_token,
      actions: actions.to_json }
  end

  def actions
    pocket_items.collect do |pocket_item|
      { action: person.lint_action, item_id: pocket_item.id }
    end
  end
end
