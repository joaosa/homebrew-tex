class LatexMk < Formula
  desc "System for simplifying the management of LaTeX documents"
  homepage "http://users.phys.psu.edu/~collins/software/latexmk-jcc"
  url "http://users.phys.psu.edu/~collins/software/latexmk-jcc/latexmk-445.zip"
  sha256 "0f1894c799694b34e936623eea886865e2d19d99f988d4e0e184499016c43851"

  depends_on :tex
  depends_on "ghostscript" => :optional

  def install
    bin.install "latexmk.pl"
    mv bin/"latexmk.pl", bin/"latexmk"
  end

  test do
    (testpath/"test.tex").write <<-'EOS'.undent
      \documentclass{article}
      \begin{document}
      Hello World!
      \end{document}
    EOS

    system bin/"latexmk", "test.tex"
    assert File.exist?("test.dvi")
  end
end
