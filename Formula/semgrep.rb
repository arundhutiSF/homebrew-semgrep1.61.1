class Semgrep < Formula
  desc "Static analysis for finding bugs and enforcing code standards"
  homepage "https://semgrep.dev/"
  url "https://github.com/returntocorp/semgrep/archive/v1.61.1.tar.gz"
  sha256 "d90db9579ed82f8569aa24dfdb97e96a374ab10640cf73db53ad860b9ba2c314"
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
