cask "claudebar-monitor" do
  version "1.0.1"
  sha256 "173ca3f907918934e6b864c82da8b1cc8e3a6b714c86b39dc9cd0f731905a9db"
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
