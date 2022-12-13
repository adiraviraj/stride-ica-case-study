-- this script queries the number of timeouts occured on ICA channels
SELECT
DATE(b.block_timestamp) AS timestamp,
ea.attribute_value
FROM `immaculate-355716.stride_1.event_attributes` ea
INNER JOIN `immaculate-355716.stride_1.blocks` b
ON CAST(ea.block_height AS STRING) = b.block_height
WHERE event_type = 'timeout_packet'
  AND attribute_key = 'packet_src_port'
  AND attribute_value LIKE 'icacontroller%'
ORDER BY 1 DESC