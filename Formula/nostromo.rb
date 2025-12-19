# typed: false
# frozen_string_literal: true

class Nostromo < Formula
  include Language::Python::Virtualenv

  desc "MU-TH-UR 6000 AI Interface - An Aliens-themed CLI chatbot"
  homepage "https://github.com/especialista-seta/nostromo"
  url "https://files.pythonhosted.org/packages/source/n/nostromo-cli/nostromo_cli-0.1.0.tar.gz"
  sha256 "9fbbfc6c7a84c750bf638067b805c8d4b9d824083ae2d6fec132c63a097c6c3a"
  license "MIT"

  depends_on "python@3.11"

  resource "nostromo-core" do
    url "https://files.pythonhosted.org/packages/source/n/nostromo-core/nostromo_core-0.1.0.tar.gz"
    sha256 "0b7c1958cfa5bcfb469adf4edd76eb0aa6859d9dd9633cb6de76502e2e503d2a"
  end

  resource "textual" do
    url "https://files.pythonhosted.org/packages/source/t/textual/textual-6.11.0.tar.gz"
    sha256 "08237ebda0cfbbfd1a4e2fd3039882b35894a73994f6f0fcc12c5b0d78acf3cc"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/source/r/rich/rich-14.2.0.tar.gz"
    sha256 "73ff50c7c0c1c77c8243079283f4edb376f0f6442433aecb8ce7e6d0b92d1fe4"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/source/c/click/click-8.1.7.tar.gz"
    sha256 "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/source/p/pydantic/pydantic-2.12.5.tar.gz"
    sha256 "4d351024c75c0f085a9febbb665ce8c0c6ec5d30e903bdb6394b7ede26aebb49"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/source/h/httpx/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
  end

  resource "keyring" do
    url "https://files.pythonhosted.org/packages/source/k/keyring/keyring-25.7.0.tar.gz"
    sha256 "fe01bd85eb3f8fb3dd0405defdeac9a5b4f6f0439edbb3149577f244a2e8245b"
  end

  def install
    virtualenv_install_with_resources
  end

  def post_install
    ohai "NOSTROMO installed successfully!"
    ohai "Run 'nostromo configure' to set up your API keys"
  end

  def caveats
    <<~EOS
      ╔══════════════════════════════════════════════════════════════╗
      ║  MU-TH-UR 6000 ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ USCSS NOSTROMO ║
      ╚══════════════════════════════════════════════════════════════╝

      First-time setup:
        nostromo configure

      Launch the interface:
        nostromo

      For more information:
        nostromo --help
    EOS
  end

  test do
    system "#{bin}/nostromo", "--help"
  end
end
