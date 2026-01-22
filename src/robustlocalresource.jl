
"""
`RobustLocalResource(url, path, [html_attributes]; [cache] )`
Tries to access file from path.
If file is not present or empty, then attempts to download file (unless cache is set to false).
"""
function RobustLocalResource(
    url::AbstractString, path::AbstractString, html_attributes::Pair...; cache::Bool=true
)
    if !(contains(url, r"^http") || contains(url, r"^ftp")) &&
        (contains(path, r"^http") || contains(path, r"^ftp"))
        @warn "It looks like call to RobustLocalResource has incorrect order of url and path."
        url, path = path, url
    end

    if isfile(path) && filesize(path) > 0
        return LocalResource(path, html_attributes...)
    elseif cache
        mkpath(dirname(path))
        download(url, path)
        LocalResource(path, html_attributes...)
    else
        Resource(url, html_attributes...)
    end
end
