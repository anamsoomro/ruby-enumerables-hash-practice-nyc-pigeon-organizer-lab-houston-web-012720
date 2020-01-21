require 'pry'

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


#MUCHH SIMPLER WAY OF DOING IT

=begin
def nyc_pigeon_organizer(data)
  new_hash = {}
  data.each do |key, value|
    value.each do |new_value, names|
      names.each do |name|
        if !new_hash[name]
          new_hash[name] = {}
        end
        if !new_hash[name][key]
          new_hash[name][key] = []
        end
        new_hash[name][key] << new_value.to_s
      end
    end
  end
  new_hash
end
=end







