class PocketItem
  attr_accessor :id, :time_added

  def initialize(id, time_added)
    @id = id
    @time_added = time_added
  end

  def self.for_person(person)
    result = person.to_client.retrieve(detailType: 'simple')
    result['list'].collect do |item_id, item_attributes|
      new(item_id, Time.at(item_attributes['time_added'].to_i))
    end
  end
end
