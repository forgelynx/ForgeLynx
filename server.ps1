param([int]$port = 8000)
$root = Get-Location

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()
Write-Host "Serving at http://localhost:$port/ from $root"

$mimes = @{
    ".html" = "text/html"
    ".htm" = "text/html"
    ".css" = "text/css"
    ".js" = "application/javascript"
    ".svg" = "image/svg+xml"
    ".json" = "application/json"
    ".txt" = "text/plain"
}

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $request = $context.Request
        $localPath = [System.Uri]::UnescapeDataString($request.Url.LocalPath.TrimStart('/'))
        if ([string]::IsNullOrWhiteSpace($localPath)) { $localPath = "index.html" }
        $filePath = Join-Path -Path $root -ChildPath $localPath
        if (-not (Test-Path $filePath)) {
            $filePath = Join-Path -Path $root -ChildPath "index.html"
        }
        $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
        $contentType = $mimes[$ext]
        if (-not $contentType) { $contentType = "application/octet-stream" }
        $bytes = [System.IO.File]::ReadAllBytes($filePath)
        $response = $context.Response
        $response.ContentType = $contentType
        $response.ContentLength64 = $bytes.Length
        $response.OutputStream.Write($bytes, 0, $bytes.Length)
        $response.OutputStream.Close()
        $response.Close()
    } catch {
        Write-Warning $_.Exception.Message
        if ($context -and $context.Response) {
            try { $context.Response.StatusCode = 500; $context.Response.Close() } catch {}
        }
    }
}