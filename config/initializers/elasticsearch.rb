require 'elasticsearch/model'
elasticsearch_url = "http://elasticsearch:9200"
Elasticsearch::Model.client = Elasticsearch::Client.new(
    url: elasticsearch_url,
    log:true, 
    transport_options: {
        request: {timeout: 5}
    }
)