shared_examples_for :http_response_code do
  it 'sets the right HTTP response code' do
    expect(subject.response.code.to_i).to eq(code)
  end
end

shared_examples_for :http_failure do
  it_behaves_like :http_response_code do; let(:code) { 401 }; end
end

shared_examples_for :http_redirect do
  it_behaves_like :http_response_code do; let(:code) { 302 }; end
end

shared_examples_for :http_success do
  it_behaves_like :http_response_code do; let(:code) { 200 }; end
end
