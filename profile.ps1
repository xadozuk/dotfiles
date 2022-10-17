# WSL specific part

$ASDF_BIN = "$($env:HOME)/.asdf/bin"
$ASDF_USER_SHIMS = "$($env:HOME)/.asdf/shims"

[System.Environment]::SetEnvironmentVariable('ASDF_BIN', $ASDF_BIN, [EnvironmentVariableTarget]::Process)
[System.Environment]::SetEnvironmentVariable('ASDF_USER_SHIMS', $ASDF_USER_SHIMS, [EnvironmentVariableTarget]::Process)

[System.Environment]::SetEnvironmentVariable('MANPATH',$('/home/linuxbrew/.linuxbrew/share/man'+$(if(${ENV:MANPATH}){':'+${ENV:MANPATH}})+':'),[System.EnvironmentVariableTarget]::Process)
[System.Environment]::SetEnvironmentVariable('INFOPATH',$('/home/linuxbrew/.linuxbrew/share/info'+$(if(${ENV:INFOPATH}){':'+${ENV:INFOPATH}})),[System.EnvironmentVariableTarget]::Process)

[System.Environment]::SetEnvironmentVariable(
    'PATH',
    "$($ASDF_BIN):$($ASDF_USER_SHIMS):" + 
    "$($ENV:HOME)/bin" + 
    $ENV:PATH,
    [System.EnvironmentVariableTarget]::Process
)

# -- WSL

#region Helpers functions

function Reset-Profile
{
    . $Profile.CurrentUserAllHosts
}

function Import-MyFunction
{
    if($null -ne $env:PSMYHOME -and (Test-Path -Path $env:PSMYHOME -PathType Container))
    {
        $Files = Get-ChildItem -Path $env:PSMYHOME -Filter "*.ps1" -Recurse -File

        $Files | ForEach-Object { . $_.FullName }
    }
    else
    {
        Write-Host -ForegroundColor Cyan "You can customize the auto-load folder by setting `$env:PSMYHOME"
    }
}

function Test-Powerline
{
    return ($null -ne $env:WT_SESSION) -and ($env:TERM_PROGRAM -ne "vscode") -and -not $MySettings.DisablePowerlinePrompt
}

#endregion

if($null -eq $MySettings)
{
    $MySettings = @{
        DisablePowerlinePrompt = $false
    }
}

$PSDefaultParameterValues = @{
    # Install module in user scope by default (no need for admin prompt)
    "Install-Module:Scope"      = "CurrentUser"

    # Capture last command in the $__ var
    "Out-Default:OutVariable"   = "__"
}

# Prompt
$OhMyPoshTheme = if(Test-Powerline) { "$($env:HOME)/.config/powershell/xadozuk.powerline.omp.json" }
                 else { "$($env:HOME)/.config/powershell/xadozuk.simple.omp.json" }
oh-my-posh --init --shell pwsh --config $OhMyPoshTheme | Invoke-Expression

# Auto load my functions
. Import-MyFunction

# Setup alias
Set-Alias -Name Watch -Value Watch-Command -Force
#Set-Alias -Name code -Value code-insiders.cmd -Force

if((Get-Module -Name PSReadLine).Version -ge [Version]"2.1.0")
{
    # PSReadline options
    Set-PSReadLineOption -PredictionSource History   
}

# PSReadline binding
Set-PSReadLineKeyHandler -Key "Ctrl+f" -Function ForwardWord

if(Test-Powerline) { Set-PSReadLineOption -PromptText "$([char]::ConvertFromUtf32(0x276F)) " }
else { Set-PSReadLineOption -PromptText "> " }

