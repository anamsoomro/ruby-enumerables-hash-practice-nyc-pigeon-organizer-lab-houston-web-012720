require 'pry'

=begin
def nyc_pigeon_organizer(data)
  result = {}
  names = []
  data.each { |attribute, attribute_data|
    attribute_data.each { |category, category_data|
      category_data.each { |x|
        if !names.include? x
        names << x
        end
      }
    }
  }
  names.each do |name|
    data.each do |attribute, attribute_data|
      selected_keys = data[attribute].select do |category, category_data| 
        category_data.include? name
      end
      binding.pry
      selected_array = selected_keys.map {|category, category_data| category.to_s}
      if result[name]
        result[name][attribute] = selected_array
      else 
        result[name] = {attribute => selected_array}
      end
    end
  end
  result
end

=end


data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}


def nyc_pigeon_organizer(data)
  newhash = {}
  data.each do |key,value|
    value.each do |newkey,newvalue|
     newvalue.each do |name|
       if !newhash[name]
         newhash[name]={}
         if !newhash[name][key] 
          newhash[name][key]=[]
         end
         newhash[name][key]<< newvalue.to_s
         #binding.pry
       end
     end
    end
  end
  puts newhash
end


nyc_pigeon_organizer(data)







