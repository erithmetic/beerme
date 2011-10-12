module BeerMe
  class Wort
    include Charisma
    include Leap::Subject

    characterize do
      has :malt_measurements
      has :water_weight
      has :water_volume, :units => :gallons
    end

    decide :specific_gravity, :with => :characteristics do
      committee :specific_gravity do
        quorum 'from degrees_balling', :needs => [:degrees_balling] do
          1.0 + ((characteristics[:degrees_balling] * 4.0) / 1000.0)
        end

        quorum 'from malt_measurements and water_volume', :needs => [:malt_measurements, :water_volume] do
          measurements = characteristics[:malt_measurements].inject(0) do |sum, malt|
            sum += malt.weight * malt.extract_potential
          end
          1.0 + (measurements / characteristics[:water_volume]) / 1000.0
        end
      end

      committee :degrees_balling do
        quorum 'from water_weight and extract_potential', :needs => [:water_weight, :extract_potential] do
          (characteristics[:extract_potential] / characteristics[:water_weight]) * 100.0
        end
      end

      committee :water_weight do
        quorum 'from water_volume', :needs => [:water_volume] do
          characteristics[:water_volume] * 8.345404
        end
      end

      committee :extract_potential do
        quorum 'from system efficiency', :needs => [:system] do
          characteristics[:system].efficiency
        end
      end
    end

    decide :color, :with => :characteristics do
      committee :color do
        quorum 'from malt_measurements', :needs => [:malt_measurements] do
          unless characteristics[:malt_measurements].empty?
            total_volume = characteristics[:malt_measurements].inject(0) do |sum, malt|
              sum += malt.volume
            end
            measurement = characteristics[:malt_measurements].inject(0) do |sum, malt|
              sum += malt.color * malt.volume
            end

            measurement / total_volume
          end
        end
      end
    end


    def initialize
      self.malt_measurements = []
    end
  end
end
