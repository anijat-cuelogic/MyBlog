# config/initializers/rails_admin_delete_override.rb
module RailsAdmin
  module Config
    module Actions
      class Delete < RailsAdmin::Config::Actions::Base

        RailsAdmin::Config::Actions.register(self)

        register_instance_option :member do
          true
        end

        register_instance_option :route_fragment do
          'delete'
        end

        register_instance_option :http_methods do
          [:get, :delete]
        end

        register_instance_option :authorization_key do
          :destroy
        end

        register_instance_option :controller do
          Proc.new do
            if request.get? # DELETE

              respond_to do |format|
                format.html { render @action.template_name }
                format.js   { render @action.template_name, :layout => false }
              end

            elsif request.delete? # DESTROY

              redirect_path = nil
              @auditing_adapter && @auditing_adapter.delete_object(@object, @abstract_model, _current_user)
              if @object.class.base_class.name == 'User'
                if @object.role? :admin
                  flash[:error] = "Cannot destroy a user with admin role"
                  redirect_path = back_or_index
                else
                  @object.destroy
                  flash[:success] = t("admin.flash.successful", :name => @model_config.label, :action => t("admin.actions.delete.done"))
                  redirect_path = index_path
                end
              elsif @object.class.base_class.name == 'Role'
                if @object.name == "admin"
                  flash[:error] = "Cannot destroy your own role"
                  redirect_path = back_or_index
                else
                  @object.destroy
                  flash[:success] = t("admin.flash.successful", :name => @model_config.label, :action => t("admin.actions.delete.done"))
                  redirect_path = index_path
                end
              else
                if @object.destroy
                  flash[:success] = t("admin.flash.successful", :name => @model_config.label, :action => t("admin.actions.delete.done"))
                  redirect_path = index_path
                else
                  flash[:error] = t("admin.flash.error", :name => @model_config.label, :action => t("admin.actions.delete.done"))
                  redirect_path = back_or_index
                end
              end

              redirect_to redirect_path

            end
          end
        end

      end
    end
  end
end