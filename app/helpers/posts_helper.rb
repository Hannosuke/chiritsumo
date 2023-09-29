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

  def diary_date(full_name)
    pattern = /\/(\d{4}\/\d{2}\/\d{2})\//
    match_data = full_name.match(pattern)

    if match_data
      return match_data[1]
    else
      return "日付が取得できませんでした"
    end
  end
end
