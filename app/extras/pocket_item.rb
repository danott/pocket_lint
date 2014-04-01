class PocketItem
  extend PocketCredentials

  attr_accessor :id, :time_added

  def initialize(id, time_added)
    @id = id
    @time_added = time_added
  end

  def self.load_for(person)
    api_response = Typhoeus.post("https://getpocket.com/v3/get",
                               body: { consumer_key: consumer_key,
                                       access_token: person.access_token,
                                       state: 'unread' })

    JSON.parse(api_response.body)['list'].collect { |item_id, item_attributes|
      new(item_id, Time.at(item_attributes['time_added'].to_i))
    }
  end
end
