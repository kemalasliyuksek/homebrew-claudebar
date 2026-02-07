cask "claudebar-monitor" do
  version "1.0.2"
  sha256 "a504bf9748a91ef450eacb550c71f41679443524658662e3a5bf61eee36781ac"
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
