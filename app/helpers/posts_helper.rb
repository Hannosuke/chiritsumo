require "rouge/plugins/redcarpet"

class CustomRenderHTML < Redcarpet::Render::HTML
  include Rouge::Plugins::Redcarpet
end

module PostsHelper
  def brief_comment(daily_report_text)
    pattern = /# ひとこと(.*?)\r\n\r\n#/m

    match_data = daily_report_text.match(pattern)
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

  def markdown(text)
    options = {
      no_styles:     true,
      with_toc_data: true,
      hard_wrap:     true,
    }
    extensions = {
      no_intra_emphasis:   true,
      tables:              true,
      fenced_code_blocks:  true,
      autolink:            true,
      lax_spacing:         true,
      space_after_headers: true,
    }

    renderer = CustomRenderHTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end
end
