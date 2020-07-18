require 'pry'
require_relative 'bank_account'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end
  
  def execute_transaction
    # if @sender.balance < @amount
    #   @status = "rejected"
    #   puts "Transaction rejected. Please check your account balance."
    # elsif @status = "complete"
    #   puts "Transaction was already executed"
    # elsif @status == "closed"
    #   puts "Transaction rejected. Please check your account balance."
    if @status == "complete"
      "Transaction has been completed."
    end 
    
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
    
    if @sender.balance < @amount
      @status = "rejected"   
      return "Transaction rejected. Please check your account balance."
    end
    
    if  @sender.status == "closed" || @receiver.status == "closed"
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance = (@sender.balance + @amount)
      @receiver.balance = (@receiver.balance - @amount)
      @status = "reversed"
    end
  end
  
 end 
