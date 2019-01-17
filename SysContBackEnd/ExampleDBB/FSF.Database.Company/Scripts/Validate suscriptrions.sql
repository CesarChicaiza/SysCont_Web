
--Valida si todas los contratos tienen regla de pago recurrente
select a.Id, b.Id, b.PhysicalNumber, b.CreatedDate
from [Contract_RecurringPaymentRule] a
right join [Contract] b on a.contract_id = b.id
where a.id  is null




