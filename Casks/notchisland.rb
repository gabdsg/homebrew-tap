cask "notchisland" do
  version "1.1.0"
  sha256 "2c5b66bd6963498d62482cbb83d66277326689171ddffeb99d37ca9f5dc17708"

  url "https://github.com/gabdsg/NotchIsland/releases/download/v#{version}/NotchIsland.zip"
  name "NotchIsland"
  desc "Dynamic Island for Claude Code sessions on notch Macs"
  homepage "https://github.com/gabdsg/NotchIsland"

  depends_on :macos

  app "NotchIsland.app"

  zap trash: "~/.claude/notch-hook.sh"

  caveats <<~EOS
    NotchIsland is not code-signed with a Developer ID. If macOS blocks the
    first launch, either approve it under System Settings > Privacy & Security
    or clear the quarantine flag:
      xattr -dr com.apple.quarantine /Applications/NotchIsland.app

    On first launch the app installs its Claude Code hooks into
    ~/.claude/settings.json (idempotent; other hooks are preserved) and
    registers itself as a login item. Both can be undone from the app menu
    or by restoring ~/.claude/settings.json.
  EOS
end
