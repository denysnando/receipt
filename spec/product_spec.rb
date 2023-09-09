require 'spec_helper'

RSpec.describe Product do
  describe '#valid?' do
    it 'returns true for a valid product' do
      product = Product.new(amount: 1, name: 'Sample Product', price: 10.0)
      expect(product.valid?).to be true
    end

    it 'returns false for a product with invalid amount' do
      product = Product.new(amount: -1, name: 'Sample Product', price: 10.0)
      expect(product.valid?).to be false
    end

    it 'returns false for a product with an empty name' do
      product = Product.new(amount: 1, name: '', price: 10.0)
      expect(product.valid?).to be false
    end

    it 'returns false for a product with a non-positive price' do
      product = Product.new(amount: 1, name: 'Sample Product', price: -5.0)
      expect(product.valid?).to be false
    end
  end

  describe '#imported?' do
    it 'returns true for an imported product' do
      product = Product.new(amount: 1, name: 'Imported Sample Product', price: 10.0)
      expect(product.imported?).to be true
    end

    it 'returns false for a non-imported product' do
      product = Product.new(amount: 1, name: 'Sample Product', price: 10.0)
      expect(product.imported?).to be false
    end
  end

  describe '#tax_free?' do
    it 'returns true for a tax-free product' do
      product = Product.new(amount: 1, name: 'Book', price: 10.0)
      expect(product.tax_free?).to be true
    end

    it 'returns false for a non-tax-free product' do
      product = Product.new(amount: 1, name: 'Sample Product', price: 10.0)
      expect(product.tax_free?).to be false
    end
  end

  describe '#tax' do
    it 'calculates the correct tax for a tax-free, non-imported product' do
      product = Product.new(amount: 1, name: 'Book', price: 10.0)
      expect(product.tax).to eq(0.0)
    end

    it 'calculates the correct tax for an imported product' do
      product = Product.new(amount: 1, name: 'Imported Sample Product', price: 10.0)
      # Assuming IMPORTED_TAX_RATE is 0.05, BASIC_TAX_RATE is 0.1
      # Total tax should be 10.0 * 0.05 + 10.0 * 0.1 = 1.0 + 0.5 = 1.5
      expect(product.tax).to eq(1.5)
    end

    it 'calculates the correct tax for a non-tax-free, non-imported product' do
      product = Product.new(amount: 1, name: 'Sample Product', price: 10.0)
      # Assuming IMPORTED_TAX_RATE is 0.05, BASIC_TAX_RATE is 0.1
      # Total tax should be 10.0 * 0.1 = 1.0
      expect(product.tax).to eq(1.0)
    end
  end
end
