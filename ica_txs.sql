-- number of ICA transfers over time per day

SELECT
  block_height,
  ingestion_timestamp,
  attribute_value
FROM `immaculate-355716.stride_1.event_attributes`
WHERE attribute_key = 'packet_src_port'
	AND attribute_value LIKE 'icacontroller%'
	AND attribute_value NOT IN ('%WITHDRAWAL', '%FEE')
	AND event_type = 'send_packet'
ORDER BY 2 DESC
