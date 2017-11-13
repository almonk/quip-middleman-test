module QuipHelper
  include HTTParty
  def import_quip(id)
    token = ENV["QUIP_TOKEN"]

    response = HTTParty.get("https://platform.quip.com/1/threads/#{id}",
                  headers: {
                    "Authorization" => "Bearer #{token}"
                  })

    json = JSON.parse(response.body)

    return json['html']
  end
end