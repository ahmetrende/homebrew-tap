cask "badgebar" do
  version "1.0.2"
  sha256 "0325c3a9d391e35f14c18d604d6ef2be91f5aebccca1911ea458e9df5348cbd6"

  url "https://github.com/ahmetrende/BadgeBar/releases/download/v#{version}/BadgeBar.dmg"
  name "BadgeBar"
  desc "Mirror app unread badges into the macOS menu bar"
  homepage "https://github.com/ahmetrende/BadgeBar"

  depends_on macos: ">= :sonoma"

  app "BadgeBar.app"

  uninstall quit: "com.ahmetrende.badgebar"

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
