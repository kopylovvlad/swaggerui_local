require 'swaggerui_local/version'

module SwaggeruiLocal
  class << self
    def render_html(path_to_json = '')
      template_path = File.join(
        File.dirname(__FILE__),
        'swaggerui_local/html.html'
      )
      File
        .open(template_path, 'r')
        .read
        .gsub('<%json_url_here%>', path_to_json)
    end
  end
end
