shared_examples_for :response_code do
  it 'sets the right HTTP response code' do
    expect(subject.response.code.to_i).to eq(code)
  end
end

shared_examples_for :http_failure do
  let(:code) { 401 }
  it_behaves_like :response_code
end

shared_examples_for :http_redirect do
  let(:code) { 302 }
  it_behaves_like :response_code
  it :redirects do
    expect(subject).to redirect_to(url)
  end

end

shared_examples_for :http_success do
  let(:code) { 200 }
  it_behaves_like :response_code
end
