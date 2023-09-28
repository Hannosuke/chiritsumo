module PostsHelper
  def brief_comment(daily_report_text)
    pattern = /# ひとこと\r\n(.*?)\r\n\r\n#/m

    match_data = daily_report_text.match(pattern)

    if match_data[1].empty?
      return "なし"
    else
      return match_data[1]
    end
  end
end
