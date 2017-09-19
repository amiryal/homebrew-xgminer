require 'formula'

class Cgminer < Formula
  homepage 'https://github.com/vthoang/cgminer'
  head 'https://github.com/vthoang/cgminer.git', :branch => 'master'
  url 'https://github.com/amiryal/cpuminer/archive/gekko-v4.10.0.tar.gz'
  sha256 'a7cdd033b2fc448feb74499f7f177406a3c85544c3dac1a47e89ae227842203a'

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'pkg-config' => :build
  depends_on 'coreutils' => :build
  depends_on 'curl'
  depends_on 'libusb'

  def install
    system "./autogen.sh", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "PKG_CONFIG_PATH=#{HOMEBREW_PREFIX}/opt/curl/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/jansson/lib/pkgconfig:#{HOMEBREW_PREFIX}/opt/libusb/lib/pkgconfig",
                          "--enable-gekko",
                          "--enable-bflsc",
                          "--enable-bitforce",
                          "--enable-icarus",
                          "--enable-modminer",
                          "--enable-avalon",
                          "--disable-adl",
                          "--enable-opencl",
                          "--enable-bitfury",
                          "--enable-hashfast",
                          "--enable-klondike",
                          "--enable-drillbit",
                          "--enable-avalon2",
                          "--enable-blockerupter",
                          "--enable-cointerra",
                          "--enable-hashratio"
    system "make", "install"
  end

  test do
    system "cgminer"
  end
end
