local resty_sha256 = require 'resty.sha256'
local resty_string = require 'resty.string'

local function main()
    local req_body = nil
    -- get reqiest body
    ngx.req.read_body()
    local mem_data = ngx.req.get_body_data()
    if mem_data then
        req_body = mem_data
    end

    local file_data = ngx.req.get_body_file()
    if (not req_body) and file_data then
        req_body = file_data
    end

    if not req_body then
	ngx.status = 400
	ngx.log(ngx.ERR, 'Got nil Request body from client!')
        ngx.say("Bad Request. Request body is required!")
	return
    end

    -- generate sha256 hash
    local sha256 = resty_sha256:new()
    sha256:update(req_body)
    local hash = resty_string.to_hex(sha256:final())
    ngx.log(ngx.ERR, string.format('req_body: %s, sha256 hex: %s', string.sub(req_body, 1, 512), hash))
    ngx.say(hash)
end
     
main()
