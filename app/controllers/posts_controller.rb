class PostsController < ApplicationController
  TEAM = "everyleaf"

  def index
    client = Esa::Client.new(access_token: current_user.access_token, current_team: TEAM)

    response = client.posts(q: "@me category:日報")
    @posts = response.body["posts"]
  end
end
