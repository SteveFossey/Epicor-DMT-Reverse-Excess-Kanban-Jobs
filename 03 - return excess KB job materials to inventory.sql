with availableKBs as (
select 
	l.MtlPartNum,
	l.ActQuantity - l.EstQuantity TranQty,
	ld.PayrollDate,
	pt.JobNum,
	row_number() over (partition by l.mtlpartnum, (l.ActQuantity - l.EstQuantity), ld.payrolldate order by pt.sysdate desc, pt.systime desc) rk



from
	Production.erp.JobClosingLog l									--for exceptions
	inner join Production.erp.JobMtl m								--for plant and opseq
		on m.PartNum = l.MtlPartNum
		and m.JobNum = l.JobNum
		and m.AssemblySeq = l.AssemblySeq
		and m.MtlSeq = l.JobSeq
	inner join production.dbo.PartPlant pp							--for KB flag
		on pp.PartNum = l.MtlPartNum
		and pp.Plant = m.Plant
		and pp.KanbanPart_c = '1'
	inner join Production.erp.LaborDtl ld							--for material issue date
		on ld.JobNum = l.jobnum
		and ld.OprSeq = m.RelatedOperation
		and (ld.OpCode like '%011' or ld.OpCode like '%012')
	left join Production.erp.PartTran pt							--for KB jobs
		on (pt.TranDate >= dateadd(d,-2,ld.PayrollDate) or pt.TranDate <= dateadd(d,2,ld.PayrollDate) )
		and pt.PartNum = l.MtlPartNum
		and pt.TranQty = (l.ActQuantity - l.EstQuantity)
		and pt.TranType = 'MFG-STK'

where
	l.AuditSource = 'JobCompletion'
	and l.EstQuantity < l.ActQuantity
	and pt.JobNum is not null
)

select
	'CompanyID' Company,
	k.JobNum FromJobNum,
	m.AssemblySeq FromAssemblySeq,
	m.MtlSeq FromJobSeq,
	m.PartNum,
	m.IssuedQty TranQty,
	m.IUM UM
from
	availableKBs k
	inner join Production.erp.JobMtl m
		on m.JobNum = k.JobNum
where
	k.rk = 1