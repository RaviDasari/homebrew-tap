class Ws < Formula
  desc "Group repos into one workspace for VS Code, Cursor, Claude Code, and Codex"
  homepage "https://github.com/RaviDasari/workspaces"
  url "https://github.com/RaviDasari/workspaces/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "1b2f69e30da997a8a75464a75da3125a6e0eaaa41f52f6a29a36e9c7e68ea36f"
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
