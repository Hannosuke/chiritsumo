class PostsController < ApplicationController
  TEAM = "everyleaf"

  def index
    client = Esa::Client.new(access_token: current_user.access_token, current_team: TEAM)
    response = client.posts(q: "@me category:日報", per_page: 30, page: params[:page])

    post_extractor = PostExtractor.new

    @posts = post_extractor.run(response.body["posts"])
    @current_page = response.body["page"]
    @next_page = response.body["next_page"]
  end
end
