class UserBadgesController < ApplicationController
  def toggle_select
    @user_badge = Userbadge.find(params[:id])
    @user_badge.selected ? @user_badge.selected = false :  @user_badge.selected = true
  end

  def update
    badge = Badge.find(params[:id])
    slot_number = params[:slotNumber].to_i

    UserBadge.where(user: current_user, slot: slot_number).update(slot: 0)

    user_badge = UserBadge.find_by(user: current_user, badge:)
    user_badge.update(slot: slot_number)
  end
end
