

select 
	'CompanyID' Company,
	l.MtlPartNum PartNum,
	l.ActQuantity - l.EstQuantity TranQty,
	m.IUM UM,
	l.JobNum FromJobNum,
	l.AssemblySeq FromAssemblySeq,
	l.JobSeq FromJobSeq,
	w.Plant,
	w.WarehouseCode ToWarehouseCode,
	w.PrimBin ToBinNum
from
	Production.erp.JobClosingLog l
	inner join Production.erp.JobMtl m
		on m.PartNum = l.MtlPartNum
		and m.JobNum = l.JobNum
		and m.AssemblySeq = l.AssemblySeq
		and m.MtlSeq = l.JobSeq
	inner join production.dbo.PartPlant pp
		on pp.PartNum = l.MtlPartNum
		and pp.Plant = m.Plant
		and pp.KanbanPart_c = '1'
	inner join Production.erp.PlantWhse w
		on w.PartNum = l.MtlPartNum
		and w.Plant = m.Plant
		and w.WarehouseCode like '%001'

where
	l.AuditSource = 'JobCompletion'
	and l.EstQuantity < l.ActQuantity