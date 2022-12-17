-- number of ICA transfers over time per day
SELECT
  ea.block_height,
  date(block_timestamp) AS timestamp,
  attribute_value
FROM (SELECT DISTINCT block_height, tx_id, event_type, attribute_key, attribute_index, event_index, attribute_value FROM `immaculate-355716.stride_1.event_attributes`) ea
INNER JOIN (SELECT DISTINCT block_height, block_timestamp FROM `immaculate-355716.stride_1.blocks`) b 
ON ea.block_height = cast(b.block_height AS int64)
WHERE attribute_key = 'packet_src_port'
	AND attribute_value LIKE 'icacontroller%'
	AND attribute_value NOT LIKE '%WITHDRAWAL'
	AND attribute_value NOT LIKE '%FEE'
	AND event_type = 'send_packet'
ORDER BY 1 DESC
