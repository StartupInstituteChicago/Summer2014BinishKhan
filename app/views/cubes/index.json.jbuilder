json.array!(@cubes) do |cube|
  json.extract! cube, :id
  json.url cube_url(cube, format: :json)
end
