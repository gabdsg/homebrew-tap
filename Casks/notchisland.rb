cask "notchisland" do
  version "1.2.1"
  sha256 "46223b46a16e599e59f4600a65808d484722eacd973325881a7d1c810a34a16a"

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
