describe "BankAccount" do

  let(:avi) { BankAccount.new("Avi") }

  it "can initialize a Bank Account" do
    expect(avi).to be_a(BankAccount)
  end

  it "initializes with a name" do
    expect(avi.name).to eq("Avi")
  end

  it "always initializes with balance of 1000" do
    expect(avi.balance).to eq(1000)
  end

  it "always initializes with a status of 'open'" do
    expect(avi.status).to eq("open")
  end

  it "can't change its name" do
    expect { avi.name = "Bob" }.to raise_error
  end

  it "can deposit money into its account" do
    expect(avi.balance).to eq(1000)
    avi.deposit(1000)
    expect(avi.balance).to eq(2000)
  end

  it "can display its balance" do
    expect(avi.display_balance).to eq("Your Balance is $#{avi.balance}.")
  end

  it "is valid with an open status and a balance greater than 0" do
    @broke = BankAccount.new("Kat Dennings")
    @broke.balance = 0
    @closed = BankAccount.new("Beth Behrs")
    @closed.status = "closed"
    expect(avi.valid?).to eq(true)
    expect(@broke.valid?).to eq(false)
    expect(@closed.valid?).to eq(false)
  end

  it "can close its account" do
    avi.close_account
    expect(avi.status).to eq("closed")
  end
end
