shared_examples_for :flash_messaging do
  it 'sets the right flash message' do
    expect(flash[key]).to_not be_nil
  end
end

shared_examples_for :success_messaging do
  let(:key) { :success }
  it_behaves_like :flash_messaging
end

shared_examples_for :failure_messaging do
  let(:key) { :error }
  it_behaves_like :flash_messaging
end
