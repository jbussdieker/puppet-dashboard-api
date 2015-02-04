class NodeGroup < Base
  has_many :parameters

  def parameters
    super.tap do |params|
      params.owner = self
    end
  end

  def set_parameter(key, value)
    p "Setting #{key}=#{value}"
  end
end
