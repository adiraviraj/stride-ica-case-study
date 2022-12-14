
-- this script queries the amount of tokens bonded per denom per day
SELECT
  DATE(b.block_timestamp) AS timestamp,
  CAST(SPLIT(ea2.attribute_value, 'st')[ordinal(1)] AS INT64) / POWER(10, 6) AS amount,
  SPLIT(ea2.attribute_value, 'stu')[ordinal(2)] AS denom
FROM `immaculate-355716.stride_1.event_attributes` ea
INNER JOIN `immaculate-355716.stride_1.event_attributes` ea2
ON ea.tx_id = ea2.tx_id
INNER JOIN `immaculate-355716.stride_1.blocks` b
ON CAST(ea.block_height AS STRING) = b.block_height
WHERE ea.attribute_value IN ('/Stridelabs.stride.stakeibc.MsgLiquidStake', '/stride.stakeibc.MsgLiquidStake') -- to filter for liquid stake txs on stride
  AND ea2.event_type = 'coin_received'
  AND ea2.attribute_key = 'amount'
  AND ea2.event_index = 11
ORDER BY 1 DESC
