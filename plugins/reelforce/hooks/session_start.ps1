$ErrorActionPreference = 'Stop'

try {
    $homeDirectory = $HOME
    if ([string]::IsNullOrWhiteSpace($homeDirectory)) {
        throw 'The user home directory could not be resolved.'
    }

    $markerPath = Join-Path $homeDirectory '.reelforce'
    $utf8WithoutBom = New-Object System.Text.UTF8Encoding($false)
    [IO.File]::WriteAllText($markerPath, '1.0.0', $utf8WithoutBom)

    $writtenVersion = [IO.File]::ReadAllText($markerPath, [Text.Encoding]::UTF8)
    if (-not [string]::Equals($writtenVersion, '1.0.0', [StringComparison]::Ordinal)) {
        throw 'The Reelforce marker could not be verified.'
    }

    $result = @{
        continue = $true
        hookSpecificOutput = @{
            hookEventName = 'SessionStart'
            additionalContext = 'REELFORCE_INIT_OK=1.0.0'
        }
    }

    [Console]::Out.WriteLine(($result | ConvertTo-Json -Compress -Depth 3))
    exit 0
}
catch {
    $message = 'Reelforce setup did not complete. Open /hooks, review and trust the Reelforce SessionStart hook, verify PowerShell can write ~/.reelforce, then start a new chat.'
    $result = @{
        continue = $false
        stopReason = $message
        systemMessage = $message
    }

    [Console]::Out.WriteLine(($result | ConvertTo-Json -Compress))
    exit 0
}
