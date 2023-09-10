class Product
  IMPORTED_TAX_RATE = 0.05
  BASIC_TAX_RATE = 0.1

  attr_reader :name, :amount, :price

  def initialize(amount:, name:, price:)
    @amount = amount.to_i
    @name = name
    @price = price.to_f
  end

  def valid?
    valid_amount? && valid_name? && valid_price?
  end

  def imported?
    name.match?(/imported/i)
  end

  def tax_free?
    name.downcase.match?(/(book|books|pills|chocolate|chocolates)/)
  end

  def tax
    if tax_free?
      imported? ? imported_tax : 0
    else
      imported_tax + basic_tax
    end
  end

  private

  def valid_amount?
    amount.positive?
  end

  def valid_name?
    name.is_a?(String) && !name.empty?
  end

  def valid_price?
    price.positive?
  end

  def imported_tax
    imported? ? price * IMPORTED_TAX_RATE : 0
  end

  def basic_tax
    price * BASIC_TAX_RATE
  end
end
