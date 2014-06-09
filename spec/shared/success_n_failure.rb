require 'shared/behaves_like_edit'
require 'shared/flashes'
require 'shared/http_responses'

shared_examples_for :failed_edit do
  it_behaves_like :http_failure
  it_behaves_like :failure_messaging
  it_behaves_like :edit
end


shared_examples_for :successful_edit do
  it_behaves_like :http_redirect 
  it_behaves_like :success_messaging
end
