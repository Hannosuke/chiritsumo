module PostsHelper
  def brief_comment(daily_report_text)
    pattern = /# ひとこと(.*?)\r\n\r\n#/m

    match_data = daily_report_text.match(pattern)

    if match_data[1].lstrip.empty?
      return "なし"
    else
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

      return markdown.render(match_data[1].lstrip)
    end
  end
end
