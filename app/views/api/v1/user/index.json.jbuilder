json.(current_user, :id, :email, :current_sign_in_at)
profiles = current_user.profiles
json.profiles profiles, :provider, :display_name, :quota, :used
