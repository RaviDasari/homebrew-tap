class Ws < Formula
  desc "Group repos into one workspace for VS Code, Cursor, Claude Code, and Codex"
  homepage "https://github.com/RaviDasari/workspaces"
  url "https://github.com/RaviDasari/workspaces/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "ae310a5c84e80f26b658eef9b6e562e3c3167f462aa5ced06804c0e24016dd37"
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
