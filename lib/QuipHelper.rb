module QuipHelper
  include HTTParty
  def import_quip(id)
    token = ENV["QUIP_TOKEN"]

    response = HTTParty.get("https://platform.quip.com/1/threads/#{id}",
                  headers: {
                    "Authorization" => "Bearer #{token}"
                  })
    
    begin
      json = JSON.parse(response.body)
      puts "Imported Quip Document: #{json['thread']['title']}"
      return json['html']
    rescue StandardError=>e
      "Error: #{e}"
    end
  end
end