class ProductParser
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def parse
    quantity, name, price = parse_text

    if quantity && name && price
      product = create_product(quantity, name, price)
      add_product_to_receipt(product)
    else
      raise ArgumentError, 'Invalid format, please inform: "2 book at 12.49\n1 music CD at 14.99\n3 chocolate bar at 0.85"'
    end
  end

  private

  def parse_text
    match = text.match(/(\d+)\s(.+)\sat\s(\d+\.\d+)/)
    if match
      [match[1].to_i, match[2], match[3].to_f]
    else
      [nil, nil, nil]
    end
  end

  def create_product(quantity, name, price)
    Product.new(amount: quantity, name: name, price: price)
  end

  def add_product_to_receipt(product)
    Receipt.new(product: product).add_product
  end
end
