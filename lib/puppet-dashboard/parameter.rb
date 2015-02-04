class Parameter < Base
  attr_accessor :owner

  def [](key)
    @attributes[key]
  end

  def []=(key, value)
    owner.set_parameter(key, value)
  end
end
