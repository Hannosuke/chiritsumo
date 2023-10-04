module ApplicationHelper
  def login_page?
    request.path.include?("login")
  end
end
