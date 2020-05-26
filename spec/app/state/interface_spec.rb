# frozen_string_literal: true

module State
  describe Interface do
    let(:subject) { described_class.new }

    describe 'methods' do
      context 'raise error' do
        it { expect { subject.init_payment }.to raise_error NotImplementedError }
      end
    end
  end
end
