require "serenade/sprockets"

describe "Serenade sprockets integration" do
  it "registers the .serenade template engine" do
    expect(Sprockets.preprocessors["application/javascript+serenade"]).to include(Serenade::Template)
  end

  it "allows you to require serenade in your assets" do
    env = Sprockets::Environment.new
    env.append_path Serenade::ASSET_PATH

    path = env.resolve("serenade").first

    expect(File.exists?(path.gsub("file://", "").split("?")[0])).to be_truthy
  end
end
