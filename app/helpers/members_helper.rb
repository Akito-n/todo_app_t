module MembersHelper
  def be_in_group?
    @group.members.exists?(user_id: current_user.id)
  end
end
