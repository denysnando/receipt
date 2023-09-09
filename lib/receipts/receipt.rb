class Receipt
  def initialize
    @products = []
  end

  def add_product(product)
    @products << product if product.valid?
  end

  def generate_receipt
    @products.each do |product|
      puts parse_product(product)
    end
    puts "Sales Taxes: #{format('%.2f', sales_taxes)}"
    puts "Total: #{format('%.2f', total)}"
  end

  def parse_product(product)
    "#{product.amount} #{product.name}: #{format('%.2f', (product.amount * (product.price + product.tax)))}"
  end

  def sales_taxes
    @products.sum { |product| product.amount * product.tax }.ceil(2)
  end

  def total_price
    @products.sum { |product| product.amount * product.price }
  end

  def total
    total_price + sales_taxes
  end
end
