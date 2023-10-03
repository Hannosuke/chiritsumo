class PostsController < ApplicationController
  TEAM = "everyleaf"

  def index
    client = Esa::Client.new(access_token: current_user.access_token, current_team: TEAM)
    response = client.posts(q: "@me category:日報", per_page: 30, page: params[:page])

    @current_page = response.body["page"]
    @next_page = response.body["next_page"]
    @posts = response.body["posts"]
  end
end
