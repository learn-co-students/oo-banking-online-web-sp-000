class BankAccount
  attr_accessor :name, :status, :balance

  def initialize(name)
    @status = "open"
    @balance = 1000 
   @name = name.freeze
   if name != name.freeze 
     raise FrozenError.new "Frozen name cannot be changed" 
   end
 end 
end 