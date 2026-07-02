cask "badgebar" do
  version "1.0.3"
  sha256 "cd9dcae87be36d67a6746f9a895260c712226941bbdf6f892962245178fe4051"

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
