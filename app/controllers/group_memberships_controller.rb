class GroupMembershipsController < ApplicationController

  def show
    @group_membership = GroupMembership.find params[:id]
  end

end
