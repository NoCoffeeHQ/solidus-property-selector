# frozen_string_literal: true

json.property_values(@property_values) do |property_value|
  json.(property_value, *%i[id name presentation])
end
