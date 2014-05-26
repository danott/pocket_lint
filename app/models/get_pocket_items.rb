class GetPocketItems
  include Service

  attr_reader :person

  def initialize(person)
    @person = person
  end

  def call
    person.to_client.retrieve(detailType: 'simple')['list'].values.map do |attrs|
      PocketItem.new(attrs)
    end
  end
end
