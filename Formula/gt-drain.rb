class GtDrain < Formula
  desc "Merge a Graphite stack bottom-up, one PR at a time"
  homepage "https://github.com/john-farina/gt-tools"
  version "1.0.0"

  url "https://github.com/john-farina/gt-tools/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "325b2733d8316f5c1760a8d6ba0c65bc14a06e9b7c3bbee468f4e854fb7aabe8"

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
