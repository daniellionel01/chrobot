import chrobot/chrome
import gleam/erlang/os
import gleam/json
import gleam/list
import gleam/option
import gleam/string_builder as sb
import gleeunit/should
import test_utils

pub fn is_local_chrome_path_test() {
  let valid_mac_path =
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing"
  chrome.is_local_chrome_path(valid_mac_path, os.Darwin)
  |> should.equal(True)

  let valid_linux_path = "chrome/linux-116.0.5793.0/chrome-linux64/chrome"
  chrome.is_local_chrome_path(valid_linux_path, os.Linux)
  |> should.equal(True)
}

pub fn is_local_chrome_path_haystack_test() {
  let haystack = [
    "chrome/.metadata", "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/ABOUT",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/document.icns",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/app.icns",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/scripting.sdef",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/de.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/ur.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/he.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/ar.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/el.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/ja.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/fa.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/mr.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/en.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/uk.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/es_419.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/gu.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/zh_CN.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/kn.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/nb.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/am.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/es.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/sw.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/sl.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/pt_BR.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/da.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/et.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/it.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/bg.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/sk.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/pt_PT.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/sr.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/ms.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/ta.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/ml.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/sv.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/com.google.chrome.for.testing.manifest/Contents/Resources/com.google.chrome.for.testing.manifest",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/com.google.chrome.for.testing.manifest/Contents/Resources/en.lproj/Localizable.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/te.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/cs.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/ko.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/fil.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/hu.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/tr.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/pl.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/zh_TW.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/en_GB.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/vi.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/lv.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/lt.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/ru.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/af.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/fr.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/fi.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/id.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/nl.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/th.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/bn.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/ro.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/hr.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/hi.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Resources/ca.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Google Chrome for Testing Framework",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/chrome_200_percent.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/chrome_100_percent.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/icudtl.dat",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/install.sh",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/v8_context_snapshot.arm64.bin",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/resources.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/product_logo_32.png",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/gpu_shader_cache.bin",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/app_mode-Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/de.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/ur.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/he.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/ar.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/el.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/ja.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/fa.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/mr.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/en.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/uk.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/es_419.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/gu.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/zh_CN.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/kn.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/nb.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/am.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/es.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/sw.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/sl.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/pt_BR.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/da.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/et.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/it.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/bg.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/sk.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/pt_PT.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/sr.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/ms.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/ta.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/ml.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/sv.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/te.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/cs.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/ko.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/fil.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/hu.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/tr.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/pl.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/zh_TW.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/en_GB.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/vi.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/lv.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/lt.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/ru.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/af.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/fr.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/fi.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/id.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/nl.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/th.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/bn.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/ro.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/hr.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/hi.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Resources/ca.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Google Chrome for Testing Framework",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/chrome_200_percent.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/chrome_100_percent.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/icudtl.dat",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/install.sh",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/v8_context_snapshot.arm64.bin",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/resources.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/product_logo_32.png",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/gpu_shader_cache.bin",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/app_mode-Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/de.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/ur.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/he.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/ar.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/el.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/ja.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/fa.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/mr.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/en.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/uk.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/es_419.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/gu.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/zh_CN.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/kn.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/nb.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/am.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/es.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/sw.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/sl.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/pt_BR.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/da.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/et.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/it.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/bg.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/sk.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/pt_PT.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/sr.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/ms.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/ta.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/ml.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/sv.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/te.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/cs.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/ko.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/fil.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/hu.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/tr.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/pl.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/zh_TW.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/en_GB.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/vi.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/lv.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/lt.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/ru.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/af.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/fr.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/fi.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/id.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/nl.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/th.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/bn.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/ro.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/hr.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/hi.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Resources/ca.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Libraries/libEGL.dylib",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Libraries/vk_swiftshader_icd.json",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Libraries/libvk_swiftshader.dylib",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Libraries/libGLESv2.dylib",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Libraries/MEIPreload/preloaded_data.pb",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Libraries/MEIPreload/manifest.json",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Libraries/WidevineCdm/LICENSE",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Libraries/WidevineCdm/manifest.json",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Libraries/WidevineCdm/_platform_specific/mac_arm64/libwidevinecdm.dylib",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/web_app_shortcut_copier",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/chrome_crashpad_handler",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/app_mode_loader",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper (Plugin).app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper (Plugin).app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper (Plugin).app/Contents/MacOS/Google Chrome for Testing Helper (Plugin)",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper (Alerts).app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper (Alerts).app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper (Alerts).app/Contents/MacOS/Google Chrome for Testing Helper (Alerts)",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper (Alerts).app/Contents/Resources/app.icns",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper (Alerts).app/Contents/Resources/base.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper.app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper.app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper.app/Contents/MacOS/Google Chrome for Testing Helper",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper (GPU).app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper (GPU).app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper (GPU).app/Contents/MacOS/Google Chrome for Testing Helper (GPU)",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper (Renderer).app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper (Renderer).app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/Current/Helpers/Google Chrome for Testing Helper (Renderer).app/Contents/MacOS/Google Chrome for Testing Helper (Renderer)",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Google Chrome for Testing Framework",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/chrome_200_percent.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/chrome_100_percent.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/icudtl.dat",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/install.sh",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/v8_context_snapshot.arm64.bin",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/resources.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/product_logo_32.png",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/gpu_shader_cache.bin",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/app_mode-Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/de.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/ur.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/he.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/ar.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/el.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/ja.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/fa.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/mr.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/en.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/uk.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/es_419.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/gu.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/zh_CN.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/kn.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/nb.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/am.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/es.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/sw.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/sl.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/pt_BR.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/da.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/et.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/it.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/bg.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/sk.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/pt_PT.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/sr.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/ms.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/ta.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/ml.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/sv.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/te.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/cs.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/ko.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/fil.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/hu.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/tr.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/pl.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/zh_TW.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/en_GB.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/vi.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/lv.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/lt.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/ru.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/af.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/fr.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/fi.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/id.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/nl.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/th.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/bn.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/ro.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/hr.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/hi.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Resources/ca.lproj/locale.pak",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Libraries/libEGL.dylib",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Libraries/vk_swiftshader_icd.json",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Libraries/libvk_swiftshader.dylib",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Libraries/libGLESv2.dylib",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Libraries/MEIPreload/preloaded_data.pb",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Libraries/MEIPreload/manifest.json",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Libraries/WidevineCdm/LICENSE",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Libraries/WidevineCdm/manifest.json",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Libraries/WidevineCdm/_platform_specific/mac_arm64/libwidevinecdm.dylib",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/web_app_shortcut_copier",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/chrome_crashpad_handler",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/app_mode_loader",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper (Plugin).app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper (Plugin).app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper (Plugin).app/Contents/MacOS/Google Chrome for Testing Helper (Plugin)",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper (Alerts).app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper (Alerts).app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper (Alerts).app/Contents/MacOS/Google Chrome for Testing Helper (Alerts)",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper (Alerts).app/Contents/Resources/app.icns",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper (Alerts).app/Contents/Resources/base.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper.app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper.app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper.app/Contents/MacOS/Google Chrome for Testing Helper",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper (GPU).app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper (GPU).app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper (GPU).app/Contents/MacOS/Google Chrome for Testing Helper (GPU)",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper (Renderer).app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper (Renderer).app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Versions/126.0.6458.0/Helpers/Google Chrome for Testing Helper (Renderer).app/Contents/MacOS/Google Chrome for Testing Helper (Renderer)",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Libraries/libEGL.dylib",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Libraries/vk_swiftshader_icd.json",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Libraries/libvk_swiftshader.dylib",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Libraries/libGLESv2.dylib",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Libraries/MEIPreload/preloaded_data.pb",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Libraries/MEIPreload/manifest.json",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Libraries/WidevineCdm/LICENSE",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Libraries/WidevineCdm/manifest.json",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Libraries/WidevineCdm/_platform_specific/mac_arm64/libwidevinecdm.dylib",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/web_app_shortcut_copier",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/chrome_crashpad_handler",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/app_mode_loader",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper (Plugin).app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper (Plugin).app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper (Plugin).app/Contents/MacOS/Google Chrome for Testing Helper (Plugin)",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper (Alerts).app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper (Alerts).app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper (Alerts).app/Contents/MacOS/Google Chrome for Testing Helper (Alerts)",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper (Alerts).app/Contents/Resources/app.icns",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper (Alerts).app/Contents/Resources/base.lproj/InfoPlist.strings",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper.app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper.app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper.app/Contents/MacOS/Google Chrome for Testing Helper",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper (GPU).app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper (GPU).app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper (GPU).app/Contents/MacOS/Google Chrome for Testing Helper (GPU)",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper (Renderer).app/Contents/Info.plist",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper (Renderer).app/Contents/PkgInfo",
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/Frameworks/Google Chrome for Testing Framework.framework/Helpers/Google Chrome for Testing Helper (Renderer).app/Contents/MacOS/Google Chrome for Testing Helper (Renderer)",
  ]

  let needle =
    list.filter(haystack, fn(i) { chrome.is_local_chrome_path(i, os.Darwin) })

  list.length(needle)
  |> should.equal(1)

  needle
  |> should.equal([
    "chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing",
  ])
}

/// Launch the browser, query the version, quit
pub fn launch_with_config_test() {
  let browser_path = test_utils.get_browser_path()
  let config =
    chrome.BrowserConfig(
      path: browser_path,
      args: chrome.get_default_chrome_args(),
      start_timeout: 5000,
      log_level: chrome.LogLevelWarnings,
    )
  let browser_subject = should.be_ok(chrome.launch_with_config(config))
  should.be_ok(chrome.get_version(browser_subject))
  should.be_ok(chrome.quit(browser_subject))
}

// Ensure the call function correctly handles errors sent by the browser
pub fn handle_protocol_error_test() {
  let browser_path = test_utils.get_browser_path()
  let config =
    chrome.BrowserConfig(
      path: browser_path,
      args: chrome.get_default_chrome_args(),
      start_timeout: 5000,
      log_level: chrome.LogLevelWarnings,
    )
  let browser_subject = should.be_ok(chrome.launch_with_config(config))
  let invalid_payload =
    option.Some(
      json.object([
        #("url", json.string("http://example.com")),
        #("width", json.string("Should be an int!")),
      ]),
    )

  let res =
    chrome.call(
      browser_subject,
      "Target.createTarget",
      invalid_payload,
      option.None,
      5000,
    )

  case res {
    Error(chrome.BrowserError(code, message, _data)) -> {
      message
      |> should.equal("Invalid parameters")
      code
      |> should.equal(-32_602)
    }
    Ok(_) -> panic as "didn't receive error from call with invalid payload"
    _ -> panic as "didn't receive correct error from call with invalid payload"
  }
  should.be_ok(chrome.quit(browser_subject))
}

pub fn handle_protocol_error_2_test() {
  let browser_path = test_utils.get_browser_path()
  let config =
    chrome.BrowserConfig(
      path: browser_path,
      args: chrome.get_default_chrome_args(),
      start_timeout: 5000,
      log_level: chrome.LogLevelWarnings,
    )
  let browser_subject = should.be_ok(chrome.launch_with_config(config))

  let res =
    chrome.call(browser_subject, "Bogus.method", option.None, option.None, 5000)

  case res {
    Error(chrome.BrowserError(code, message, _data)) -> {
      message
      |> should.equal("'Bogus.method' wasn't found")
      code
      |> should.equal(-32_601)
    }
    Ok(_) -> panic as "didn't receive error from call with invalid method"
    _ -> panic as "didn't receive correct error from call with invalid method"
  }

  should.be_ok(chrome.quit(browser_subject))
}

pub fn process_port_message_test() {
  // Simplest possible message
  let message = "a\u{0000}"
  let #(chunks, buffer) = chrome.process_port_message(message, sb.new())

  chunks
  |> should.equal(["a"])
  sb.is_empty(buffer)
  |> should.equal(True)

  // Several packets in one message
  let message = "a\u{0000}b\u{0000}c\u{0000}"
  let #(chunks, buffer) = chrome.process_port_message(message, sb.new())

  chunks
  |> should.equal(["a", "b", "c"])
  sb.is_empty(buffer)
  |> should.equal(True)

  // Buffering messages
  let message = "some message\u{0000}some unfinished"
  let #(chunks, buffer) = chrome.process_port_message(message, sb.new())
  chunks
  |> should.equal(["some message"])
  sb.is_empty(buffer)
  |> should.equal(False)
  sb.to_string(buffer)
  |> should.equal("some unfinished")

  let second_message = " message\u{0000}:)\u{0000}"
  let #(chunks, buffer) = chrome.process_port_message(second_message, buffer)

  chunks
  |> should.equal(["some unfinished message", ":)"])
  sb.is_empty(buffer)
  |> should.equal(True)
}
