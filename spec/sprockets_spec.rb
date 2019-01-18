require "serenade/sprockets"

describe "Serenade sprockets integration" do
  it "registers the .serenade template engine" do
    # Sprockets 2
    # expect( Sprockets.engines[".serenade"] ).to eq Serenade::Template
    # Sprockets 3, 4
    expect( Sprockets.processors["text/x-serenade"] ).to include(an_instance_of Serenade::Processor)
    expect( Sprockets.mime_types["text/x-serenade"] ).not_to be_nil
  end

  it "allows you to require serenade in your assets" do
    env = Sprockets::Environment.new
    env.append_path Serenade::ASSET_PATH

    expect( File.exist?(env.resolve "serenade") ).to eq true
  end
end
