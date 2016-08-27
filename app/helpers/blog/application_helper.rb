module Blog
  module ApplicationHelper
    def render_text(text)
      header = ":source-highlighter: coderay\n\n"
      Asciidoctor.convert(header + text, safe: 'safe').html_safe
    end

    def render_timestamp(timestamp)
      timestamp.strftime("%b %d, %Y")
    end
  end
end
