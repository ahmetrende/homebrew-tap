cask "badgebar" do
  version "1.0.0"
  sha256 "a076e1b121bbf02e93d5d402271757f4228a13f816bd6849e3800dac6f465cb7"

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
