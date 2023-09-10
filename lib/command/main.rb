module Command
  class Main < Base
    private

    def title
      'Select an option:'
    end

    def options
      {
        '1': { label: 'Generate receipt with new products in the basket', method: :add_to_basket },
        '2': { label: 'Generate a random receipt', method: :random_receipt }
      }
    end

    def add_to_basket
      input_text = run_command("Add products to the basket, format: amount, description and price " \
                               '(2 book at 12.49, 1 music CD at 14.99, 1 chocolate bar at 0.85)')

      parse = input_text.split(', ').join("\n")
      ReceiptGenerator.generate_receipt_from_text(parse)
    end

    def random_receipt
      input_text1 = "2 book at 12.49/n1 music CD at 14.99\n1 chocolate bar at 0.85"
      input_text2 = "1 imported box of chocolates at 10.00\n1 imported bottle of perfume at 47.50"
      input_text3 = "1 imported bottle of perfume at 27.99\n1 bottle of perfume at 18.99\n1 packet of headache pills at 9.75\n3 imported boxes of chocolates at 11.25"

      input_texts = [input_text1, input_text2, input_text3]
      ReceiptGenerator.generate_receipt_from_text(input_texts.sample)
    end
  end
end
