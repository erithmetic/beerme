module BeerMe
  class MaltMeasurement
    attr_accessor :malt, :weight

    def initialize(malt, weight)
      self.malt = malt
      self.weight = weight
    end
  end
end
