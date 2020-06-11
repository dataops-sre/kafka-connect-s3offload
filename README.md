KAFKA-CONNECT-S3OFFLOAD
===
# Summary
This project contains configurations based on Kafka-Connect Framework and utilizes officially S3-Connector (by Confluent) to offload KAKFA topic to aws s3.

# Deployment
CI/CD pipeline defined in .gitlab-ci.yaml.

Deploy on local minikube:
```bash
task run.local
```

# Monitoring

## Monitored JMX Metrics
We expose following JMX metrics defined by Kafka-Connect Framework: `kafka-connect-helm/monitoring/custom_metrics.yaml`

(!) Datadog agent can only fetch 350 metrics per container. We are defining ca 20 metrics, but keep in mind that they are multiplied by worker and task.
To fetch all metrics we need to run the connector in a POD/CONTAINER_TASK Combination that does not exceed 350 metrics per container:
- for our regular daily processing we run on one pod with number of "tasks.max":"1" (see connector config)
- for reprocessing entire history we run on 5 pods with "tasks.max":"4"


Description of Kafka Connect metrics: https://cwiki.apache.org/confluence/display/KAFKA/KIP-196%3A+Add+metrics+to+Kafka+Connect+framework

Metrics are available in Datadog under metric name `jmx.kafka.connect.<metric-name>`. Metrics must be distinguished via tags
