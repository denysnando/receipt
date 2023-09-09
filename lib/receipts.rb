require 'pry'

Dir[File.join('./lib/**/*.rb')].sort.each { |f| require f }

module Receipts
end
