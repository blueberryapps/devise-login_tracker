require 'spec_helper'

class TestModel
  include Devise::Models::LoginTracker

  def id
    1
  end
end

class TestModelLogin
end

describe Devise::Models::LoginTracker do

  let(:model) { TestModel.new }

  describe '#mark_login!' do

    it 'creates a new login record' do
      expect(TestModelLogin).to receive(:create)
      request = double.as_null_object
      model.mark_login!(request)
    end

    it 'uses model id' do
      expect(TestModelLogin).to receive(:create).with(hash_including(user_id: 1))
      request = double.as_null_object
      model.mark_login!(request)
    end

  end

  describe '#mark_logout!' do

    let(:record) { double update_column: nil }

    before do
      allow(TestModelLogin).to receive(:find).and_return record
    end

    it 'finds the record by given ID' do
      expect(TestModelLogin).to receive(:find).with(1)
      model.mark_logout!(1)
    end

    it 'finds the record by given ID' do
      now = double
      allow(Time).to receive(:now).and_return now
      expect(record).to receive(:update_column).with(:signed_out_at, now)
      model.mark_logout!(1)
    end

  end

end

