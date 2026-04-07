$allWrapperFiles = Get-ChildItem -Recurse -File data | Where-Object { $_.FullName -match "function\\blocks\\.+\\on_(break|powered)\.mcfunction$" }
$targetFiles = Get-ChildItem -Recurse -File data -Filter "*.mcfunction"
$rootPath = (Get-Location).Path

$safeWrappers = @()
$skippedWrappers = @()

foreach ($wf in $allWrapperFiles) {
    $rawLines = Get-Content $wf.FullName
    $cmdLines = @($rawLines | Where-Object { $_.Trim() -ne '' -and -not $_.Trim().StartsWith('#') })
    $hasReturn = ($cmdLines | Where-Object { $_ -match '(^|\s)return(\s|$)' }).Count -gt 0
    $hasMacro = ($cmdLines | Where-Object { $_.Trim().StartsWith('$') }).Count -gt 0
    if (-not $hasReturn -and -not $hasMacro -and $cmdLines.Count -gt 0) {
        $safeWrappers += [PSCustomObject]@{ File = $wf; Body = $cmdLines }
    } else {
        $skippedWrappers += [PSCustomObject]@{ File = $wf; Return = $hasReturn; Macro = $hasMacro }
    }
}

$inlined = @()
$deleted = @()
$notDeleted = @()

foreach ($entry in $safeWrappers) {
    $wf = $entry.File
    $body = $entry.Body

    if ($wf.FullName.StartsWith($rootPath, [System.StringComparison]::OrdinalIgnoreCase)) {
        $rel = $wf.FullName.Substring($rootPath.Length).TrimStart('\\')
    } else {
        $rel = $wf.FullName
    }
    if (-not ($rel -match '^data\\([^\\]+)\\function\\(.+)\.mcfunction$')) { continue }

    $ns = $Matches[1]
    $rest = $Matches[2].Replace([char]92,'/')
    $funcId = "${ns}:$rest"

    $funcPattern = [Regex]::Escape($funcId)
    $totalReplacements = 0

    foreach ($tf in $targetFiles) {
        $lines = Get-Content $tf.FullName
        $newLines = New-Object System.Collections.Generic.List[string]
        $changed = $false

        foreach ($line in $lines) {
            $replaced = $false

            $mRun = [regex]::Match($line, "^(?<prefix>.*\brun\s+)function\s+$funcPattern\s*$")
            if ($mRun.Success) {
                $prefix = $mRun.Groups['prefix'].Value
                foreach ($cmd in $body) { $newLines.Add($prefix + $cmd.Trim()) }
                $changed = $true
                $replaced = $true
                $totalReplacements++
            }

            if (-not $replaced) {
                $mDirect = [regex]::Match($line, "^(?<indent>\s*)function\s+$funcPattern\s*$")
                if ($mDirect.Success) {
                    $indent = $mDirect.Groups['indent'].Value
                    foreach ($cmd in $body) { $newLines.Add($indent + $cmd.Trim()) }
                    $changed = $true
                    $replaced = $true
                    $totalReplacements++
                }
            }

            if (-not $replaced) { $newLines.Add($line) }
        }

        if ($changed) {
            Set-Content -Path $tf.FullName -Value $newLines -Encoding utf8
        }
    }

    if ($totalReplacements -gt 0) {
        $remaining = Select-String -Path (Get-ChildItem -Recurse -File data | Select-Object -ExpandProperty FullName) -Pattern $funcId -SimpleMatch -ErrorAction SilentlyContinue
        if (-not $remaining) {
            Remove-Item $wf.FullName
            $deleted += $rel
        } else {
            $notDeleted += "$rel (references remain)"
        }
        $inlined += "$rel -> $totalReplacements"
    } else {
        $notDeleted += "$rel (no call-sites replaced)"
    }
}

"INLINED_COUNT: $($inlined.Count)"
$inlined
"DELETED_COUNT: $($deleted.Count)"
$deleted
"SKIPPED_COUNT: $($skippedWrappers.Count)"
$skippedWrappers | ForEach-Object {
    $skipPath = if ($_.File.FullName.StartsWith($rootPath, [System.StringComparison]::OrdinalIgnoreCase)) { $_.File.FullName.Substring($rootPath.Length).TrimStart('\\') } else { $_.File.FullName }
    $skipPath + " return=" + $_.Return + " macro=" + $_.Macro
}
"NOT_DELETED_COUNT: $($notDeleted.Count)"
$notDeleted
