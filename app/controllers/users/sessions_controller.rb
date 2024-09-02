module Users
  class SessionsController < Devise::SessionsController
    before_action :configure_sign_in_params, only: %i[create new]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    protected

    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:lang])
    end

    def after_sign_out_path_for(resource_or_scope)
      super + "?lang=#{params[:lang]}"
    end

    def after_sign_in_path_for(resource_or_scope)
      super + "?lang=#{params[:lang]}"
    end
  end
end
