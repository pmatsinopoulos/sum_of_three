require 'sum_of_three_hash'
require 'sum_of_three_sort'
require 'json'

module Pm
  module Algorithms
    module SpecHelper
      module SumOfThree
        def self.read_examples(file_name)
          file = File.read(file_name)
          JSON.parse(file)['examples']
        end

        def self.read_examples_for_find_three
          Pm::Algorithms::SpecHelper::SumOfThree.read_examples(File.join(File.expand_path("..", __FILE__), "example_data", "examples.json"))
        end
      end
    end
  end
end