SET 'ksql.query.pull.table.scan.enabled'='true';
SET 'auto.offset.reset'='earliest';

CREATE STREAM orders_stream WITH (KAFKA_TOPIC='debezium.Order.sr', VALUE_FORMAT='JSON_SR');

SELECT * FROM orders_stream WHERE GEO_DISTANCE(lat,lon, 37.75680, -122.44469) < 6.5 EMIT CHANGES;
