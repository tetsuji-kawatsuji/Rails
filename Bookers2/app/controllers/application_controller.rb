class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        users_path
    end

    protected
    def configure_permitted_parameters
        added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    Refile.secret_key = '0307eb6235809294bbef69016f99e388e96ccf140962a5b52bd68d5bc824f5b42e3931ff1dce2aa9bc13263ef6b765f470f4284dfd1eac5dda7b7564f5a94978'
end
