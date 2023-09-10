class ReceiptGenerator
  def self.generate_receipt_from_text(text)
    # expect input_text = "2 book at 12.49\n1 music CD at 14.99\n3 chocolate bar at 0.85"
    lines = text.split("\n")

    products = []
    lines.each do |line|
      products << generate_receipt_from_line_text(line)
    end

    receipt = Receipt.new(products: products.flatten).generate_receipt
  end


  def self.generate_receipt_from_line_text(line)
    parser = ProductParser.new(line)
    parser.parse
  end
end
