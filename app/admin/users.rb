ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :name, :email, :password



actions :all, except: [:new]
index do
  column 'ID', :id
  column "名前", :name
  column "メールアドレス", :email
  column "登録日", :created_at
  column 'password(暗号化済み)', :password_digest
  #column 'tasks', self.tasks.count
  column 'タスク数', :tasks do | user|
    user.tasks.count
  end
  actions
end

end
