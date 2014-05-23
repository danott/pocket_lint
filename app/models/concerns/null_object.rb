module NullObject
  extend ActiveSupport::Concern

  included do
    Object.const_set("Null#{name}", Class.new)
  end

  module ClassMethods
    def null
      Object.const_get("Null#{name}").new
    end
  end
end
