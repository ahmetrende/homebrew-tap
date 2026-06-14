cask "badgebar" do
  version "1.0.1"
  sha256 "de2fc25d78313c1b38b209f0344dc19ce0d2b4ff1179dbc84aa733bdacdd261b"

  url "https://github.com/ahmetrende/BadgeBar/releases/download/v#{version}/BadgeBar.dmg"
  name "BadgeBar"
  desc "Mirror app unread badges into the macOS menu bar"
  homepage "https://github.com/ahmetrende/BadgeBar"

  depends_on macos: ">= :sonoma"

  app "BadgeBar.app"

  zap trash: [
    "~/Library/Preferences/com.ahmetrende.badgebar.plist",
  ]

  caveats <<~EOS
    BadgeBar is not notarized yet, so on first launch macOS will block it.
    To open it the first time:
      • Right-click BadgeBar in Applications -> Open -> Open, or
      • System Settings -> Privacy & Security -> "Open Anyway".

    Then grant Accessibility permission (required to read Dock badges):
      System Settings -> Privacy & Security -> Accessibility -> enable BadgeBar.
  EOS
end
