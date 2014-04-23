# U2.W5: Virus Predictor

# I worked on this challenge [by myself].

# EXPLANATION OF require_relative
# => Its including the state_data file which is in the same folder. Any variables defined in state_data will be included in this file as well
#
require_relative 'state_data'

class VirusPredictor

  # Initializing the instance variables
  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

  # instance variables are accessible from anywhere within the class - they belong to an object of the class
  # This method is calculating the predicted deaths and speed of the spread by calling other methods within this class
  # This is calling private methods which will not be accessable from outside this class, hence they are being called from virus_effects
  
  def virus_effects  #HINT: What is the SCOPE of instance variables?
    predicted_deaths
    speed_of_spread
  end

  def population
    @population
  end

  private  #what is this?  what happens if it were cut and pasted above the virus_effects method
  # If this were cut and pasted above the virus_effects method, we wouldn't be able to access that method from anywhere else except from within the class!

  def predicted_deaths
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else 
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  def speed_of_spread #in months
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else 
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state
=begin
Pseudocode:
Loop through state_data
STATE_DATA.each {|key|, |value|
  current_state = VirusPredictor.new(key,value[:population_density],value[:population],value[:region],value[:regional_spread]])
  current_state.virus_effects
  }

=end

STATE_DATA.each {|key, value|
  current_state = VirusPredictor.new(key,value[:population_density],value[:population],value[:region],value[:regional_spread])
  current_state.virus_effects
  puts current_state.population
  }



# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
# alaska.virus_effects