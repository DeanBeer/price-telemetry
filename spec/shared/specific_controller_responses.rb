require 'shared/basic_controller_responses'

shared_examples_for :delete_destroy_failure do
  it_behaves_like :flashy_failure_redirect do
    let(:flash_message) { 'Boom!' }
  end
end


shared_examples_for :delete_destroy_success do
  it_behaves_like :unflashy_redirect
end


shared_examples_for :get_edit do
  it_behaves_like :unflashy_render do
    let(:template) { :edit }
  end
end


shared_examples_for :get_index do
  it_behaves_like :unflashy_render do
    let(:template) { :index }
  end
end


shared_examples_for :get_new do
  it_behaves_like :unflashy_render do
    let(:template) { :edit }
  end
end


shared_examples_for :get_show do
  it_behaves_like :unflashy_render do
    let(:template) { :show }
  end
end


shared_examples_for :patch_update_failure do
  it_behaves_like :flashy_failure_render do
    let(:flash_message) { 'Boom!' }
    let(:template) { :edit }
  end
end


shared_examples_for :patch_update_success do
  it_behaves_like :flashy_success_redirect do
    let(:flash_message) { 'Good Job' }
  end
end


shared_examples_for :post_create_failure do
  it_behaves_like :flashy_failure_render do
    let(:flash_message) { 'Boom!' }
    let(:template) { :edit }
  end
end


shared_examples_for :post_create_success do
  it_behaves_like :flashy_success_redirect do
    let(:flash_message) { 'Good Job' }
  end
end
