require 'rspec'

RSpec.describe ProductParser do
  describe '#parse' do
    context 'when the input text is valid' do
      it 'should create and add a product to the receipt' do
        parser = ProductParser.new('2 book at 12.49')
        result = parser.parse
        expect(result).to be_a(Array)
        expect(result.length).to eq(1)
        expect(result.first).to be_a(Product)
      end
    end

    context 'when the input text is invalid' do
      it 'should raise an ArgumentError' do
        parser = ProductParser.new('invalid text')
        expect { parser.parse }.to raise_error(ArgumentError, 'Invalid format, please inform: "2 book at 12.49\n1 music CD at 14.99\n3 chocolate bar at 0.85"')
      end
    end
  end

  describe '#parse_text' do
    it 'should return an array with the quantity, name, and price of the product' do
      parser = ProductParser.new('2 book at 12.49')
      expect(parser.send(:parse_text)).to eq([2, 'book', 12.49])
    end

    it 'should return an array with nil values when the input text is invalid' do
      parser = ProductParser.new('invalid text')
      expect(parser.send(:parse_text)).to eq([nil, nil, nil])
    end
  end

  describe '#create_product' do
    it 'should create a Product object with the provided values' do
      parser = ProductParser.new('')
      product = parser.send(:create_product, 2, 'book', 12.49)
      expect(product.amount).to eq(2)
      expect(product.name).to eq('book')
      expect(product.price).to eq(12.49)
    end
  end

  describe '#add_product_to_receipt' do
    it 'should add the product to the receipt' do
      parser = ProductParser.new('')
      product = Product.new(amount: 2, name: 'book', price: 12.49)

      expect(parser.send(:add_product_to_receipt, product)).to include(product)
    end
  end
end
