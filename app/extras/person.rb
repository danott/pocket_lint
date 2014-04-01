class Person
  attr_reader :access_token

  def initialize(access_token)
    @access_token = access_token
  end

  def username
    access_token.username
  end

  def lint_action
    'archive'
  end

  def to_client
    Pocket.client(access_token: access_token)
  end
end
