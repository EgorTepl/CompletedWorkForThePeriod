set statistics io on
set statistics time on
GO
--=======================================PRINTOUTTABLE_RU
SELECT
	prot.RECID AS RecId,
	prot.DOCUMENTID AS DocumentId, -- Номер документа
	prot.DOCUMENTDATE AS DocumentDate, -- Дата
	prot.JOURNALTYPE AS JournalType, -- Вид СО/операции
	il.HRMORGANIZATIONID AS HrmOrganizationId, -- Код подразделения
	rphorg.PARENTORGANIZATIONID AS ParentOrganizationId, -- РУС
	ui.NAME AS ResponsibleWorkerName -- Ответственный
FROM PRINTOUTTABLE_RU AS prot
INNER JOIN INVENTLOCATION AS il
	ON prot.INVENTLOCATIONID = il.INVENTLOCATIONID
LEFT JOIN RPAYHRMORGANIZATION AS rphorg
	ON il.HRMORGANIZATIONID = rphorg.HRMORGANIZATIONID
LEFT JOIN VENDPACKINGSLIPJOUR AS vpsj
	ON prot.REFRECID = vpsj.RECID
LEFT JOIN USERINFO AS ui
	ON vpsj.CREATEDBY = ui.ID
WHERE	
	prot.VOIDED = 0
	AND prot.ORIGINALDOCUMENTTYPE = 0
	AND YEAR(prot.DOCUMENTDATE) != 1900
	
GO
--=======================================SSMJOBTICKETTABLE_AllJobTicket
SELECT
	jtt.RECID AS RecId,
	jtt.JOBTICKETTYPE AS JobTicketType, -- Тип операции
	jtt.JOBTICKETNUMBER AS JobTicketNumber, -- Номер документа
	jtt.STATUS AS Status, -- Статус по документу
	jtt.CLOSEDATETIME AS CloseDateTime, -- Дата
	jtt.REPAIROBJECT AS RepairObject, -- Объект ремонта/выпуска
	o.DESCRIPTION AS Description, -- описание
	it.NAMEALIAS AS NameAlias, -- описание
	o.FACTORYID AS FactoryId, -- Номер
	jtt.INVENTSERIALID AS InventSerialId, -- Номер
	jtt.INVENTBATCHID AS InventBatchId, -- Номер
	jtt.SERVICEKINDID AS ServiceKindId, -- Вид СО/операции
	wlocadv.NAME AS ManufactoryName_RepairItem, -- Цех
	jtt.RPAYHRMORGANIZATIONID AS RPayHrmOrganizationId, -- Код подразделения
	rhorg.PARENTORGANIZATIONID AS ParentOrganizationId, -- РУС
	jtt.CLOSEWORKER AS CloseWorker, -- Id Ответственного для всех ЗН
	dpt1.NAME AS ResponsibleWorker_CloseWorkerIsNotNull, -- Ответственный для ЗН, если CLOSEWORKER != ''
	dpt2.NAME AS ResponsibleWorker_CloseWorkerIsNull, -- Ответственный для всех ЗН, если CLOSEWORKER = ''
	jtt.QTY AS Qty, -- Количество по документу
	jtt.UNITID AS UnitId, -- Единица измерения
	jtt.REPAIREDCOUNT AS RepairedCount, -- Отремонтировано/Изготовлено
	jtt.WORKCENTERID AS WorkCenterId -- поле сортировки
FROM SSMJOBTICKETTABLE AS jtt
LEFT JOIN SSMOBJECTS AS o -- описание/номер
	ON jtt.REPAIROBJECT = o.OBJECTID
LEFT JOIN INVENTTABLE AS it -- описание
	ON jtt.REPAIROBJECT = it.ITEMID
LEFT JOIN WMSLOCATIONADVHOLD AS wlocadv -- Цех
	ON jtt.WMSLOCATIONADVHOLDID = wlocadv.LOCATIONID
LEFT JOIN RPAYHRMORGANIZATION AS rhorg -- РУС
	ON jtt.RPAYHRMORGANIZATIONID = rhorg.HRMORGANIZATIONID
LEFT JOIN
(
	HCMWORKER AS hw1
	INNER JOIN DIRPARTYTABLE AS dpt1
		ON hw1.PERSON = dpt1.RECID
) -- Ответственный
	ON jtt.CLOSEWORKER = hw1.RECID
LEFT JOIN
(
	HCMWORKER AS hw2
	INNER JOIN DIRPARTYTABLE AS dpt2
		ON hw2.PERSON = dpt2.RECID
) -- Ответственный
	ON jtt.RESPONSIBLEWORKER = hw2.RECID
WHERE
	jtt.STATUS IN (0, 1, 2)
	AND YEAR(jtt.CLOSEDATETIME) != 1900
	AND jtt.RPAYHRMORGANIZATIONID != N''
ORDER BY jtt.WORKCENTERID

GO
-- ЦЕХ
SELECT 
	wc.WORKCENTERID AS WorkCenterId,
	wlocadv.NAME AS ManufactoryName_RepairLocomotive -- Цех
FROM SSMWORKCENTERWAREHOUSES AS wcw
INNER JOIN WMSLOCATIONADVHOLD AS wlocadv
	ON wcw.WMSLOCATIONADVHOLDID = wlocadv.LOCATIONID
INNER JOIN SSMWORKCENTER AS wc
	ON wcw.WORKCENTER = wc.RECID
GROUP BY
	wc.WORKCENTERID
	, wlocadv.NAME
ORDER BY wc.WORKCENTERID

GO
--=======================================SSMJOBTICKETTABLE_Testing
SELECT
	jtt.RECID AS RecId,
	jtt.JOBTICKETTYPE AS JobTicketType, -- Тип операции
	jtt.JOBTICKETNUMBER AS JobTicketNumber, -- Номер документа
	jtt.STATUS AS Status, -- Статус по документу
	jtt.TESTINGDATE AS TestingDate, -- Дата
	jtt.REPAIROBJECT AS RepairObject, -- Объект ремонта/выпуска
	o.DESCRIPTION AS Description, -- описание
	it.NAMEALIAS AS NameAlias, -- описание
	o.FACTORYID AS FactoryId, -- Номер
	jtt.INVENTSERIALID AS InventSerialId, -- Номер
	jtt.INVENTBATCHID AS InventBatchId, -- Номер
	wlocadv.NAME AS ManufactoryName_RepairItem, -- Цех
	jtt.RPAYHRMORGANIZATIONID AS RPayHrmOrganizationId, -- Код подразделения
	rhorg.PARENTORGANIZATIONID AS ParentOrganizationId, -- РУС
	dpt.NAME AS ResponsibleWorker_Testing, -- Ответственный для испытаний (TestingDate <> '') записи создаются дополнительно
	jtt.QTY AS Qty, -- Количество по документу
	jtt.UNITID AS UnitId, -- Единица измерения
	jtt.REPAIREDCOUNT AS RepairedCount, -- Отремонтировано/Изготовлено
	jtt.WORKCENTERID AS WorkCenterId -- поле сортировки
FROM SSMJOBTICKETTABLE AS jtt
LEFT JOIN SSMOBJECTS AS o -- описание/номер
	ON jtt.REPAIROBJECT = o.OBJECTID
LEFT JOIN INVENTTABLE AS it -- описание
	ON jtt.REPAIROBJECT = it.ITEMID
LEFT JOIN WMSLOCATIONADVHOLD AS wlocadv -- Цех
	ON jtt.WMSLOCATIONADVHOLDID = wlocadv.LOCATIONID
LEFT JOIN RPAYHRMORGANIZATION AS rhorg -- РУС
	ON jtt.RPAYHRMORGANIZATIONID = rhorg.HRMORGANIZATIONID
LEFT JOIN -- Ответственный
(
	HCMWORKER AS hw
	INNER JOIN DIRPARTYTABLE AS dpt
		ON hw.PERSON = dpt.RECID
)
	ON jtt.TESTINGRESPONSIBLEWORKER = hw.RECID
WHERE
	jtt.STATUS IN (0, 1, 2)
	AND YEAR(jtt.TESTINGDATE) != 1900
	AND jtt.RPAYHRMORGANIZATIONID != N''
ORDER BY jtt.WORKCENTERID

GO
--=======================================SSMJOBTICKETTABLE_RepairConfirm
SELECT
	jtt.RECID AS RecId,
	jtt.JOBTICKETTYPE AS JobTicketType, -- Тип операции
	jtt.JOBTICKETNUMBER AS JobTicketNumber, -- Номер документа
	jtt.STATUS AS Status, -- Статус по документу
	jtt.REPAIRCONFIRMDATE AS RepairConfirmDate, -- Дата
	jtt.REPAIROBJECT AS RepairObject, -- Объект ремонта/выпуска
	o.DESCRIPTION AS Description, -- описание
	it.NAMEALIAS AS NameAlias, -- описание
	o.FACTORYID AS FactoryId, -- Номер
	jtt.INVENTSERIALID AS InventSerialId, -- Номер
	jtt.INVENTBATCHID AS InventBatchId, -- Номер
	wlocadv.NAME AS ManufactoryName_RepairItem, -- Цех
	jtt.RPAYHRMORGANIZATIONID AS RPayHrmOrganizationId, -- Код подразделения
	rhorg.PARENTORGANIZATIONID AS ParentOrganizationId, -- РУС
	dpt.NAME AS ResponsibleWorker_RepairConfirm, -- Ответственный для контроля ремонта (RepairConfirmDate <> '') записи создаются дополнительно
	jtt.QTY AS Qty, -- Количество по документу
	jtt.UNITID AS UnitId, -- Единица измерения
	jtt.REPAIREDCOUNT AS RepairedCount, -- Отремонтировано/Изготовлено
	jtt.WORKCENTERID AS WorkCenterId -- поле сортировки
FROM SSMJOBTICKETTABLE AS jtt
LEFT JOIN SSMOBJECTS AS o -- описание/номер
	ON jtt.REPAIROBJECT = o.OBJECTID
LEFT JOIN INVENTTABLE AS it -- описание
	ON jtt.REPAIROBJECT = it.ITEMID
LEFT JOIN WMSLOCATIONADVHOLD AS wlocadv -- Цех
	ON jtt.WMSLOCATIONADVHOLDID = wlocadv.LOCATIONID
LEFT JOIN RPAYHRMORGANIZATION AS rhorg -- РУС
	ON jtt.RPAYHRMORGANIZATIONID = rhorg.HRMORGANIZATIONID
LEFT JOIN -- Ответственный
(
	HCMWORKER AS hw
	INNER JOIN DIRPARTYTABLE AS dpt
		ON hw.PERSON = dpt.RECID
)
	ON jtt.REPAIRCONFIRMRESPONSIBLEWORKER = hw.RECID
WHERE
	jtt.STATUS IN (0, 1, 2)
	AND YEAR(jtt.REPAIRCONFIRMDATE) != 1900
	AND jtt.RPAYHRMORGANIZATIONID != N''
ORDER BY jtt.WORKCENTERID

GO
--=======================================INVENTJOURNALTABLE
-- СПЕЦИФИКАЦИЯ
SELECT
	ijt.RECID AS RecId,
	ijn.DESCRIPTION	AS Description, -- тип операции
	ijt.JOURNALID AS JournalId, -- номер документа
	ijt.POSTED AS Posted, -- статус по документу
	ijt.TRANSDATE AS TransDate, -- дата
	invjtr.ITEMID AS ItemId, -- объект ремонта/выпуска
	it.NAMEALIAS AS NameAlias, -- описание
	invd1.INVENTSERIALID AS InventSerialId, -- номер
	invd1.INVENTBATCHID AS InventBatchId, -- номер
	ijt.JOURNALNAMEID AS JournalNameId, -- Вид СО/операции
	wloc.NAME AS ManufactoryName, -- Цех
	ijt.HRMORGANIZATIONID AS HrmOrganizationId, -- Код подразделения
	horg.PARENTORGANIZATIONID AS ParentOrganizationId, -- РУС
	ui.NAME AS ResponsibleWorkerName, -- Ответственный
	invjtr.QTY AS Qty, -- Количество по документу / Отремонтировано/Изготовлено
	itm.UNITID AS UnitId -- Единица измерения
FROM INVENTJOURNALTABLE AS ijt
LEFT JOIN INVENTJOURNALNAME AS ijn -- тип операции
	ON ijt.JOURNALNAMEID = ijn.JOURNALNAMEID
LEFT JOIN INVENTJOURNALTRANS AS invjtr -- объект ремонта/выпуска
	ON (ijt.JOURNALID = invjtr.JOURNALID) AND (invjtr.BOMLINE = 0)
LEFT JOIN INVENTTABLE AS it -- описание
	ON invjtr.ITEMID = it.ITEMID
LEFT JOIN INVENTDIM AS invd1 -- номер
	ON invjtr.INVENTDIMID = invd1.INVENTDIMID
LEFT JOIN INVENTDIM AS invd2 -- Цех
	ON ijt.INVENTDIMID = invd2.INVENTDIMID
LEFT JOIN WMSLOCATIONADVHOLD AS wloc -- Цех
	ON invd2.EMPLOYEEID_RU = wloc.LOCATIONID
LEFT JOIN RPAYHRMORGANIZATION AS horg -- РУС
	ON ijt.HRMORGANIZATIONID = horg.HRMORGANIZATIONID
LEFT JOIN USERINFO AS ui -- ответственный
	ON (ijt.CREATEDBY = ui.ID)
LEFT JOIN INVENTTABLEMODULE AS itm -- Единица измерения
	ON (invjtr.ITEMID = itm.ITEMID) AND (itm.MODULETYPE = 0)
WHERE
	ijt.JOURNALTYPE = 3
	AND ((ijt.STORNO_RU = 0) AND (ijt.STORNEDJOURNALID = N''))
	AND YEAR(ijt.TRANSDATE) != 1900
	AND ijt.HRMORGANIZATIONID != N''
GO
-- ПЕРЕНОС
SELECT
	ijt.RECID AS RecId,
	ijt.JOURNALID AS JournalId, -- номер документа
	ijt.POSTED AS Posted, -- статус по документу
	ijt.TRANSDATE AS TransDate, -- дата
	ijt.JOURNALNAMEID AS JournalNameId, -- Вид СО/операции
	wloc_from.NAME AS ManufactoryName_From, -- Цех
	wloc_to.NAME AS ManufactoryName_To, -- Цех																
	iloc_from.HRMORGANIZATIONID	AS HrmOrganizationId_From, -- Код подразделения/фильтр подразделения
	iloc_to.HRMORGANIZATIONID AS HrmOrganizationId_To, -- Код подразделения/фильтр подразделения
	horg_from.PARENTORGANIZATIONID AS ParentOrganizationId_From,-- РУС
	horg_to.PARENTORGANIZATIONID AS ParentOrganizationId_To, -- РУС
	ui1.NAME AS ResponsibleWorkerName_From, -- Ответственный_откуда
	dpt.NAME AS ResponsibleWorkerName_To, -- Ответственный_куда
	ijts.HCMWORKER AS HcmWorker, -- если HcmWorker = '', то ищем по таблице USERINFO
	ui2.NAME AS ResponsibleWorkerName_To_UserInfo -- Ответственный_куда
FROM INVENTJOURNALTABLE AS ijt
LEFT JOIN INVENTDIM AS invd_from -- исходное место хранения
	ON ijt.INVENTDIMID = invd_from.INVENTDIMID
LEFT JOIN INVENTDIM AS invd_to -- конечное место хранения
	ON ijt.TOINVENTDIMID = invd_to.INVENTDIMID
LEFT JOIN WMSLOCATIONADVHOLD AS wloc_from -- цех
	ON invd_from.EMPLOYEEID_RU = wloc_from.LOCATIONID 
LEFT JOIN WMSLOCATIONADVHOLD AS wloc_to --цех
	ON invd_to.EMPLOYEEID_RU = wloc_to.LOCATIONID 
LEFT JOIN INVENTLOCATION AS iloc_from -- код подразделения
	ON invd_from.INVENTLOCATIONID = iloc_from.INVENTLOCATIONID
LEFT JOIN INVENTLOCATION AS iloc_to -- код подразделения
	ON invd_to.INVENTLOCATIONID = iloc_to.INVENTLOCATIONID
LEFT JOIN USERINFO AS ui1 -- Ответственный откуда
	ON ijt.CREATEDBY = ui1.ID
LEFT JOIN USERINFO AS ui2 -- Ответственный куда
	ON ijt.POSTEDUSERID = ui2.ID
LEFT JOIN INVENTJOURNALTABLESIGNATURE AS ijts -- Ответственный куда
	ON (ijt.JOURNALID = ijts.JOURNALID) AND (ijts.SIGNATURETYPE = 2)
LEFT JOIN HCMWORKER AS hw -- Ответственный куда
	ON ijts.HCMWORKER = hw.RECID
LEFT JOIN DIRPARTYTABLE AS dpt -- Ответственный куда
	ON hw.PERSON = dpt.RECID
LEFT JOIN RPAYHRMORGANIZATION AS horg_from -- РУС
	ON ijt.HRMORGANIZATIONID = horg_from.HRMORGANIZATIONID
LEFT JOIN RPAYHRMORGANIZATION AS horg_to -- РУС
	ON ijt.HRMORGANIZATIONIDTO = horg_to.HRMORGANIZATIONID 	
WHERE
	ijt.JOURNALTYPE = 2
	AND ((ijt.STORNO_RU = 0) AND (ijt.STORNEDJOURNALID = N''))
	AND (invd_from.EMPLOYEEID_RU != invd_to.EMPLOYEEID_RU)
	AND (YEAR(ijt.TRANSDATE) != 1900)
GO
-- ПРОВОДКА
SELECT 
	ijt.RECID AS RecId,
	ijn.DESCRIPTION AS Description, -- тип операции
	ijt.JOURNALID AS JournalId, -- номер документа
	ijt.POSTED AS Posted, -- статус по документу
	ijt.TRANSDATE AS TransDate, -- дата
	ijt.JOURNALNAMEID AS JournalNameId, -- Вид СО/операции
	wloc.NAME AS ManufactoryName, -- Цех
	ijt.HRMORGANIZATIONID AS HrmOrganizationId, -- Код подразделения/фильтр подразделения
	ijt.POSTEDHRMORGANIZATIONID AS PostedHrmOrganizationId, -- Код подразделения/фильтр подразделения
	horg1.PARENTORGANIZATIONID AS ParentOrganizationId_PostedHrmOrgId, -- РУС
	horg2.PARENTORGANIZATIONID AS ParentOrganizationId_HrmOrgId, -- РУС
	ui.NAME AS ResponsibleWorkerName -- Ответственный
FROM INVENTJOURNALTABLE AS ijt
LEFT JOIN INVENTJOURNALNAME AS ijn -- Тип операции
	ON ijt.JOURNALNAMEID = ijn.JOURNALNAMEID
LEFT JOIN INVENTDIM AS invd -- Цех
	ON ijt.INVENTDIMID = invd.INVENTDIMID
LEFT JOIN WMSLOCATIONADVHOLD AS wloc -- Цех
	ON invd.EMPLOYEEID_RU = wloc.LOCATIONID
LEFT JOIN RPAYHRMORGANIZATION AS horg1 -- РУС по подразделению ответственного сотрудника
	ON ijt.POSTEDHRMORGANIZATIONID = horg1.HRMORGANIZATIONID
LEFT JOIN RPAYHRMORGANIZATION AS horg2 -- РУС по подразделению склада из документа
	ON ijt.HRMORGANIZATIONID = horg2.HRMORGANIZATIONID
LEFT JOIN USERINFO AS ui -- Ответственный
	ON ijt.CREATEDBY = ui.ID
WHERE
	ijt.JOURNALTYPE = 0 
	AND ((ijt.STORNO_RU = 0) AND (ijt.STORNEDJOURNALID = N''))
	AND YEAR(ijt.TRANSDATE) != 1900

