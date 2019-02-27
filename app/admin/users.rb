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


actions :all
index do
    column 'ID', :id
    column I18n.t('activerecord.attributes.user.name'), :name
    column I18n.t('activerecord.attributes.user.email'), :email
    column I18n.t('activerecord.attributes.user.created_at'), :created_at
    role_column I18n.t('activerecord.attributes.user.role'), :role
    column 'タスク数', :tasks do | user|
      user.tasks.count
    end
    actions

end

module ActiveAdmin
  module Views
    class TableFor

      def role_column(title, attribute)
        column(attribute){ |model| User.roles_i18n[model[attribute]] }
      end
    end
  end
end

end
