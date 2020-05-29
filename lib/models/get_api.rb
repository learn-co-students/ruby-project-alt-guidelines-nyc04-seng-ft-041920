# require 'net/http'
# require 'open-uri'
# require 'json'
# require 'pry'
 
class GetRequester
    # URL = "https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json"
        
        def initialize(url)
            @url = url
        end
    
        def get_response_body
            uri = URI.parse(@url)
            response = Net::HTTP.get_response(uri)
            response.body
        end
        
        def parse_json
            JSON.parse(self.get_response_body)
        end
end
    
 class GetPrograms

  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"


  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def program_school
    programs = JSON.parse(self.get_programs)
    programs.collect do |program|
      program["agency"]
    end
  end

end

class GetApi
  URL = "https://trefle.io/api/plants?q="
  TOKEN = "&token=OVJjVFpvVHNlSWZLTjNkMTFCemxJdz09"

  def get_plant(name)
    # binding.pry
    url = URL+name+TOKEN
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    response.body
    plants = JSON.parse(response.body)
    # return plants
  end


  def plant_common_name(name)
    plants = self.get_plant(name)
    plants.collect do |plant|
      plant["common_name"]
    end
  end
end


plants = GetApi.new

plants = plants.get_plant("lily")
# plants.plant_common_name
# binding.pry
# plants = plants.plant_common_name

"end"

# programs = GetPrograms.new
# puts programs.program_school.uniq

#  programs = GetPrograms.new.get_programs
#  puts programs
