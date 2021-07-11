## Connect to Elasticsearch Cluster
```
kubectl port-forward elasticsearch-0 9200:9200 -n elk-stack-ns
kubectl port-forward svc/es 9200:9200 -n elk-stack-ns
```
Test Commands
```
curl -XGET http://localhost:9200
curl -XGET http://localhost:9200/_cluster/health?pretty
curl -XGET 'http://localhost:9200/_cluster/health?level=indices&pretty'
curl -XGET http://localhost:9200/_cat/nodes?v
curl -XGET http://localhost:9200/_cat/master?v
curl -XGET http://localhost:9200/_cat/count?v
curl -XGET http://localhost:9200/_cat/shards?v
curl -XGET http://localhost:9200/_cat/allocation?v
curl -X GET 'http://localhost:9200/_cat/indices?v'
```
