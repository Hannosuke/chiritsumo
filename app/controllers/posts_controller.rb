class PostsController < ApplicationController
  rescue_from EsaClient::UnauthorizedError, with: :handle_unauthorized_error

  def index
    @esa_client ||= EsaClient.new(current_user.access_token)
    response = @esa_client.get_posts(params[:page])

    @post_extractor ||= PostExtractor.new

    @posts = @post_extractor.run(response.body["posts"])
    @current_page = response.body["page"]
    @next_page = response.body["next_page"]
  end

  private

  def handle_unauthorized_error
    reset_session
    redirect_to login_path, notice: "アクセストークンが無効です。もう一度ログインし直してください。"
  end
end
