require 'spec_helper'
require 'docbot'

RSpec.describe Docbot do
  subject { described_class.instance }

  it_should_behave_like 'a slack ruby bot'

  %w(hi Hi Hello hello Hey HEY).each do |greeting|
    it "responds to #{greeting}" do
      expect(message: greeting).to respond_with_slack_message 'Hello <@user>'
    end
  end

  context 'when user sends a ri command' do
    let(:message) { 'ri Array#first' }
    let(:doc_string) { 'Result form ruby docs' }
    let(:ruby_doc) { instance_double(Doc::Ruby, to_markdown: doc_string) }

    before do
      allow(Doc::Ruby).to receive(:for).with('Array#first').and_return(ruby_doc)
    end

    it 'replies with the corresponding Ruby documentation' do
      expect(message: message).to respond_with_slack_message(doc_string)
    end
  end
end
