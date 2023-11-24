class Rcon < Formula
  desc "Source RCON client for shell"
  homepage "https://github.com/n0la/rcon"
  url "https://github.com/n0la/rcon/archive/0.6.tar.gz"
  sha256 "c8d533319891534546dc23b8616aefadf8844e3f5f22674bb83fd69df1460540"
  license "BSD-2-Clause"
  head "https://github.com/n0la/rcon.git"

  depends_on "check" => :build
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "glib"

  def install
    system "cmake", ".", "-DINSTALL_BASH_COMPLETION=OFF", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    assert_equal "No host and/or port specified", shell_output("#{bin}/rcon 2>&1", 1).chomp
  end
end
