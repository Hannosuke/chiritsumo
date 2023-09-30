module PostsHelper
  def brief_comment(daily_report_text)
    pattern = /# ひとこと(.*?)\r\n\r\n#/m

    match_data = daily_report_text.match(pattern)
    expected_data = match_data[1].lstrip

    if expected_data.empty?
      "なし"
    else
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      expected_text = expected_data.gsub("\r\n", "\r\n\r\n")

      markdown.render(expected_text)
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
