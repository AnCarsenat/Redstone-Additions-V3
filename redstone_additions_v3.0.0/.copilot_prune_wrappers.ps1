$wrappers = Get-ChildItem -Recurse -File data | Where-Object { $_.FullName -match "function\\blocks\\.+\\on_(break|powered)\.mcfunction$" }
$root = (Get-Location).Path
$deleted = @()
$kept = @()

foreach ($wf in $wrappers) {
    $rel = $wf.FullName.Substring($root.Length).TrimStart('\\')
    if (-not ($rel -match '^data\\([^\\]+)\\function\\(.+)\.mcfunction$')) { continue }

    $funcId = "$($Matches[1]):$($Matches[2].Replace([char]92,'/'))"
    $pattern = "function\\s+$([regex]::Escape($funcId))(\\s|$)"

    $mcFiles = Get-ChildItem -Recurse -File data -Filter "*.mcfunction" | Select-Object -ExpandProperty FullName
    $hits = Select-String -Path $mcFiles -Pattern $pattern -AllMatches -ErrorAction SilentlyContinue

    if (-not $hits) {
        Remove-Item $wf.FullName
        $deleted += $rel
    } else {
        $kept += "$rel refs=$($hits.Count)"
    }
}

"DELETED_COUNT: $($deleted.Count)"
$deleted
"KEPT_COUNT: $($kept.Count)"
$kept
