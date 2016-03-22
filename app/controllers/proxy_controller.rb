class ProxyController < ApplicationController
  def get_image
    url = URI.parse(params[:url] || "")
    callback = params[:callback]

    response = Net::HTTP.start(url.host, use_ssl: true, verify_mode: OpenSSL::SSL::VERIFY_NONE) do |http|
      http.get url.request_uri
    end

    bin_body = response.body

    base64 = [bin_body].pack("m0")
    responseData = 'data:' + response.header.content_type + ';base64,' + base64

    output = "#{callback}(#{responseData.to_json})"
    send_data output, type: 'application/javascript', disposition: 'inline'
  end
end