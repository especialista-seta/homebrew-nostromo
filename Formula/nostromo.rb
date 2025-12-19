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

  # Core dependencies - these are the main ones needed
  # Run `poet nostromo-cli` to auto-generate full dependency list

  resource "textual" do
    url "https://files.pythonhosted.org/packages/source/t/textual/textual-0.89.1.tar.gz"
    sha256 "28753d816c27ed0e90b0e3c8b0dcb16cba87957a3e9b9c5b3e4e7f3e2dba3e0e"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/source/r/rich/rich-13.9.4.tar.gz"
    sha256 "439594978a49a09530cff7ebc4b5c7103ef57c5a47e2c73c59e7e5d4c5f9b2e0"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/source/c/click/click-8.1.7.tar.gz"
    sha256 "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/source/p/pydantic/pydantic-2.10.3.tar.gz"
    sha256 "cb5ac360ce894ceacd69c403187900a02c4b20b693a701f73f27c2a7e6e5b39e"
  end

  resource "httpx" do
    url "https://files.pythonhosted.org/packages/source/h/httpx/httpx-0.28.1.tar.gz"
    sha256 "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
  end

  resource "keyring" do
    url "https://files.pythonhosted.org/packages/source/k/keyring/keyring-25.5.0.tar.gz"
    sha256 "4c753b3ec91717fe713c4edd522a625889d8973a349b0e582622f49766de58e6"
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
