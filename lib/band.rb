class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues)
  validates(:name, {:presence => true})
  validates(:city, {:presence => true})
  validates(:state, {:presence => true})

  before_save(:capitalize_name, :capitalize_city, :capitalize_state)

  private

  define_method(:capitalize_name) do
    name = self.name
    capitalize_name = name.split(" ")
    capitalize_name.each() do |word|
      word.capitalize!()
    end
    self.name = capitalize_name.join(" ")
  end

  define_method(:capitalize_city) do
    self.city = self.city.capitalize()
  end

  define_method(:capitalize_state) do
    state = self.state
    capitalize_state = state.split("")
    capitalize_state.each() do |letter|
        letter.capitalize!()
      end
    self.state = capitalize_state.join("")
  end
end