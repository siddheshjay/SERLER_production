#

# see https://github.com/plataformatec/devise/wiki/How-To:-Stub-authentication-in-controller-specs

module ControllerHelpers
  def sign_in(user_email, role = :user)
    if user_email.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
      allow(controller).to receive(:current_user).and_return(nil)

    else

      @fake_user = User.new({
        email: user_email, password: "123456", password_confirmation: "123456",
        reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1,
        current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10",
        current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", roles_mask: 0,
        first_name: "Fistname", middle_name: "no-middle-name", last_name: "Lastname", 
      });
      @fake_user.roles= [role]
      @fake_user.save!

      allow(request.env['warden']).to receive(:authenticate!).and_return(@fake_user)
      allow(controller).to receive(:current_user).and_return(@fake_user)
    end
  end
end

