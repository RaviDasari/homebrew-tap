class Ws < Formula
  desc "Group repos into one workspace for VS Code, Cursor, Claude Code, and Codex"
  homepage "https://github.com/RaviDasari/workspaces"
  url "https://github.com/RaviDasari/workspaces/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "ded7b1b0aa61cf0c377aef60341dacea7af9d85384c383c044b0a86e8a0126d0"
  license "MIT"

  def install
    bin.install "ws"
    pkgshare.install "mods"
  end

  test do
    assert_match "--wt-add", shell_output("#{bin}/ws --help")
    ENV["WS_ROOT"] = testpath/"workspaces"
    mkdir testpath/"workspaces"
    system bin/"ws", "--create", "demo"
    assert_path_exists testpath/"workspaces/demo/demo.code-workspace"
    assert_path_exists testpath/"workspaces/demo/workspace.conf"
  end
end
