from elasticsearch import Elasticsearch

client = Elasticsearch(basic_auth=('risto', 'RI100x4kdyf7!^h'),
                       hosts=[
                           'https://search-tracardi-es-0001-cdb78cd-yawkcekmzirtv6bae55htbqaii.eu-central-1.es.amazonaws.com:443'])
client.info()
