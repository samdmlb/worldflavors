class UserBadgesController < ApplicationController

  def toggle_select
    @user_badge = Userbadge.find(params[:id])
    @user_badge.selected ? @user_badge.selected = false :  @user_badge.selected = true
  end

end
