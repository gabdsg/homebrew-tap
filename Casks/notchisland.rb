cask "notchisland" do
  # always tracks the latest release; the app self-verifies updates via Sparkle
  version :latest
  sha256 :no_check

  url "https://github.com/gabdsg/homebrew-tap/releases/latest/download/NotchIsland.zip"
  name "NotchIsland"
  desc "Dynamic Island for Claude Code sessions on notch Macs"
  homepage "https://github.com/gabdsg/homebrew-tap"

  # the app updates itself via Sparkle; brew upgrade also works
  auto_updates true
  depends_on :macos

  app "NotchIsland.app"

  zap trash: "~/.claude/notch-hook.sh"

  caveats <<~EOS
    On first launch NotchIsland installs its Claude Code hooks into
    ~/.claude/settings.json (idempotent; other hooks are preserved) and
    registers itself as a login item. Both can be undone from the app menu
    or by restoring ~/.claude/settings.json.
  EOS
end
