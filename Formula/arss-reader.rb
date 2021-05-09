require "language/node"

class ArssReader < Formula
  desc "Simple rss reader"
  homepage "https://github.com/1ntEgr8/arss"
  url "https://github.com/1ntEgr8/arss/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "4bf113abc4df69e4c29418a5659b1e57d3e04b7b16dc944b2fa5ef54647f44fc"
  license "MIT"

  depends_on "go" => :build
  depends_on "node" => :build

  def install
    Language::Node.setup_npm_environment
    system "./install.sh", "--only-client"
    bin.install "arss"
  end

  test do
    assert_equal "#{Dir.home}/.arss", shell_output("#{bin}/arss --config-path")
  end
end
