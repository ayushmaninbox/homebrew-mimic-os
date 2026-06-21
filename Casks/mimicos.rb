cask "mimicos" do
  version "2.0"
  sha256 "dfc5a0429102b9c62a8f009fb1d7d0e112924ec1d88f25f44dc2018cccbd6f25"

  url "https://github.com/ayushmaninbox/mimic-os/releases/download/v#{version}/MimicOS-v#{version}.dmg"
  name "MimicOS"
  desc "Mirror, control, and transfer files to an Android phone (no apps, no root)"
  homepage "https://github.com/ayushmaninbox/mimic-os"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "MimicOS.app"

  # MimicOS ships an ad-hoc signature rather than an Apple Developer ID, so it is
  # not notarized. macOS therefore quarantines the download. Stripping the
  # com.apple.quarantine attribute lets the app open without the "Apple could
  # not verify" Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MimicOS.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.ayushman.mimicos.plist",
    "~/Library/Saved Application State/com.ayushman.mimicos.savedState",
  ]
end
