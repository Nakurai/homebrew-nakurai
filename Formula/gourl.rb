# to generate the sh256 checksum, use openssl sha256 <file name>
# generate it for the files that homebrew will download (so the zip file in the case of macos)
class Gourl < Formula
  desc "A use friendly mix between cURL and tools like Postman, Insomnia, etc."
  homepage "https://github.com/nakurai/gourl"
  version "1.0.1-alpha"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Nakurai/gourl/releases/download/v#{version}/#{version}-gourl-macos-amd64.zip"
      sha256 "8e1a0468ecdfbcb71d4e5c37f823c05c4dc6896a4d9434b53e05ac4cb80dc6e1"
    elsif Hardware::CPU.arm?
      url "https://github.com/Nakurai/gourl/releases/download/v#{version}/#{version}-gourl-macos-arm64.zip"
      sha256 "7260f5e874dbec15b59ec467bddcd67f6cf6e15dcaad79c258bd6d13080f9b1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/Nakurai/gourl/releases/download/v#{version}/#{version}-gourl-linux-arm64"
        sha256 "20f35ab819bee1270b57e962ae69cb51621a8d5dbde0c55b3a30b8b6d80158e5"
    end
    if Hardware::CPU.intel?
        url "https://github.com/Nakurai/gourl/releases/download/v#{version}/#{version}-gourl-linux-amd64"
        sha256 "cc7553bd7d8e2ba5bc2ccdccd96ff272fbd3dba4be432805ad738a13d18f5153"
    end
  end

  def install
    bin.install "gourl"
  end

end