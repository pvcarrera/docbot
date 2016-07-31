require 'spec_helper'
require 'doc/ruby'

RSpec.describe Doc::Ruby  do
  subject(:doc) { described_class.for(query) }

  let(:query) { 'Array#last' }

  describe '#to_markdown' do
    it 'returns a string with the documentation in markdown format' do
      returned_string = doc.to_markdown

      expect(returned_string).to include('# Array#last')
      expect(returned_string).to include('ary.last     ->  obj or nil')
      expect(returned_string).to include('ary.last(n)  ->  new_ary')
    end

    context 'when documentation is not found' do
      let(:query) { 'Ramdom query' }

      it 'returns an error message' do
        returned_string = doc.to_markdown

        expect(returned_string).to eq('Nothing known about Ramdom query')
      end
    end
  end
end
