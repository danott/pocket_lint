module NullObject
  extend ActiveSupport::Concern

  included do
    const_set("Null#{name}", Class.new)
  end

  module ClassMethods
    def null
      const_get("Null#{name}").new
    end
  end
end
