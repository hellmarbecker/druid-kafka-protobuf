curl -X POST -H "Content-Type: application/json" --data '{
  "name": "datagen-avro-clickstream",
  "config": {
    "connector.class": "io.confluent.kafka.connect.datagen.DatagenConnector",
    "kafka.topic": "clickstream-avro",
    "quickstart": "clickstream",
    "key.converter": "org.apache.kafka.connect.storage.StringConverter",
    "value.converter": "io.confluent.connect.avro.AvroConverter",
    "value.converter.schemas.enable": "false",
    "value.converter.schema.registry.url": "http://schema-registry:18081",
    "max.interval": 1000,
    "iterations": 10000000,
    "tasks.max": "1",
    "transforms": "SetSchemaMetadata",
    "transforms.SetSchemaMetadata.type": "org.apache.kafka.connect.transforms.SetSchemaMetadata$Value",
    "transforms.SetSchemaMetadata.schema.name": "clickstream_avro"
  }
}' http://localhost:18083/connectors
