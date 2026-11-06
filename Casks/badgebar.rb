cask "badgebar" do
  version "1.0.4"
  sha256 "7a35d5d0febb641b62f7f9c04a9be914cec2541021425c99e24d3e07ba379597"

  url "https://github.com/ahmetrende/BadgeBar/releases/download/v#{version}/BadgeBar.dmg"
  name "BadgeBar"
  desc "Mirror app unread badges into the menu bar"
  homepage "https://github.com/ahmetrende/BadgeBar"

  depends_on macos: :sonoma

  app "BadgeBar.app"

  uninstall quit: "com.ahmetrende.badgebar"

  zap trash: "~/Library/Preferences/com.ahmetrende.badgebar.plist"

  caveats <<~EOS
    BadgeBar is not notarized yet, so on first launch macOS will block it.
    To open it the first time:
      • Right-click BadgeBar in Applications -> Open -> Open, or
      • System Settings -> Privacy & Security -> "Open Anyway".

    Then grant Accessibility permission (required to read Dock badges):
      System Settings -> Privacy & Security -> Accessibility -> enable BadgeBar.
  EOS
end
