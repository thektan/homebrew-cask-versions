cask 'wine-devel' do
  version '3.17'
  sha256 'e092b972c2f8946650a67873c02285e6fedc455ee4cffcec7803e4bd94fd2255'

  url "https://dl.winehq.org/wine-builds/macosx/pool/winehq-devel-#{version}.pkg"
  appcast 'https://dl.winehq.org/wine-builds/macosx/download.html'
  name 'WineHQ-devel'
  homepage 'https://wiki.winehq.org/MacOS'

  depends_on x11: true

  pkg "winehq-devel-#{version}.pkg",
      choices: [
                 {
                   'choiceIdentifier' => 'choice3',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 1,
                 },
               ]

  uninstall pkgutil: [
                       'org.winehq.wine-devel',
                       'org.winehq.wine-devel-deps',
                       'org.winehq.wine-devel-deps64',
                       'org.winehq.wine-devel32',
                       'org.winehq.wine-devel64',
                     ],
            delete:  '/Applications/Wine Devel.app'

  caveats <<~EOS
    #{token} installs support for running 64 bit applications in Wine, which is considered experimental.
    If you do not want 64 bit support, you should download and install the #{token} package manually.
  EOS
end
