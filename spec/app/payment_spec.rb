# frozen_string_literal: true

describe Payment do
  let(:payment) { described_class.new }
  let(:input)   {}

  subject { payment.create(input) }

  describe '.create' do
    before do
      allow(Validator).to      receive_message_chain(:new, :call).and_return(nil)
      allow(Transaction).to    receive(:save_payment).and_return(nil)
      allow_any_instance_of(PreparePayment).to receive(:call).and_return(nil)
    end

    it { is_expected.to be_an_instance_of Payment }
  end
end
