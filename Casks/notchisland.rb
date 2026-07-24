cask "notchisland" do
  # pinned per release: unique URL per version so brew caches/invalidates
  # correctly (a `latest` URL served stale cached zips). Sparkle handles in-app
  # updates; bump these two lines each release (build-app.sh prints the sha256).
  version "1.5.0"
  sha256 "d12b37a8a4253cb5f492d35e83cd587c95b0f99748c87c2fa20db8b8f9e1c2c7"

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
    On first launch NotchIsland installs its Claude Code hooks into
    ~/.claude/settings.json (idempotent; other hooks are preserved) and
    registers itself as a login item. Both can be undone from the app menu
    or by restoring ~/.claude/settings.json.
  EOS
end
