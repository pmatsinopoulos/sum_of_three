require 'spec_helper'

shared_examples "method that finds three integers summing up to zero" do
  it { expect(example['possible_results'].map{|a| a.sort}).to include(sum_of_three.find_three.sort)}
end

shared_examples "method that builds the integer positions" do
  it { expect(sum_of_three.send(:build_hash, example['input'])).to eq(example['result']) }
end

describe Pm::Algorithms::SumOfThreeSort do
  describe '#find_three' do
    examples = Pm::Algorithms::SpecHelper::SumOfThree.read_examples_for_find_three
    examples.each do |exmpl|
      context "from #{exmpl['input']}" do
        it_behaves_like "method that finds three integers summing up to zero" do
          let(:example) { exmpl }
          let(:sum_of_three) { Pm::Algorithms::SumOfThreeSort.new(example['input'])}
        end
      end
    end
  end
end