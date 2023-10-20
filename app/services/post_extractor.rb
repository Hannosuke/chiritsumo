class PostExtractor
  def run(posts)
    post_contents = posts.map do |post|
                      {
                        number: post["number"],
                        date: diary_date(post["full_name"]),
                        body: brief_comment(post["body_md"]),
                      }
                    end
  end

  def brief_comment(daily_report_text)
    pattern = /# ひとこと(.*?)\r\n#/m

    match_data = daily_report_text.match(pattern)
    return "ひとことがありません。" unless match_data

    expected_data = match_data[1].lstrip
    return "なし" if expected_data.empty?

    expected_data
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
