# Set-Proxy or Set-Proxy -Clear

function Set-Proxy {
    [CmdletBinding()]
    param (
        [ValidateRange(1, 65535)]
        [Int32]
        $Port = 7890,

        [Switch]
        $Git,

        [Switch]
        $Clear
    )

    if ($Git) {
        Set-GitProxy -Port $Port $Clear
    } else {
        Set-SystemProxy -Port $Port $Clear
    }
}

function Set-GitProxy {
    param (
        [Int32]
        $Port,
        
        [Bool]
        $Clear
    )

    if ($Clear) {
        git config --global --unset http.proxy
        git config --global --unset https.proxy
        Write-Output "Git proxy set to null"
    } else {
        $ProxyHost = "127.0.0.1:$Port"
        git config --global http.proxy $ProxyHost
        git config --global https.proxy $ProxyHost
        Write-Output "Git proxy set to: $ProxyHost"
    }
}

function Set-SystemProxy {
    param (
        [Int32]
        $Port,
        
        [Bool]
        $Clear
    )

    if ($Clear) {
        $env:HTTP_PROXY = $null
        $env:HTTPS_PROXY = $null
        Write-Output "Proxy set to null"
    } else {
        $ProxyHost = "127.0.0.1:$Port"
        $env:HTTP_PROXY = "http://$ProxyHost"
        $env:HTTPS_PROXY = "https://$ProxyHost"
        Write-Output "Proxy set to: $ProxyHost"
    }
}

Export-ModuleMember -Function Set-Proxy