require 'spec_helper'

RSpec.describe Receipt do
  let(:receipt) { Receipt.new }

  describe '#add_product' do
    it 'adds a valid product to the receipt' do
      product = double('Product', valid?: true)
      expect { receipt.add_product(product) }.to change { receipt.instance_variable_get(:@products).count }.by(1)
    end

    it 'does not add an invalid product to the receipt' do
      product = double('Product', valid?: false)
      expect { receipt.add_product(product) }.not_to change { receipt.instance_variable_get(:@products).count }
    end
  end

  describe '#generate_receipt' do
    it 'prints the receipt details including sales taxes and total' do
      product1 = double('Product', valid?: true, amount: 2, name: 'book', price: 12.49, tax: 0.0)
      product2 = double('Product', valid?: true, amount: 1, name: 'music CD', price: 14.99, tax: 1.5)
      product3 = double('Product', valid?: true, amount: 1, name: 'chocolate bar', price: 0.85, tax: 0.0)

      receipt.instance_variable_set(:@products, [product1, product2, product3])

      expected_output = <<~OUTPUT
        2 book: 24.98
        1 music CD: 16.49
        1 chocolate bar: 0.85
        Sales Taxes: 1.50
        Total: 42.32
      OUTPUT

      expect { receipt.generate_receipt }.to output(expected_output).to_stdout
    end
  end

  describe '#parse_product' do
    it 'returns a formatted string for a product' do
      product = double('Product', amount: 2, name: 'Item', price: 10.00, tax: 0.0)
      expect(receipt.parse_product(product)).to eq('2 Item: 20.00')
    end
  end

  describe '#sales_taxes' do
    it 'calculates the correct sales taxes for the products' do
      product1 = double('Product', valid?: true, amount: 2, tax: 0.50)
      product2 = double('Product', valid?: true, amount: 1, tax: 0.25)
      receipt.instance_variable_set(:@products, [product1, product2])

      expect(receipt.sales_taxes).to eq(1.25)
    end
  end

  describe '#total_price' do
    it 'calculates the total price for the products' do
      product1 = double('Product', valid?: true, amount: 2, price: 10.00)
      product2 = double('Product', valid?: true, amount: 1, price: 5.00)
      receipt.instance_variable_set(:@products, [product1, product2])

      expect(receipt.total_price).to eq(25.00)
    end
  end

  describe '#total' do
    it 'calculates the correct total amount including sales taxes' do
      product1 = double('Product', valid?: true, amount: 2, price: 10.00, tax: 0.50)
      product2 = double('Product', valid?: true, amount: 1, price: 5.00, tax: 0.25)
      receipt.instance_variable_set(:@products, [product1, product2])

      expect(receipt.total).to eq(26.25)
    end
  end
end
