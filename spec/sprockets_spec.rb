require "serenade/sprockets"

describe "Serenade sprockets integration" do
  it "registers the .serenade template engine" do
    expect( Sprockets.engines[".serenade"] ).to eq Serenade::Template
  end

  it "allows you to require serenade in your assets" do
    env = Sprockets::Environment.new
    env.append_path Serenade::ASSET_PATH

    expect( File.exist?(env.resolve "serenade") ).to eq true
  end
end
