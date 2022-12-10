set statistics io on
set statistics time on
GO
--=======================================PRINTOUTTABLE_RU
SELECT
	prot.RECID AS RecId,
	prot.DOCUMENTID AS DocumentId, -- ����� ���������
	prot.DOCUMENTDATE AS DocumentDate, -- ����
	prot.JOURNALTYPE AS JournalType, -- ��� ��/��������
	il.HRMORGANIZATIONID AS HrmOrganizationId, -- ��� �������������
	rphorg.PARENTORGANIZATIONID AS ParentOrganizationId, -- ���
	ui.NAME AS ResponsibleWorkerName -- �������������
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
	jtt.JOBTICKETTYPE AS JobTicketType, -- ��� ��������
	jtt.JOBTICKETNUMBER AS JobTicketNumber, -- ����� ���������
	jtt.STATUS AS Status, -- ������ �� ���������
	jtt.CLOSEDATETIME AS CloseDateTime, -- ����
	jtt.REPAIROBJECT AS RepairObject, -- ������ �������/�������
	o.DESCRIPTION AS Description, -- ��������
	it.NAMEALIAS AS NameAlias, -- ��������
	o.FACTORYID AS FactoryId, -- �����
	jtt.INVENTSERIALID AS InventSerialId, -- �����
	jtt.INVENTBATCHID AS InventBatchId, -- �����
	jtt.SERVICEKINDID AS ServiceKindId, -- ��� ��/��������
	wlocadv.NAME AS ManufactoryName_RepairItem, -- ���
	jtt.RPAYHRMORGANIZATIONID AS RPayHrmOrganizationId, -- ��� �������������
	rhorg.PARENTORGANIZATIONID AS ParentOrganizationId, -- ���
	jtt.CLOSEWORKER AS CloseWorker, -- Id �������������� ��� ���� ��
	dpt1.NAME AS ResponsibleWorker_CloseWorkerIsNotNull, -- ������������� ��� ��, ���� CLOSEWORKER != ''
	dpt2.NAME AS ResponsibleWorker_CloseWorkerIsNull, -- ������������� ��� ���� ��, ���� CLOSEWORKER = ''
	jtt.QTY AS Qty, -- ���������� �� ���������
	jtt.UNITID AS UnitId, -- ������� ���������
	jtt.REPAIREDCOUNT AS RepairedCount, -- ���������������/�����������
	jtt.WORKCENTERID AS WorkCenterId -- ���� ����������
FROM SSMJOBTICKETTABLE AS jtt
LEFT JOIN SSMOBJECTS AS o -- ��������/�����
	ON jtt.REPAIROBJECT = o.OBJECTID
LEFT JOIN INVENTTABLE AS it -- ��������
	ON jtt.REPAIROBJECT = it.ITEMID
LEFT JOIN WMSLOCATIONADVHOLD AS wlocadv -- ���
	ON jtt.WMSLOCATIONADVHOLDID = wlocadv.LOCATIONID
LEFT JOIN RPAYHRMORGANIZATION AS rhorg -- ���
	ON jtt.RPAYHRMORGANIZATIONID = rhorg.HRMORGANIZATIONID
LEFT JOIN
(
	HCMWORKER AS hw1
	INNER JOIN DIRPARTYTABLE AS dpt1
		ON hw1.PERSON = dpt1.RECID
) -- �������������
	ON jtt.CLOSEWORKER = hw1.RECID
LEFT JOIN
(
	HCMWORKER AS hw2
	INNER JOIN DIRPARTYTABLE AS dpt2
		ON hw2.PERSON = dpt2.RECID
) -- �������������
	ON jtt.RESPONSIBLEWORKER = hw2.RECID
WHERE
	jtt.STATUS IN (0, 1, 2)
	AND YEAR(jtt.CLOSEDATETIME) != 1900
	AND jtt.RPAYHRMORGANIZATIONID != N''
ORDER BY jtt.WORKCENTERID

GO
-- ���
SELECT 
	wc.WORKCENTERID AS WorkCenterId,
	wlocadv.NAME AS ManufactoryName_RepairLocomotive -- ���
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
	jtt.JOBTICKETTYPE AS JobTicketType, -- ��� ��������
	jtt.JOBTICKETNUMBER AS JobTicketNumber, -- ����� ���������
	jtt.STATUS AS Status, -- ������ �� ���������
	jtt.TESTINGDATE AS TestingDate, -- ����
	jtt.REPAIROBJECT AS RepairObject, -- ������ �������/�������
	o.DESCRIPTION AS Description, -- ��������
	it.NAMEALIAS AS NameAlias, -- ��������
	o.FACTORYID AS FactoryId, -- �����
	jtt.INVENTSERIALID AS InventSerialId, -- �����
	jtt.INVENTBATCHID AS InventBatchId, -- �����
	wlocadv.NAME AS ManufactoryName_RepairItem, -- ���
	jtt.RPAYHRMORGANIZATIONID AS RPayHrmOrganizationId, -- ��� �������������
	rhorg.PARENTORGANIZATIONID AS ParentOrganizationId, -- ���
	dpt.NAME AS ResponsibleWorker_Testing, -- ������������� ��� ��������� (TestingDate <> '') ������ ��������� �������������
	jtt.QTY AS Qty, -- ���������� �� ���������
	jtt.UNITID AS UnitId, -- ������� ���������
	jtt.REPAIREDCOUNT AS RepairedCount, -- ���������������/�����������
	jtt.WORKCENTERID AS WorkCenterId -- ���� ����������
FROM SSMJOBTICKETTABLE AS jtt
LEFT JOIN SSMOBJECTS AS o -- ��������/�����
	ON jtt.REPAIROBJECT = o.OBJECTID
LEFT JOIN INVENTTABLE AS it -- ��������
	ON jtt.REPAIROBJECT = it.ITEMID
LEFT JOIN WMSLOCATIONADVHOLD AS wlocadv -- ���
	ON jtt.WMSLOCATIONADVHOLDID = wlocadv.LOCATIONID
LEFT JOIN RPAYHRMORGANIZATION AS rhorg -- ���
	ON jtt.RPAYHRMORGANIZATIONID = rhorg.HRMORGANIZATIONID
LEFT JOIN -- �������������
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
	jtt.JOBTICKETTYPE AS JobTicketType, -- ��� ��������
	jtt.JOBTICKETNUMBER AS JobTicketNumber, -- ����� ���������
	jtt.STATUS AS Status, -- ������ �� ���������
	jtt.REPAIRCONFIRMDATE AS RepairConfirmDate, -- ����
	jtt.REPAIROBJECT AS RepairObject, -- ������ �������/�������
	o.DESCRIPTION AS Description, -- ��������
	it.NAMEALIAS AS NameAlias, -- ��������
	o.FACTORYID AS FactoryId, -- �����
	jtt.INVENTSERIALID AS InventSerialId, -- �����
	jtt.INVENTBATCHID AS InventBatchId, -- �����
	wlocadv.NAME AS ManufactoryName_RepairItem, -- ���
	jtt.RPAYHRMORGANIZATIONID AS RPayHrmOrganizationId, -- ��� �������������
	rhorg.PARENTORGANIZATIONID AS ParentOrganizationId, -- ���
	dpt.NAME AS ResponsibleWorker_RepairConfirm, -- ������������� ��� �������� ������� (RepairConfirmDate <> '') ������ ��������� �������������
	jtt.QTY AS Qty, -- ���������� �� ���������
	jtt.UNITID AS UnitId, -- ������� ���������
	jtt.REPAIREDCOUNT AS RepairedCount, -- ���������������/�����������
	jtt.WORKCENTERID AS WorkCenterId -- ���� ����������
FROM SSMJOBTICKETTABLE AS jtt
LEFT JOIN SSMOBJECTS AS o -- ��������/�����
	ON jtt.REPAIROBJECT = o.OBJECTID
LEFT JOIN INVENTTABLE AS it -- ��������
	ON jtt.REPAIROBJECT = it.ITEMID
LEFT JOIN WMSLOCATIONADVHOLD AS wlocadv -- ���
	ON jtt.WMSLOCATIONADVHOLDID = wlocadv.LOCATIONID
LEFT JOIN RPAYHRMORGANIZATION AS rhorg -- ���
	ON jtt.RPAYHRMORGANIZATIONID = rhorg.HRMORGANIZATIONID
LEFT JOIN -- �������������
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
-- ������������
SELECT
	ijt.RECID AS RecId,
	ijn.DESCRIPTION	AS Description, -- ��� ��������
	ijt.JOURNALID AS JournalId, -- ����� ���������
	ijt.POSTED AS Posted, -- ������ �� ���������
	ijt.TRANSDATE AS TransDate, -- ����
	invjtr.ITEMID AS ItemId, -- ������ �������/�������
	it.NAMEALIAS AS NameAlias, -- ��������
	invd1.INVENTSERIALID AS InventSerialId, -- �����
	invd1.INVENTBATCHID AS InventBatchId, -- �����
	ijt.JOURNALNAMEID AS JournalNameId, -- ��� ��/��������
	wloc.NAME AS ManufactoryName, -- ���
	ijt.HRMORGANIZATIONID AS HrmOrganizationId, -- ��� �������������
	horg.PARENTORGANIZATIONID AS ParentOrganizationId, -- ���
	ui.NAME AS ResponsibleWorkerName, -- �������������
	invjtr.QTY AS Qty, -- ���������� �� ��������� / ���������������/�����������
	itm.UNITID AS UnitId -- ������� ���������
FROM INVENTJOURNALTABLE AS ijt
LEFT JOIN INVENTJOURNALNAME AS ijn -- ��� ��������
	ON ijt.JOURNALNAMEID = ijn.JOURNALNAMEID
LEFT JOIN INVENTJOURNALTRANS AS invjtr -- ������ �������/�������
	ON (ijt.JOURNALID = invjtr.JOURNALID) AND (invjtr.BOMLINE = 0)
LEFT JOIN INVENTTABLE AS it -- ��������
	ON invjtr.ITEMID = it.ITEMID
LEFT JOIN INVENTDIM AS invd1 -- �����
	ON invjtr.INVENTDIMID = invd1.INVENTDIMID
LEFT JOIN INVENTDIM AS invd2 -- ���
	ON ijt.INVENTDIMID = invd2.INVENTDIMID
LEFT JOIN WMSLOCATIONADVHOLD AS wloc -- ���
	ON invd2.EMPLOYEEID_RU = wloc.LOCATIONID
LEFT JOIN RPAYHRMORGANIZATION AS horg -- ���
	ON ijt.HRMORGANIZATIONID = horg.HRMORGANIZATIONID
LEFT JOIN USERINFO AS ui -- �������������
	ON (ijt.CREATEDBY = ui.ID)
LEFT JOIN INVENTTABLEMODULE AS itm -- ������� ���������
	ON (invjtr.ITEMID = itm.ITEMID) AND (itm.MODULETYPE = 0)
WHERE
	ijt.JOURNALTYPE = 3
	AND ((ijt.STORNO_RU = 0) AND (ijt.STORNEDJOURNALID = N''))
	AND YEAR(ijt.TRANSDATE) != 1900
	AND ijt.HRMORGANIZATIONID != N''
GO
-- �������
SELECT
	ijt.RECID AS RecId,
	ijt.JOURNALID AS JournalId, -- ����� ���������
	ijt.POSTED AS Posted, -- ������ �� ���������
	ijt.TRANSDATE AS TransDate, -- ����
	ijt.JOURNALNAMEID AS JournalNameId, -- ��� ��/��������
	wloc_from.NAME AS ManufactoryName_From, -- ���
	wloc_to.NAME AS ManufactoryName_To, -- ���																
	iloc_from.HRMORGANIZATIONID	AS HrmOrganizationId_From, -- ��� �������������/������ �������������
	iloc_to.HRMORGANIZATIONID AS HrmOrganizationId_To, -- ��� �������������/������ �������������
	horg_from.PARENTORGANIZATIONID AS ParentOrganizationId_From,-- ���
	horg_to.PARENTORGANIZATIONID AS ParentOrganizationId_To, -- ���
	ui1.NAME AS ResponsibleWorkerName_From, -- �������������_������
	dpt.NAME AS ResponsibleWorkerName_To, -- �������������_����
	ijts.HCMWORKER AS HcmWorker, -- ���� HcmWorker = '', �� ���� �� ������� USERINFO
	ui2.NAME AS ResponsibleWorkerName_To_UserInfo -- �������������_����
FROM INVENTJOURNALTABLE AS ijt
LEFT JOIN INVENTDIM AS invd_from -- �������� ����� ��������
	ON ijt.INVENTDIMID = invd_from.INVENTDIMID
LEFT JOIN INVENTDIM AS invd_to -- �������� ����� ��������
	ON ijt.TOINVENTDIMID = invd_to.INVENTDIMID
LEFT JOIN WMSLOCATIONADVHOLD AS wloc_from -- ���
	ON invd_from.EMPLOYEEID_RU = wloc_from.LOCATIONID 
LEFT JOIN WMSLOCATIONADVHOLD AS wloc_to --���
	ON invd_to.EMPLOYEEID_RU = wloc_to.LOCATIONID 
LEFT JOIN INVENTLOCATION AS iloc_from -- ��� �������������
	ON invd_from.INVENTLOCATIONID = iloc_from.INVENTLOCATIONID
LEFT JOIN INVENTLOCATION AS iloc_to -- ��� �������������
	ON invd_to.INVENTLOCATIONID = iloc_to.INVENTLOCATIONID
LEFT JOIN USERINFO AS ui1 -- ������������� ������
	ON ijt.CREATEDBY = ui1.ID
LEFT JOIN USERINFO AS ui2 -- ������������� ����
	ON ijt.POSTEDUSERID = ui2.ID
LEFT JOIN INVENTJOURNALTABLESIGNATURE AS ijts -- ������������� ����
	ON (ijt.JOURNALID = ijts.JOURNALID) AND (ijts.SIGNATURETYPE = 2)
LEFT JOIN HCMWORKER AS hw -- ������������� ����
	ON ijts.HCMWORKER = hw.RECID
LEFT JOIN DIRPARTYTABLE AS dpt -- ������������� ����
	ON hw.PERSON = dpt.RECID
LEFT JOIN RPAYHRMORGANIZATION AS horg_from -- ���
	ON ijt.HRMORGANIZATIONID = horg_from.HRMORGANIZATIONID
LEFT JOIN RPAYHRMORGANIZATION AS horg_to -- ���
	ON ijt.HRMORGANIZATIONIDTO = horg_to.HRMORGANIZATIONID 	
WHERE
	ijt.JOURNALTYPE = 2
	AND ((ijt.STORNO_RU = 0) AND (ijt.STORNEDJOURNALID = N''))
	AND (invd_from.EMPLOYEEID_RU != invd_to.EMPLOYEEID_RU)
	AND (YEAR(ijt.TRANSDATE) != 1900)
GO
-- ��������
SELECT 
	ijt.RECID AS RecId,
	ijn.DESCRIPTION AS Description, -- ��� ��������
	ijt.JOURNALID AS JournalId, -- ����� ���������
	ijt.POSTED AS Posted, -- ������ �� ���������
	ijt.TRANSDATE AS TransDate, -- ����
	ijt.JOURNALNAMEID AS JournalNameId, -- ��� ��/��������
	wloc.NAME AS ManufactoryName, -- ���
	ijt.HRMORGANIZATIONID AS HrmOrganizationId, -- ��� �������������/������ �������������
	ijt.POSTEDHRMORGANIZATIONID AS PostedHrmOrganizationId, -- ��� �������������/������ �������������
	horg1.PARENTORGANIZATIONID AS ParentOrganizationId_PostedHrmOrgId, -- ���
	horg2.PARENTORGANIZATIONID AS ParentOrganizationId_HrmOrgId, -- ���
	ui.NAME AS ResponsibleWorkerName -- �������������
FROM INVENTJOURNALTABLE AS ijt
LEFT JOIN INVENTJOURNALNAME AS ijn -- ��� ��������
	ON ijt.JOURNALNAMEID = ijn.JOURNALNAMEID
LEFT JOIN INVENTDIM AS invd -- ���
	ON ijt.INVENTDIMID = invd.INVENTDIMID
LEFT JOIN WMSLOCATIONADVHOLD AS wloc -- ���
	ON invd.EMPLOYEEID_RU = wloc.LOCATIONID
LEFT JOIN RPAYHRMORGANIZATION AS horg1 -- ��� �� ������������� �������������� ����������
	ON ijt.POSTEDHRMORGANIZATIONID = horg1.HRMORGANIZATIONID
LEFT JOIN RPAYHRMORGANIZATION AS horg2 -- ��� �� ������������� ������ �� ���������
	ON ijt.HRMORGANIZATIONID = horg2.HRMORGANIZATIONID
LEFT JOIN USERINFO AS ui -- �������������
	ON ijt.CREATEDBY = ui.ID
WHERE
	ijt.JOURNALTYPE = 0 
	AND ((ijt.STORNO_RU = 0) AND (ijt.STORNEDJOURNALID = N''))
	AND YEAR(ijt.TRANSDATE) != 1900

