shared_examples_for :controller_redirect do
  it_behaves_like :http_redirect
  it :redirects do
    expect(subject).to redirect_to(redirect_url)
  end
end
