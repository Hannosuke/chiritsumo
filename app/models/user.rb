class User < ApplicationRecord
  def self.find_or_create_for_oauth(auth)
    find_or_create_by!(esa_id: auth.uid) do |user|
      user.esa_id = auth.uid
      user.access_token = auth.credentials.token
      user.name = auth.extra.raw_info.name
      user.screen_name = auth.extra.raw_info.screen_name
    end
  end
end
