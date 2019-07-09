# app/models/food.rb

class Food
  attr_reader :ndb_number,
              :name,
              :group,
              :manufacturer

  def initialize(attributes)
    @ndb_number   = attributes[:ndbno]
    @name         = attributes[:name]
    @group        = attributes[:group]
    @manufacturer = attributes[:manu]
  end

end
