RSpec.describe SwaggeruiLocal do
  it 'has a version number' do
    expect(SwaggeruiLocal::VERSION).not_to be nil
  end

  describe '.render_html' do
    it 'should render html with \'\'' do
      html = SwaggeruiLocal.render_html

      expect(html).to be_instance_of(String)
      expect(html.size).to be > 0
      expect(html.include?('url: "",')).to eq(true)
    end

    it 'should render html with json path' do
      html = SwaggeruiLocal.render_html('localhost/path_to_json')

      expect(html).to be_instance_of(String)
      expect(html.size).to be > 0
      expect(html.include?('url: "localhost/path_to_json",')).to eq(true)
    end
  end
end
