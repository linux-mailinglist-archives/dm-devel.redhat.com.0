Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A124DE6C4
	for <lists+dm-devel@lfdr.de>; Sat, 19 Mar 2022 08:34:23 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-DEv1uGh2PzulJMMLr5hy-Q-1; Sat, 19 Mar 2022 03:34:20 -0400
X-MC-Unique: DEv1uGh2PzulJMMLr5hy-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43AF73C01C00;
	Sat, 19 Mar 2022 07:34:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 230FFC15D42;
	Sat, 19 Mar 2022 07:34:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 694631937114;
	Sat, 19 Mar 2022 07:34:14 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0E1A91940341
 for <dm-devel@listman.corp.redhat.com>; Sat, 19 Mar 2022 07:34:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DE38540314C; Sat, 19 Mar 2022 07:34:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D94CD401E24
 for <dm-devel@redhat.com>; Sat, 19 Mar 2022 07:34:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA075380350B
 for <dm-devel@redhat.com>; Sat, 19 Mar 2022 07:34:12 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-cXoOImoUMN2yzLmuzyeLfA-1; Sat, 19 Mar 2022 03:34:11 -0400
X-MC-Unique: cXoOImoUMN2yzLmuzyeLfA-1
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22J3CLUq001925; 
 Sat, 19 Mar 2022 06:29:29 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew72a844w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Mar 2022 06:29:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22J6MkAK028031;
 Sat, 19 Mar 2022 06:29:27 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
 by userp3020.oracle.com with ESMTP id 3ew8mfrwm7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Mar 2022 06:29:27 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com (2603:10b6:a03:2d1::14)
 by CY4PR10MB1798.namprd10.prod.outlook.com (2603:10b6:903:126::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Sat, 19 Mar
 2022 06:29:25 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com
 ([fe80::2092:8e36:64c0:a336]) by SJ0PR10MB4429.namprd10.prod.outlook.com
 ([fe80::2092:8e36:64c0:a336%8]) with mapi id 15.20.5081.019; Sat, 19 Mar 2022
 06:29:25 +0000
From: Jane Chu <jane.chu@oracle.com>
To: david@fromorbit.com, djwong@kernel.org, dan.j.williams@intel.com,
 hch@infradead.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
 agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
 ira.weiny@intel.com, willy@infradead.org, vgoyal@redhat.com,
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org
Date: Sat, 19 Mar 2022 00:28:32 -0600
Message-Id: <20220319062833.3136528-6-jane.chu@oracle.com>
In-Reply-To: <20220319062833.3136528-1-jane.chu@oracle.com>
References: <20220319062833.3136528-1-jane.chu@oracle.com>
X-ClientProxiedBy: BY5PR16CA0025.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::38) To SJ0PR10MB4429.namprd10.prod.outlook.com
 (2603:10b6:a03:2d1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff731b21-4de3-4ac7-3e2e-08da0971d03a
X-MS-TrafficTypeDiagnostic: CY4PR10MB1798:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1798E0E9931C1FC341563E92F3149@CY4PR10MB1798.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: paAS/Y84TQ6hkW/JLc+m6KtLnhML5FxwrxxrKRIwkz3s3QD2cH7FUQ34B37y9QA6uowbWeFyWwWyEEHMuo1N8cBcUtN2i1FUwCoj0LFcxBVZA7UQigovBpnAwIX1P+XOwzv01AY/cQ3Li04pGU0fGSdDDKid8+ty1yjwVqi/wrykn0UZRDM/biaKUmCEaDpAfxRMM9/gB6PfOZdeGnCDM8njOuiEj49fhCDscmqCKV8zmtkM8qZaFRInbG7RUEDNxjd4XtGVtxxEdPYgLbIQfp1lfqEn8M0C/nbPCUEZJnjyylsWG927stwqdru6NZbVs3hJrCWUZ6FJdf8JiGjlnFighqMU/UNNrqJgkaQV07jn+T92F+fXgwUj/EHx18ykFPnYAU39NxFSjRpMT4gLvt4UXaKpdffqnXCt+6yLqcHPWx8Vm251c8e4zkLk4iGN9akQOq+gch5iWM9fUyY0ZxjxOYBNkXHqz6+Vc87T3BRwUqtsp42PCTaYgnPvhMfBzNo34tTVstwk1xVMDeo9lLdsXQL7JyFu2xSI4CKqrs79bUrDuxhvGWQUYrijPwWntae4dpsjpbNs2e1N+p9CJcWmnLjrDyvogZ7b15Dex9QmHv9ZSRPUeJzcJG3PcIvpULV1OzIuq5GVHm6MSh0LLdRonCkEukZqvD7df1Hl39WU2U0jM4pMb3yDPb7CFIN0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4429.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6512007)(66476007)(8676002)(83380400001)(66556008)(316002)(6506007)(2906002)(38100700002)(66946007)(508600001)(44832011)(5660300002)(8936002)(7416002)(36756003)(1076003)(6486002)(86362001)(186003)(2616005)(921005)(6666004);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I0R42Bw60kqrRT3eBvL7jFBpeDP5VMw/+WfxZkI36Itr8WvaCnEmNkmXhUUo?=
 =?us-ascii?Q?roYiwSgXuhxIC0d8QQ0sV9trOLg3mhxjhUQcue6Cv3E98vOeScL0EMkZ3GeZ?=
 =?us-ascii?Q?HUZ1sw3EPNaQMAcdWaLnj+fEA6AF5rkC813TPrpe+eAZJg8NP7FGgmh2hAv+?=
 =?us-ascii?Q?1raCjJrKiEhMleyYXVN4k6VsIAmUbhCqynoht8avt7H0InszopkeAwrtiTsB?=
 =?us-ascii?Q?1shEGkHd5yXGvR2V47fmJNUoH8LSFCELtpuaMrniwyUL4oyrznblSADv+LDy?=
 =?us-ascii?Q?AA0kEJTzx2AuUZyRp4ztkk/n5zn5gKj1AThp0k5qB2NUvNfZqnveBrGFVNx4?=
 =?us-ascii?Q?/6kWCGiR4c3bpW7H3RaR6fokAHbG1fK2L9Li1cp0d+/FzfXhUc26S0/bl3iY?=
 =?us-ascii?Q?w7Am5VVK9INAJCiAEgUZwy4hYF50rsriw9IFWu/qficSNkQcbDwp6P0ANajx?=
 =?us-ascii?Q?9PvBhcrN78SzBiZ5Pj0nx+q+qn3SGfeZ4ZzNAnG8GkBTOlGUAFCLfMRLHYZ0?=
 =?us-ascii?Q?WHG2Z/otH3M0UKoFog83Rh+o9433AYcHgiXQ3T+Fbm/Jkx+2RUiUU2DB2wYB?=
 =?us-ascii?Q?TomDDH0o0v6aZGGQ0q+C/5Nbn/9fXSZe5uh5rnTLCI6zqZtsvR3OQyWNtIHz?=
 =?us-ascii?Q?sGFItN0PkjuJwX7T6Bl0e86wb223KbVLqBU8t1Vc18rALlRPvqRa2r56NQSP?=
 =?us-ascii?Q?1dUTOmlDfm+LqdJIsSgjLTFSy8CzE76E8KMh+yF1y9QDky2bj339pKtO3nu0?=
 =?us-ascii?Q?sDCepHC+9ow86lycjT/j4hzwlZznWigp3SexGAdH0/SJQG3TcbAfc7f1jaQC?=
 =?us-ascii?Q?Du1jXln8x4hQERTamndjq4mcahCpZ5naKueiZKf/Sko1SadSlLpbPURAeJSB?=
 =?us-ascii?Q?u3PWsazsWsONF3S6MKTi0EcRGBnVp+iS2Z/R9+lU/M2hpdMPjbzej085wyTn?=
 =?us-ascii?Q?b8T1EaNitn5EVCKv1egukm65I7ou25uoiZ+t9WqbmZ6mKLhTJs4MmHU9aq+P?=
 =?us-ascii?Q?9wXxUEja9LJqjpGQq05uy5bms1FfD5FqWUJxbJxDbgpQxEsimS7iD2vq+aPR?=
 =?us-ascii?Q?1qsnA/Uj1y1H/ns0tdLhOUeDraw5qEPa4ESaraGv8Hy1CVrytVNSMNtBHXaZ?=
 =?us-ascii?Q?2kT6iKBuvs6K4b9igp9LRwlFDwy13d8AjyUTbcMxTGKgEpF4aNFqWkrt7CyT?=
 =?us-ascii?Q?YRYtWZATi0dvyipk3cXzdoGlEyRK57wsf5c0g73Z9K1W2tRat3g5ca6AaUoN?=
 =?us-ascii?Q?QWWeSz/YzENYrf8L07W1rjdJs1sIODTHzNrrfF75sTEyEbHQ8sZCdyneDEBW?=
 =?us-ascii?Q?2qPNsxktqXIMLoTdYeS37Tped77TlL67OZPdFuBlJhUYvhfb1s8qJoEbZ/fN?=
 =?us-ascii?Q?6+v84IVy/2jsvVYH6mqCpwl7zYxs5+EeeCmhX7aEcSr8znnFZGpQBHAOrvYp?=
 =?us-ascii?Q?F2+YU/Vdgffp7j5g52/hJbnS1vaf5v9vS8pBZxAR/eQoMbAyi4d5fQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff731b21-4de3-4ac7-3e2e-08da0971d03a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4429.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2022 06:29:25.8278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4TH/Ph8H0gSf0ZPbrq1zZQuxEtX6sSIRVssH74hWAnaKpLwvY1nphUmlvTiAabUibZ7L1dU9LDs5fHbwIESew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1798
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10290
 signatures=694221
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203190038
X-Proofpoint-GUID: 4oZ6RGTnhXNXOFF_gMavcjLIr8l2ndsq
X-Proofpoint-ORIG-GUID: 4oZ6RGTnhXNXOFF_gMavcjLIr8l2ndsq
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [dm-devel] [PATCH v6 5/6] pmem: refactor pmem_clear_poison()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Refactor the pmem_clear_poison() in order to share common code
later.

Signed-off-by: Jane Chu <jane.chu@oracle.com>
---
 drivers/nvdimm/pmem.c | 81 ++++++++++++++++++++++++++++++-------------
 1 file changed, 56 insertions(+), 25 deletions(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 7cdaa279beca..18f357fbef69 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -45,10 +45,27 @@ static struct nd_region *to_region(struct pmem_device *pmem)
 	return to_nd_region(to_dev(pmem)->parent);
 }
 
-static void hwpoison_clear(struct pmem_device *pmem,
-		phys_addr_t phys, unsigned int len)
+static phys_addr_t to_phys(struct pmem_device *pmem, phys_addr_t offset)
 {
+	return pmem->phys_addr + offset;
+}
+
+static sector_t to_sect(struct pmem_device *pmem, phys_addr_t offset)
+{
+	return (offset - pmem->data_offset) / 512;
+}
+
+static phys_addr_t to_offset(struct pmem_device *pmem, sector_t sector)
+{
+	return sector * 512 + pmem->data_offset;
+}
+
+static void clear_hwpoison(struct pmem_device *pmem, phys_addr_t offset,
+		unsigned int len)
+{
+	phys_addr_t phys = to_phys(pmem, offset);
 	unsigned long pfn_start, pfn_end, pfn;
+	unsigned int blks = len / 512;
 
 	/* only pmem in the linear map supports HWPoison */
 	if (is_vmalloc_addr(pmem->virt_addr))
@@ -67,33 +84,47 @@ static void hwpoison_clear(struct pmem_device *pmem,
 		if (test_and_clear_pmem_poison(page))
 			clear_mce_nospec(pfn);
 	}
+
+	dev_dbg(to_dev(pmem), "%#llx clear %u sector%s\n",
+		(unsigned long long) to_sect(pmem, offset), blks,
+		blks > 1 ? "s" : "");
 }
 
-static blk_status_t pmem_clear_poison(struct pmem_device *pmem,
-		phys_addr_t offset, unsigned int len)
+static void clear_bb(struct pmem_device *pmem, sector_t sector, long blks)
 {
-	struct device *dev = to_dev(pmem);
-	sector_t sector;
+	badblocks_clear(&pmem->bb, sector, blks);
+	if (pmem->bb_state)
+		sysfs_notify_dirent(pmem->bb_state);
+}
+
+static blk_status_t __pmem_clear_poison(struct pmem_device *pmem,
+		phys_addr_t offset, unsigned int len,
+		unsigned int *blks)
+{
+	phys_addr_t phys = to_phys(pmem, offset);
 	long cleared;
-	blk_status_t rc = BLK_STS_OK;
-
-	sector = (offset - pmem->data_offset) / 512;
-
-	cleared = nvdimm_clear_poison(dev, pmem->phys_addr + offset, len);
-	if (cleared < len)
-		rc = BLK_STS_IOERR;
-	if (cleared > 0 && cleared / 512) {
-		hwpoison_clear(pmem, pmem->phys_addr + offset, cleared);
-		cleared /= 512;
-		dev_dbg(dev, "%#llx clear %ld sector%s\n",
-				(unsigned long long) sector, cleared,
-				cleared > 1 ? "s" : "");
-		badblocks_clear(&pmem->bb, sector, cleared);
-		if (pmem->bb_state)
-			sysfs_notify_dirent(pmem->bb_state);
-	}
+	blk_status_t rc;
 
+	cleared = nvdimm_clear_poison(to_dev(pmem), phys, len);
+	*blks = cleared / 512;
+	rc = (cleared < len) ? BLK_STS_IOERR : BLK_STS_OK;
+	if (cleared <= 0 || *blks == 0)
+		return rc;
+
+	clear_hwpoison(pmem, offset, cleared);
 	arch_invalidate_pmem(pmem->virt_addr + offset, len);
+	return rc;
+}
+
+static blk_status_t pmem_clear_poison(struct pmem_device *pmem,
+		phys_addr_t offset, unsigned int len)
+{
+	unsigned int blks;
+	blk_status_t rc;
+
+	rc = __pmem_clear_poison(pmem, offset, len, &blks);
+	if (blks > 0)
+		clear_bb(pmem, to_sect(pmem, offset), blks);
 
 	return rc;
 }
@@ -143,7 +174,7 @@ static blk_status_t pmem_do_read(struct pmem_device *pmem,
 			sector_t sector, unsigned int len)
 {
 	blk_status_t rc;
-	phys_addr_t pmem_off = sector * 512 + pmem->data_offset;
+	phys_addr_t pmem_off = to_offset(pmem, sector);
 	void *pmem_addr = pmem->virt_addr + pmem_off;
 
 	if (unlikely(is_bad_pmem(&pmem->bb, sector, len)))
@@ -158,7 +189,7 @@ static blk_status_t pmem_do_write(struct pmem_device *pmem,
 			struct page *page, unsigned int page_off,
 			sector_t sector, unsigned int len)
 {
-	phys_addr_t pmem_off = sector * 512 + pmem->data_offset;
+	phys_addr_t pmem_off = to_offset(pmem, sector);
 	void *pmem_addr = pmem->virt_addr + pmem_off;
 
 	if (unlikely(is_bad_pmem(&pmem->bb, sector, len))) {
-- 
2.18.4

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

