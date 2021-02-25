require 'pry'
require_relative './transfer.rb'

class BankAccount

    attr_accessor :balance, :status, :amount
    attr_reader :name

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        #balance above 0
        #status is open


        balance > 0 && status == "open"
    end

    def close_account
        @status = "closed"
    end


end
