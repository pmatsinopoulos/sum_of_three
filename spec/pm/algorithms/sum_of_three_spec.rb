require 'spec_helper'

describe Pm::Algorithms::SumOfThree do
  describe '#find_three' do
    subject { Pm::Algorithms::SumOfThree.new([]) }
    it { expect { subject.find_three }.to raise_error(NotImplementedError) }
  end
end