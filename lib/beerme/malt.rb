require 'charisma'

module BeerMe
  class Malt
    characterize do
      has :name
      has :percent_moisture
      has :coarse_grind_extract
      has :fine_grind_extract
      has :diastatic_power, :unit => :diastatic_power
      has :diastatic_power_degrees_wk, :unit => :degrees_wk
      has :beta_glucan
      has :viscosity
      has :color  # degrees Lovibond
      has :clarity
      has :growth_of_acrospire
      has :sieve_assortment
      has :nitrogen_content
      has :soluable_protein_content
      has :extract_potential  # degrees Balling
    end

    committee :total_protein_content do # percentage, 9-11% is good
      quorum 'from nitrogen_content', :needs => [:nitrogen_content] do
        characteristics[:nitrogen_content] * (100 / 16)
      end
    end
    committee :diastatic_power do
      quorum 'from diastatic_power_degrees_wk', :needs => [:diastatic_power_degrees_wk] do
        (characteristics[:diastatic_power_degrees_wk] + 16) / 3.5
      end
    end
  end
end
