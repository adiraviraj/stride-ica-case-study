SELECT
  COUNT(DISTINCT(attribute_value)) AS DAU,
  DATE(block_timestamp) AS timestamp
FROM `immaculate-355716.osmosis_1.event_attributes` ea
LEFT JOIN `immaculate-355716.osmosis_1.blocks` b 
ON b.block_height = CAST(ea.block_height AS STRING)
WHERE ea.event_type = 'ibc_transfer'
  AND attribute_key = 'sender'
GROUP BY 2
ORDER BY 2 DESC