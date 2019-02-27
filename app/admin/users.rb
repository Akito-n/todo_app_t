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

permit_params :name, :email, :password, :password_digest, :role


form do |f|
  f.inputs "User" do
  f.input :name
  f.input :email
  f.input :password
  f.input :role
  end
  f.actions
end


actions :all,
index do
  column 'ID', :id
  column "名前", :name
  column "メールアドレス", :email
  column "登録日", :created_at
  #column 'tasks', self.tasks.count
  #column 'password(暗号化済み)', :password_digest
  column '役割', :role
  column 'タスク数', :tasks do | user|
    user.tasks.count
  end
  actions
end

end
