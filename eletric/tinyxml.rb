require 'formula'

class Tinyxml < Formula
  url 'https://kforge.ros.org/rosrelease/viewvc/sourcedeps/tinyxml/tinyxml_2_6_2_stl_enabled.tar.gz'
  homepage 'http://www.grinninglizard.com/tinyxml/'
  md5 '35efe59f25b7980a6f3ec0118908cc11'
  version '2.6.2'

  keg_only "To keep versions independant and not polute /usr/local."
  
  depends_on 'cmake'

  def install
    extra_ops = ""
    if ARGV.build_universal?
      extra_ops += "-DCMAKE_OSX_ARCHITECTURES=\"i386;x86_64\""
    end

    system "cmake . #{std_cmake_parameters} #{extra_ops}"
    system "make install"
  end
end
