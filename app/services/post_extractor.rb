class PostExtractor
  def run(posts)
    post_contents = posts.map do |post|
                      { date: diary_date(post["full_name"]), body: brief_comment(post["body_md"])}
                    end
  end

  def brief_comment(daily_report_text)
    pattern = /# ひとこと(.*?)\r\n\r\n#/m

    match_data = daily_report_text.match(pattern)

    return unless match_data

    expected_data = match_data[1].lstrip

    if expected_data.empty?
      "なし"
    else
      expected_text = expected_data.gsub("\r\n", "\r\n\r\n")
      expected_data
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
