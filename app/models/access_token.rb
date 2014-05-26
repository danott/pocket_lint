class AccessToken < SimpleDelegator
  attr_reader :username

  def initialize(request_token)
    raise ArgumentError unless request_token.is_a?(RequestToken)

    @request_token = request_token
    @username = result['username']
    super result['access_token']
  end

  def to_person
    Person.find_or_initialize_by(access_token: to_s).tap do |person|
      person.username = username
      person.save
    end
  end

  private

  attr_reader :request_token

  def result
    @result ||= Pocket.get_result(request_token)
  end
end
