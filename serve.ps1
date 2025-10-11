$port = 8000
$prefix = "http://localhost:$port/"
$root = (Resolve-Path ".").Path

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)
$listener.Start()
Write-Host "Server running at $prefix serving $root"

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $relPath = $request.Url.AbsolutePath.TrimStart('/')
        if ([string]::IsNullOrWhiteSpace($relPath)) { $relPath = 'index.html' }
        $fullPath = Join-Path $root $relPath

        if (Test-Path $fullPath -PathType Leaf) {
            $bytes = [System.IO.File]::ReadAllBytes($fullPath)
            $ext = [System.IO.Path]::GetExtension($fullPath).ToLowerInvariant()
            $contentType = switch ($ext) {
                ".html" { "text/html" }
                ".htm"  { "text/html" }
                ".css"  { "text/css" }
                ".js"   { "application/javascript" }
                ".json" { "application/json" }
                ".svg"  { "image/svg+xml" }
                ".png"  { "image/png" }
                ".jpg"  { "image/jpeg" }
                ".jpeg" { "image/jpeg" }
                ".ico"  { "image/x-icon" }
                default  { "application/octet-stream" }
            }
            $context.Response.ContentType = $contentType
            $context.Response.ContentLength64 = $bytes.Length
            $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $context.Response.StatusCode = 404
            $msg = "Not Found"
            $buf = [Text.Encoding]::UTF8.GetBytes($msg)
            $context.Response.OutputStream.Write($buf, 0, $buf.Length)
        }
        $context.Response.OutputStream.Close()
        $context.Response.Close()
    }
}
finally {
    $listener.Stop()
    $listener.Close()
}