cask "notchisland" do
  version "1.2.0"
  sha256 "b62c29d0aaf1710d5061ba20a5bf3109662459c014ad56b4fd25f74067e28d34"

  url "https://github.com/gabdsg/homebrew-tap/releases/download/v#{version}/NotchIsland.zip"
  name "NotchIsland"
  desc "Dynamic Island for Claude Code sessions on notch Macs"
  homepage "https://github.com/gabdsg/homebrew-tap"

  # the app updates itself via Sparkle; brew upgrade also works
  auto_updates true
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
