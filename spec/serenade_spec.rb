require "serenade"

describe Serenade do
  specify { expect(defined?(Serenade::VERSION)).not_to be_nil }

  describe Serenade::Renderer do
    describe "#parse" do
      it "returns a parsed Sereande template" do
        result = Serenade::Renderer.new("foo", 'h1 "Hello world"').parse[0]
        expect(result["name"]).to eq "h1"
        expect(result["children"][0]["type"]).to eq "text"
        expect(result["children"][0]["value"]).to eq "Hello world"
      end
    end
  end
end
