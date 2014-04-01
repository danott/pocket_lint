class Person < ActiveRecord::Base
  def lint_action
    'archive'
  end

  def to_client
    Pocket.client(access_token: access_token)
  end
end
