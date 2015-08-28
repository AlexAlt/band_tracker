class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:name, :presence => true)

  before_save(:capitalize_name, :capitalize_city)

private

  define_method(:capitalize_name) do
    name = self.name
    capitalize_name = name.split(" ")
    capitalize_name.each() do |name|
        name.capitalize!()
      end
    self.name = capitalize_name.join(" ")
  end

  define_method(:capitalize_city) do
    self.city = (city().capitalize!())
  end
end