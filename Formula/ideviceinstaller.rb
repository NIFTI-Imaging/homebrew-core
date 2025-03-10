class Ideviceinstaller < Formula
  desc "Tool for managing apps on iOS devices"
  homepage "https://www.libimobiledevice.org/"
  url "https://github.com/libimobiledevice/ideviceinstaller/releases/download/1.1.1/ideviceinstaller-1.1.1.tar.bz2"
  sha256 "deb883ec97f2f88115aab39f701b83c843e9f2b67fe02f5e00a9a7d6196c3063"

  bottle do
    cellar :any
    sha256 "6ee12db78e8c224c0eb0cf88eb4f43242eb1ba672eb006636273b99b75b02a87" => :catalina
    sha256 "6ed5e4f7ace33fd5f4d1b4c6b9f0fd519836080e170b981e63942087698351c6" => :mojave
    sha256 "0dfe944eaa47cad87ad22f70dbbcefdb6b27bbeb83ca1f7a229827c03054c07c" => :high_sierra
  end

  head do
    url "https://git.sukimashita.com/ideviceinstaller.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  depends_on "pkg-config" => :build
  depends_on "libimobiledevice"
  depends_on "libplist"
  depends_on "libzip"

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/ideviceinstaller --help |grep -q ^Usage"
  end
end
