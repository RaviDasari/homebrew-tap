class Ws < Formula
  desc "Group repos into one workspace for VS Code, Cursor, Claude Code, and Codex"
  homepage "https://github.com/RaviDasari/workspaces"
  url "https://github.com/RaviDasari/workspaces/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "5c76b4f53a13a39a95934c4347b2ed7067599b79c0502fc1088eae848acc355d"
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
