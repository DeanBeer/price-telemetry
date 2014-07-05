require 'shared/basic_controller/instance_variables'
require 'shared/basic_controller/redirect'
require 'shared/basic_controller/render'
require 'shared/basic_controller/flash'
require 'shared/basic_controller/http_response'

##############
## REDIRECT ##
##############

# Redirects with a success flash message
shared_examples_for :flashy_success_redirect do
  it_behaves_like :success_flash_messaging
  it_behaves_like :controller_redirect
end


# Redirects with a failure flash message
shared_examples_for :flashy_failure_redirect do
  it_behaves_like :failure_flash_messaging
  it_behaves_like :controller_redirect
end


# Redirect with flash
shared_examples_for :flashy_redirect do
  it_behaves_like :flash_messaging
  it_behaves_like :controller_redirect
end


# Redirect with no flash message
shared_examples_for :unflashy_redirect do
  it_behaves_like :unflashy_messaging
  it_behaves_like :controller_redirect
end


############
## RENDER ##
############

# Render with failure flash
shared_examples_for :flashy_failure_render do
  it_behaves_like :basic_controller_failure_render
  it_behaves_like :failure_flash_messaging
end


# Render with success flash
shared_examples_for :flashy_success_render do
  it_behaves_like :basic_controller_success_render
  it_behaves_like :success_flash_messaging
end


# Render with flash
shared_examples_for :flashy_render do
  it_behaves_like :basic_controller_success_render
  it_behaves_like :flash_messaging
end


# Render with no flash
shared_examples_for :unflashy_render do
  it_behaves_like :basic_controller_success_render
  it_behaves_like :unflashy_messaging
end


# All the things for render (with or without flash)
shared_examples_for :basic_controller_failure_render do
  it_behaves_like :basic_controller_render
  it_behaves_like :http_failure
end


shared_examples_for :basic_controller_success_render do
  it_behaves_like :basic_controller_render
  it_behaves_like :http_success
end


shared_examples_for :basic_controller_render do
  it_behaves_like :correct_instance_variables
  it_behaves_like :correct_template_render
end
