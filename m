Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 829F749D449
	for <lists+dm-devel@lfdr.de>; Wed, 26 Jan 2022 22:12:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-86rL_wjSPeCbDOp_f-0SAA-1; Wed, 26 Jan 2022 16:12:32 -0500
X-MC-Unique: 86rL_wjSPeCbDOp_f-0SAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC1D618B9EC8;
	Wed, 26 Jan 2022 21:12:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40FE5E2E6;
	Wed, 26 Jan 2022 21:12:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD33A1809CB9;
	Wed, 26 Jan 2022 21:12:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20QLC307025992 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jan 2022 16:12:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 02E8740CFD14; Wed, 26 Jan 2022 21:12:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F180140CFD04
	for <dm-devel@redhat.com>; Wed, 26 Jan 2022 21:12:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0C4A837187
	for <dm-devel@redhat.com>; Wed, 26 Jan 2022 21:12:02 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-393-W5FTqVp7MSmTbPh7aoU5zQ-1; Wed, 26 Jan 2022 16:11:58 -0500
X-MC-Unique: W5FTqVp7MSmTbPh7aoU5zQ-1
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	20QKYe4F012687; Wed, 26 Jan 2022 21:11:40 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by mx0b-00069f02.pphosted.com with ESMTP id 3dsvmjfux1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jan 2022 21:11:40 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QL6q3U050207;
	Wed, 26 Jan 2022 21:11:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
	(mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by aserp3020.oracle.com with ESMTP id 3dtax94ua3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jan 2022 21:11:39 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com (2603:10b6:a03:2d1::14)
	by DM8PR10MB5494.namprd10.prod.outlook.com (2603:10b6:8:21::5) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.4909.10; Wed, 26 Jan 2022 21:11:37 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com
	([fe80::d034:a8db:9e32:acde]) by
	SJ0PR10MB4429.namprd10.prod.outlook.com
	([fe80::d034:a8db:9e32:acde%4]) with mapi id 15.20.4909.019;
	Wed, 26 Jan 2022 21:11:37 +0000
From: Jane Chu <jane.chu@oracle.com>
To: david@fromorbit.com, djwong@kernel.org, dan.j.williams@intel.com,
	hch@infradead.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
	ira.weiny@intel.com, willy@infradead.org, vgoyal@redhat.com,
	linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org
Date: Wed, 26 Jan 2022 14:11:10 -0700
Message-Id: <20220126211116.860012-2-jane.chu@oracle.com>
In-Reply-To: <20220126211116.860012-1-jane.chu@oracle.com>
References: <20220126211116.860012-1-jane.chu@oracle.com>
X-ClientProxiedBy: SA9PR13CA0112.namprd13.prod.outlook.com
	(2603:10b6:806:24::27) To SJ0PR10MB4429.namprd10.prod.outlook.com
	(2603:10b6:a03:2d1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a1b297f-5f82-4266-2226-08d9e1107046
X-MS-TrafficTypeDiagnostic: DM8PR10MB5494:EE_
X-Microsoft-Antispam-PRVS: <DM8PR10MB54946DE3AEB95BAACD245B0CF3209@DM8PR10MB5494.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: IzksrH9KDtlLo0u6ruAqdZgjV9IoZZWY4eBvC1XoXebrGB05SyrKXYHcsmIoHHeN7k1OueR5IT3DckXkeAkX/2aiABojYzhRqutl+9tbGLdCp2wfnkfhQKdtlIPXxz26AxkAYssdXvLH/HOzMcPOa2FqHgxZVXdW+0DjYEeQIg19T6ieoip2W01JfBd3pLWRnNSjnI4ss0PSZ49ZHMWuojActvjwdE7Ne1XTVeonsHDxkRQ50ritP6mQGNV23dk3auUP0CPcsyaz/9ZRoC0B981H3aKP2VMx60K8uoKp+qyxjbqOBkHM2IZpH3E1BMPPY7hq8VJmJTwj85LgEVT+jFnCnA6uboob/bNPcWYDTyzn8OL3qO3VYWgRRXsP+0RXpiyAxQW9f4HHBdBt7fgi2spZfnBtxC5CrcKa71ngnBeLdSYEohDwAiNnhcyaLMzCURAj4boo+blBr09A2XoC6uCT4h650rPAAknV6LoaNc2yLIMF06YBveFtOBtWHjguji9EtdI6duJs0m9AtvfHzgUC6CAQMjisa+7jdU28dXje4AtFJH5pym37ii2XfTbcfjX+srVcYvkkPproHnoQ0Wf16dL5muKpuJ1xRZ0YghepX0YJQcn2nTQiURPdPUD4HI/O+c8gSaoJlV241tUxaGoQjMN/YfiJBBAN38fVIWBtz7APApOMXKxdfQ1NRgp8i8XHZYKX4AVP/EnKHZaZS6M/gop7mQ2GeZTePGHwG4O244jrQAY30GoZGyy4wTI68f7nyWJvXCNSfdDdydtZgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR10MB4429.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(66946007)(52116002)(86362001)(186003)(8676002)(6666004)(966005)(7416002)(6486002)(1076003)(8936002)(921005)(508600001)(6512007)(66476007)(2906002)(6506007)(83380400001)(2616005)(5660300002)(66556008)(36756003)(44832011)(316002)(38100700002);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M7Nj8XYTV0JiHpX8o+EwoFhwvN643HGRmQjUK5IsP1PBiDptEHvZoBB7fYzr?=
	=?us-ascii?Q?u3nDrbmMDZhp6k6XcCIe1lFu5FsctiOFRiEH4vVlAa7TOtzaZuI6NqRxdWnp?=
	=?us-ascii?Q?ibUN1dfXaTQkl3oEjn4aKN4s/U6I3DHPDnOW/oVjePsoI4zvTL3EdYWj+N9L?=
	=?us-ascii?Q?cc5XBonIXi+JDkrr1iQml0Bvj8GEC6tkfwFpl0L50dGVqxzZJE1YW5qABBwE?=
	=?us-ascii?Q?V+M1FAchXfD9YxQ+Tza3pzez5BZ17rZ8MGotdakXv0fU8frPyh05NbvTfRj7?=
	=?us-ascii?Q?kIc12DVahWnjl+pCk+oay8JygDnsuHTklNIIDKEdpeyUptQo1byCjbDdRDWV?=
	=?us-ascii?Q?dSyyJsi9Go33OH+o4b/c6dx6pxbb0tU9WBYQ/FoTdBHykIoyGfDpv0N4saR7?=
	=?us-ascii?Q?xcldCxrS3qQ2dpfQm6QIqxYU9Qpuuw4cYoXdd72VmB66Tuc5C+g61SJcIgc9?=
	=?us-ascii?Q?5u5vOsGvRUuTLjnf5KwCUFcc2+kZDhz1u5YyY+/i6bVhqgBe2ihbmtS2D9Sa?=
	=?us-ascii?Q?/cFRz83L7gxljtIM2WmOsRMAivnMEYDuZEKYC+IxHr7XRFrnHPNKSJiBNvNt?=
	=?us-ascii?Q?KMlXuFziDtMFQuFVQEBcJ/igy7gP5YcvZEByVoydH5ftaB/Kx0H/dkvY5TZH?=
	=?us-ascii?Q?Io1XeMSqfvDVk0hUUc2gl7KdY+iN5KlBJeaggouHtP4NkNsV0/gb6IRVqzp2?=
	=?us-ascii?Q?NABDoeIyXyrumJr9Xidti81HSsbITqmqq3YFk+6V7dBiHb0d0jxzaToCPc67?=
	=?us-ascii?Q?hjAgxjAu97rO7iXGFJB1lw9uAyfbCnmCEZtKql2VzSOGHuOuMRORcPQ1CnDm?=
	=?us-ascii?Q?9k/IExNBLmrABPhDX3v2OOmUFfg4OUSvPPCnk2q4TdG0hoV5rvp065REIDyA?=
	=?us-ascii?Q?N5MF0yRn5yh+9noXdwfsyQJs13Y5KC7eegRhOpx8cPcsJZ64WUfIVATAS4zw?=
	=?us-ascii?Q?fjG5Di0UkElc37gDT8osg6uVJtp7JEegj0SVO+XSLHlb9dJ6nPmnCdEpgyd4?=
	=?us-ascii?Q?KYit7ZoDuUMtNAZOJcOhbuXqqdMJWvssOB063Gm/X1WSCQym2AfunZFa/fUJ?=
	=?us-ascii?Q?fZCianGQkiPXHLaATUVqn9QRFaWelOLN3kA+SsYi+fyVtnB9P2aHo6o7/3rS?=
	=?us-ascii?Q?ilXFd4Ve3aUhLOjexsa8EMXZJoMBOMsZkS4kcUdJhpJkyZGV3kahRmHb/LGG?=
	=?us-ascii?Q?5GQsPqIC/Z05OAnhiirSeDxTWSyymzkEHF8huAwJiIpw8FuQWMFKR+6N0wgW?=
	=?us-ascii?Q?tnxpkeghSGps4ZA1ptsn7y+JRKSM+K5u303YtUtWf9Ox5n17D3HPRERtko34?=
	=?us-ascii?Q?fZOnzgJ+hpBkIh8BeYeuqiEKLXxpYnErsOVVQ9z08B4LdQJ5+bbjGtqiDqRM?=
	=?us-ascii?Q?K87Yabwdrw1sPDAQ91IAi6jUjnvAnJNIDjKOlPLu8xKTcrhjdEjuV0HA+S0r?=
	=?us-ascii?Q?+bEbSOUiD6Qke+wLdNiTVgcY/Au7r1Zcii1SGyE6ZTHF+aUj+cjwgwsvh1ot?=
	=?us-ascii?Q?ok7stxmsPLj2qlk3p/Rvfk0n0u9HK807KfAEtFvlVSMayI6ZUWqmBlQrL8j5?=
	=?us-ascii?Q?GZIHAA8eWO6GfG2SG9vT/SKbG9KapndP3nQbAGrAIeiU4Tu3et1P7ei0WRpf?=
	=?us-ascii?Q?HSYen5b66DvWzciFFxL33xUCkJjAkia/AE+La/cToDDa?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1b297f-5f82-4266-2226-08d9e1107046
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4429.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 21:11:37.0412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koRV2kTD23tsiF6K7AqA5uil7jWvy7H4A409tEK/Rz4N3ib0Q+W9aOgkG/ZFcaaIe/jeRpnUX9GobMiODQg6Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR10MB5494
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	bulkscore=0 mlxscore=0
	phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2201110000 definitions=main-2201260122
X-Proofpoint-GUID: I0YQgTTHhtyXx3R4tohfzZj96xKSmYgV
X-Proofpoint-ORIG-GUID: I0YQgTTHhtyXx3R4tohfzZj96xKSmYgV
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH v4 1/7] mce: fix set_mce_nospec to always unmap
	the whole page
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mark poisoned page as not present, and to reverse the 'np' effect,
restate the _PAGE_PRESENT bit. Please refer to discussions here for
reason behind the decision.
https://lore.kernel.org/all/CAPcyv4hrXPb1tASBZUg-GgdVs0OOFKXMXLiHmktg_kFi7YBMyQ@mail.gmail.com/

Fixes: 284ce4011ba6 ("x86/memory_failure: Introduce {set, clear}_mce_nospec()")
Signed-off-by: Jane Chu <jane.chu@oracle.com>
---
 arch/x86/include/asm/set_memory.h | 17 +++++------------
 arch/x86/kernel/cpu/mce/core.c    |  6 +++---
 arch/x86/mm/pat/set_memory.c      |  8 +++++++-
 include/linux/set_memory.h        |  2 +-
 4 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index ff0f2d90338a..aef6677da291 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -50,6 +50,7 @@ int set_memory_decrypted(unsigned long addr, int numpages);
 int set_memory_np_noalias(unsigned long addr, int numpages);
 int set_memory_nonglobal(unsigned long addr, int numpages);
 int set_memory_global(unsigned long addr, int numpages);
+int _set_memory_present(unsigned long addr, int numpages);
 
 int set_pages_array_uc(struct page **pages, int addrinarray);
 int set_pages_array_wc(struct page **pages, int addrinarray);
@@ -89,13 +90,8 @@ void notify_range_enc_status_changed(unsigned long vaddr, int npages, bool enc);
 extern int kernel_set_to_readonly;
 
 #ifdef CONFIG_X86_64
-/*
- * Prevent speculative access to the page by either unmapping
- * it (if we do not require access to any part of the page) or
- * marking it uncacheable (if we want to try to retrieve data
- * from non-poisoned lines in the page).
- */
-static inline int set_mce_nospec(unsigned long pfn, bool unmap)
+/* Prevent speculative access to a page by marking it not-present */
+static inline int set_mce_nospec(unsigned long pfn)
 {
 	unsigned long decoy_addr;
 	int rc;
@@ -117,10 +113,7 @@ static inline int set_mce_nospec(unsigned long pfn, bool unmap)
 	 */
 	decoy_addr = (pfn << PAGE_SHIFT) + (PAGE_OFFSET ^ BIT(63));
 
-	if (unmap)
-		rc = set_memory_np(decoy_addr, 1);
-	else
-		rc = set_memory_uc(decoy_addr, 1);
+	rc = set_memory_np(decoy_addr, 1);
 	if (rc)
 		pr_warn("Could not invalidate pfn=0x%lx from 1:1 map\n", pfn);
 	return rc;
@@ -130,7 +123,7 @@ static inline int set_mce_nospec(unsigned long pfn, bool unmap)
 /* Restore full speculative operation to the pfn. */
 static inline int clear_mce_nospec(unsigned long pfn)
 {
-	return set_memory_wb((unsigned long) pfn_to_kaddr(pfn), 1);
+	return _set_memory_present((unsigned long) pfn_to_kaddr(pfn), 1);
 }
 #define clear_mce_nospec clear_mce_nospec
 #else
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 5818b837fd4d..8d12739f283d 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -613,7 +613,7 @@ static int uc_decode_notifier(struct notifier_block *nb, unsigned long val,
 
 	pfn = mce->addr >> PAGE_SHIFT;
 	if (!memory_failure(pfn, 0)) {
-		set_mce_nospec(pfn, whole_page(mce));
+		set_mce_nospec(pfn);
 		mce->kflags |= MCE_HANDLED_UC;
 	}
 
@@ -1297,7 +1297,7 @@ static void kill_me_maybe(struct callback_head *cb)
 
 	ret = memory_failure(p->mce_addr >> PAGE_SHIFT, flags);
 	if (!ret) {
-		set_mce_nospec(p->mce_addr >> PAGE_SHIFT, p->mce_whole_page);
+		set_mce_nospec(p->mce_addr >> PAGE_SHIFT);
 		sync_core();
 		return;
 	}
@@ -1321,7 +1321,7 @@ static void kill_me_never(struct callback_head *cb)
 	p->mce_count = 0;
 	pr_err("Kernel accessed poison in user space at %llx\n", p->mce_addr);
 	if (!memory_failure(p->mce_addr >> PAGE_SHIFT, 0))
-		set_mce_nospec(p->mce_addr >> PAGE_SHIFT, p->mce_whole_page);
+		set_mce_nospec(p->mce_addr >> PAGE_SHIFT);
 }
 
 static void queue_task_work(struct mce *m, char *msg, void (*func)(struct callback_head *))
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index b4072115c8ef..68d84c8bd977 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1816,7 +1816,7 @@ static inline int cpa_clear_pages_array(struct page **pages, int numpages,
 }
 
 /*
- * _set_memory_prot is an internal helper for callers that have been passed
+ * __set_memory_prot is an internal helper for callers that have been passed
  * a pgprot_t value from upper layers and a reservation has already been taken.
  * If you want to set the pgprot to a specific page protocol, use the
  * set_memory_xx() functions.
@@ -1983,6 +1983,12 @@ int set_memory_global(unsigned long addr, int numpages)
 				    __pgprot(_PAGE_GLOBAL), 0);
 }
 
+int _set_memory_present(unsigned long addr, int numpages)
+{
+	return change_page_attr_set(&addr, numpages, __pgprot(_PAGE_PRESENT), 0);
+}
+EXPORT_SYMBOL_GPL(_set_memory_present);
+
 /*
  * __set_memory_enc_pgtable() is used for the hypervisors that get
  * informed about "encryption" status via page tables.
diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index f36be5166c19..9ad898d40e7e 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -43,7 +43,7 @@ static inline bool can_set_direct_map(void)
 #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 
 #ifndef set_mce_nospec
-static inline int set_mce_nospec(unsigned long pfn, bool unmap)
+static inline int set_mce_nospec(unsigned long pfn)
 {
 	return 0;
 }
-- 
2.18.4

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

