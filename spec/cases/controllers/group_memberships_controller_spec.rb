require 'shared/rails_helper'
require 'shared/specific_controller_responses'

RSpec.describe GroupMembershipsController, type: :controller do

  let(:group_membership) { mock_model GroupMembership }

  describe 'GET show' do

    before do
      allow(GroupMembership).to receive(:find).and_return(group_membership)
      get :show, id: group_membership.id
    end

    it_behaves_like :get_show do
      let(:ivars) { [ { name: :group_membership,
                        value: group_membership
                  } ] }
    end

  end

end
