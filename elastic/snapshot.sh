curl -X PUT "localhost:9200/_snapshot/tracardi_backup?pretty" -H 'Content-Type: application/json' -d' { "type": "fs", "settings": { "location": "/usr/share/elasticsearch/data/snapshot", "compress": true } }'
curl -X PUT "localhost:9200/_snapshot/tracardi_backup/snapshot-0?pretty"
curl -X GET "localhost:9200/_snapshot/tracardi_backup/snapshot-0?pretty"
curl -X DELETE "localhost:9200/_snapshot/tracardi_backup/snapshot-0?pretty"
curl -X GET "localhost:9200/_snapshot/tracardi_backup/_all?pretty"