class GtDrain < Formula
  desc "Merge a Graphite stack bottom-up, one PR at a time"
  homepage "https://github.com/john-farina/gt-tools"
  version "1.1.0"

  url "https://github.com/john-farina/gt-tools/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "7a9b6b7c367e1797765e964398bdb62a9c7b72f58b890cdb615969f4a430bb89"

  license "MIT"

  depends_on "bash"
  depends_on "gh"

  def install
    bin.install "gt-drain"
    bin.install "gt-rescue"

    # Rewrite hardcoded shebang to portable form (works on Intel + Apple Silicon)
    inreplace bin/"gt-drain", "#!/opt/homebrew/bin/bash", "#!/usr/bin/env bash"
    inreplace bin/"gt-rescue", "#!/opt/homebrew/bin/bash", "#!/usr/bin/env bash"
  end

  test do
    assert_match "gt-drain: Merge a Graphite stack", shell_output("#{bin}/gt-drain --help")
  end
end
