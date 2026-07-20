cask "notchisland" do
  version "1.0.0"
  sha256 "5b3ae6eb06d113acce95a3a3a55a434cf2d950d9339801a8145ac572bd0c40cd"

  url "https://github.com/gabdsg/NotchIsland/releases/download/v#{version}/NotchIsland.zip"
  name "NotchIsland"
  desc "Dynamic Island for Claude Code sessions on notch Macs"
  homepage "https://github.com/gabdsg/NotchIsland"

  depends_on :macos

  app "NotchIsland.app"

  zap trash: "~/.claude/notch-hook.sh"

  caveats <<~EOS
    NotchIsland is not code-signed with a Developer ID. Install with:
      brew install --cask --no-quarantine gabdsg/tap/notchisland
    or approve it under System Settings > Privacy & Security after first launch.

    On first launch the app installs its Claude Code hooks into
    ~/.claude/settings.json (idempotent; other hooks are preserved) and
    registers itself as a login item. Both can be undone from the app menu
    or by restoring ~/.claude/settings.json.
  EOS
end
