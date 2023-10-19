class EsaClient
  TEAM = "everyleaf"
  PER_PAGE = 70
  SEARCH_QUERY_KEY = "@me category:日報"

  class UnauthorizedError < StandardError; end

  def initialize(access_token)
    @client = Esa::Client.new(access_token: access_token, current_team: TEAM)
  end

  def get_posts(page)
    response = @client.posts(q: SEARCH_QUERY_KEY, per_page: PER_PAGE, page: page)

    if response.status == 401
      raise UnauthorizedError
    end

    response
  end
end
