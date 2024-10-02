class Semgrep < Formula
  desc "Static analysis for finding bugs and enforcing code standards"
  homepage "https://semgrep.dev/"
  url "https://github.com/returntocorp/semgrep/archive/v1.61.1.tar.gz"
  sha256 "dc57eb5c862e9bb38b159ba5825f7c02afe75b7f7dfab910a13a0ac580d3c930"
  license "LGPL-2.1-or-later"

  depends_on "ocaml" => :build
  depends_on "opam" => :build
  depends_on "python@3.9"

  def install
    system "opam", "init", "--disable-sandboxing", "--no-setup"
    system "opam", "install", "dune", "yojson", "ppx_deriving_yojson", "-y"
    system "dune", "build", "@install"
    bin.install "_build/default/bin/semgrep"
  end

  test do
    system "#{bin}/semgrep", "--version"
  end
end
