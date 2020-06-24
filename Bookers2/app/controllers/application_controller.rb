class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    Refile.secret_key = '0307eb6235809294bbef69016f99e388e96ccf140962a5b52bd68d5bc824f5b42e3931ff1dce2aa9bc13263ef6b765f470f4284dfd1eac5dda7b7564f5a94978'
end
