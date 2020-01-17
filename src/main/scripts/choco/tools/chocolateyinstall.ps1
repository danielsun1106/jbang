﻿$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$jbang_home = Join-Path $package 'jbang-@projectVersion@'
$jbang_bat = Join-Path $jbang_home 'bin/jbang.bat'

Install-ChocolateyZipPackage `
    -PackageName 'jbang' `
    -Url 'https://github.com/maxandersen/jbang/releases/download/v@projectVersion@/jbang-@projectVersion@.zip' `
    -Checksum '@sha256@' `
    -ChecksumType 'sha256' `
    -UnzipLocation $package

Install-BinFile -Name 'jbang' -Path $jbang_bat

Update-SessionEnvironment