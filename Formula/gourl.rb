# to generate the sh256 checksum, use openssl sha256 <file name>
# generate it for the files that homebrew will download (so the zip file in the case of macos)
class Gourl < Formula
  desc "A use friendly mix between cURL and tools like Postman, Insomnia, etc."
  homepage "https://github.com/nakurai/gourl"
  version "1.0.0-alpha"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Nakurai/gourl/releases/download/v1.0.0-alpha/1.0.0-alpha-gourl-macos-amd64.zip"
      sha256 "d62c516ead1628f0f6ac11ec1a20a97218411887ab6e8afaa9621a922149d571"
    elsif Hardware::CPU.arm?
      url "https://github.com/Nakurai/gourl/releases/download/v1.0.0-alpha/1.0.0-alpha-gourl-macos-arm64.zip"
      sha256 "5396a0ae1d781446b020019492a5168462aed949ca93f34269b2e47ec621162d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/Nakurai/gourl/releases/download/v1.0.0-alpha/1.0.0-alpha-gourl-linux-arm64"
        sha256 "6d9adebf712fab49f7471d86e3f905d220a092f27299c67c997b7dd647207955"
    end
    if Hardware::CPU.intel?
        url "https://github.com/Nakurai/gourl/releases/download/v1.0.0-alpha/1.0.0-alpha-gourl-linux-amd64"
        sha256 "6d9adebf712fab49f7471d86e3f905d220a092f27299c67c997b7dd647207955"
    end
  end

  def install
    bin.install "gourl"
  end

end