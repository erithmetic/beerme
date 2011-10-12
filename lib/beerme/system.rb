module BeerMe
  class System
    characterize do
      has :efficiency
      has :brew
    end

    committee :efficiency do
      quorum 'from brew', :needs [:brew] do
        characteristics[:brew].actual_original_gravity /
          (characteristics[:brew].original_gravity * 100)
      end
    end
  end
end
