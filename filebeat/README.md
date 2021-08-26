# Filebeat

## Ship logs from Kubernetes to Elasticsearch

### Kubernetes DaemonSet


Also, filebeat-daemonset.yaml uses a set of environment
variables to configure Elasticsearch output:

Variable | Default | Description
-------- | ------- | -----------
ELASTICSEARCH_HOST | elasticsearch | Elasticsearch host
ELASTICSEARCH_PORT | 9200 | Elasticsearch port
ELASTICSEARCH_USERNAME | elastic | Elasticsearch username for HTTP auth
ELASTICSEARCH_PASSWORD | changeme | Elasticsearch password

If there is an existing `elasticsearch` service in the kubernetes cluster these
defaults will use it.
