module Entities

  # Include in ActiveRecord models to mimic Biz models.
  module Mimic
    def data
      self
    end

    def entity?
      false
    end

    def ==(other)
      if other.respond_to?(:entity?) && other.entity?
        self == other.data
      else
        super
      end
    end
  end

end
