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

## Connect to Kibana
```
kubectl port-forward deployment/kibana-deployment 5601:5601 -n elk-stack-ns
```
Open Browser and surf `http://localhost:5601/app/home#/` or `http://localhost:5601/app/kibana`

### Troubleshooting
* Clean Kibana Index
```
curl -XDELETE http://localhost:9200/.kibana
curl -XDELETE 'http://localhost:9200/.kibana*'
curl -XDELETE http://localhost:9200/.kibana_2
curl -XDELETE http://localhost:9200/.kibana_1
```

### Reference Links
* https://rancher.com/blog/2018/2018-11-22-deploying-elasticsearch/
* https://blog.knoldus.com/deploying-elasticsearch-on-kubernetes/
* https://www.digitalocean.com/community/tutorials/how-to-set-up-an-elasticsearch-fluentd-and-kibana-efk-logging-stack-on-kubernetes
