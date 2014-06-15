require 'shared/rails_helper'

describe PermittedParams do

  let(:action_params) { ActionController::Parameters.new params }
  let(:permitted_params) { described_class.new action_params }
  let(:subject) { permitted_params.send method }


  # Need to pass in good and bad parameters here
  # Rework lets
  shared_examples_for :require do
    it 'does not fail when given the correct required params' do
      expect { subject }.not_to raise_exception(ActionController::ParameterMissing)
    end

    it 'fails when the required params is missing' do
      expect { subject }.to raise_exception(ActionController::ParameterMissing)
    end
  end


  context 'packaging' do

    let(:method) { :packaging }
    let(:params) { { packaging: { llama: :blark } } }

  end

end
