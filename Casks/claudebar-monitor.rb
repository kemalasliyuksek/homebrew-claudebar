cask "claudebar-monitor" do
  version "1.0.0"
  sha256 "51afd3d40c0460ef781e0a942e4954dd735902bbb25643f3a1b84c048f4eebc2"
  url "https://github.com/kemalasliyuksek/ClaudeBar/releases/download/v#{version}/ClaudeBar-v#{version}-macos.zip"
  name "ClaudeBar"
  desc "Native macOS menu bar app for monitoring Claude usage limits"
  homepage "https://github.com/kemalasliyuksek/ClaudeBar"
  depends_on macos: ">= :sonoma"
  app "ClaudeBar.app"
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ClaudeBar.app"],
                   sudo: false
  end
  zap trash: [
    "~/Library/Preferences/com.kemalasliyuksek.ClaudeBar.plist",
  ]
end
