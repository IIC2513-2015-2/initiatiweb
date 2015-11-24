class OpenDocumentService

  def initialize
    @connection = Faraday.new(url: 'http://datos.gob.cl/')
  end

  def get_documents_for(category, max = nil)
    response = @connection.get('/api/3/action/group_package_show', id: category)
    if response.success?
      json = JSON.parse(response.body)
      resources = []
      (json['result'] || []).map { |item| item['resources'] }.flatten.each do |resource|
        break if max && resources.size >= max
        resources << resource unless resource['name'].blank?
      end
      resources
    end
  rescue
    # respuesta nil para cualquier error
  end
end
