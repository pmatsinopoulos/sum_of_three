require 'spec_helper'

shared_examples "method that finds three integers summing up to zero" do
  it { expect(example['possible_results'].map{|a| a.sort}).to include(sum_of_three.find_three.sort)}
end

shared_examples "method that builds the integer positions" do
  it { expect(sum_of_three.send(:build_hash, example['input'])).to eq(example['result']) }
end

describe Pm::Algorithms::SumOfThreeHash do
  describe '#find_three' do
    examples = Pm::Algorithms::SpecHelper::SumOfThree.read_examples_for_find_three
    examples.each do |exmpl|
      context "from #{exmpl['input']}" do
        it_behaves_like "method that finds three integers summing up to zero" do
          let(:example) { exmpl }
          let(:sum_of_three) { Pm::Algorithms::SumOfThreeHash.new(example['input'])}
        end
      end
    end
  end

  describe '#build_hash' do
    examples = [
        {'input' => [],                            'result' => {                                                                                   }},
        {'input' => [1],                           'result' => {1   => [0]                                                                         }},
        {'input' => [1, 2],                        'result' => {1   => [0],      2 => [1]                                                          }},
        {'input' => [1, 2, 3],                     'result' => {1   => [0],      2 => [1],    3 => [2]                                             }},
        {'input' => [3, -2, 1, -1, 0, -2],         'result' => {3   => [0],     -2 => [1, 5], 1 => [2], -1 => [3],   0 => [4]                      }},
        {'input' => [0, 0, 0],                     'result' => {0   => [0, 1, 2]                                                                   }},
        {'input' => [1, 6, 1, 8, -2, -20, 133, 2], 'result' => {1   => [0, 2],   6 => [1],    8 => [3], -2 => [4], -20 => [5], 133 => [6], 2 => [7]}},
        {'input' => [-10, 32, -100, 70, -60, -4],  'result' => {-10 => [0],     32 => [1], -100 => [2], 70 => [3], -60 => [4],  -4 => [5]          }}
    ]
    examples.each do |exmpl|
      context "from #{exmpl['input']}" do
        it_behaves_like "method that builds the integer positions" do
          let(:example) { exmpl }
          let(:sum_of_three) { Pm::Algorithms::SumOfThreeHash.new(example['input'])}
        end
      end
    end
  end
end