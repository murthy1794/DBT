SELECT 
    customer_id, 
    account_id,
    account_type,
    current_balance,
    minimum_balance AS total_minimum_balance,
    account_status
FROM {{source('source','accounts')}}
WHERE account_status = 'ACTIVE' 
  AND minimum_balance > 5000;