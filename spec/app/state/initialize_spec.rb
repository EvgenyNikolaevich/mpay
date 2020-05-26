# frozen_string_literal: true

module State
  describe Initialize do
    let(:subject) { described_class.new }

    # should save data to DB
    # should validate? - no
    # should change status to processing/pending if save success
    describe 'save' do
      context 'raise error' do
        it { expect { subject.init_payment }.to raise_error NotImplementedError }
      end
    end
  end
end
