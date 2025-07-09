class PokeService
  include HTTParty
  base_uri 'https://pokeapi.co/api/v2'

  def initialize(name)
    @name = name.downcase
  end

  def fetch_data
    self.class.get("/pokemon/#{@name}")
  end
end
