class Player
  DEFAULT_HP = 60

  attr_reader :name, :health

  def initialize(name, health=DEFAULT_HP)
    @name = name
    @health = health
  end

  def receive_damage
    @health -= Kernel.rand(60)
  end
end
