Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A1A4DE6B8
	for <lists+dm-devel@lfdr.de>; Sat, 19 Mar 2022 08:28:33 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-GYn66rqtOyKpb37cYOJsuw-1; Sat, 19 Mar 2022 03:28:30 -0400
X-MC-Unique: GYn66rqtOyKpb37cYOJsuw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3700F3803508;
	Sat, 19 Mar 2022 07:28:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D46758A473;
	Sat, 19 Mar 2022 07:28:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C08201937114;
	Sat, 19 Mar 2022 07:28:25 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1912C1940341
 for <dm-devel@listman.corp.redhat.com>; Sat, 19 Mar 2022 07:28:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DEF5A76F0; Sat, 19 Mar 2022 07:28:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D96637AE8
 for <dm-devel@redhat.com>; Sat, 19 Mar 2022 07:28:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA4A6185A7A4
 for <dm-devel@redhat.com>; Sat, 19 Mar 2022 07:28:20 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-4JeT8ahuMiaQg24LlkAPOQ-1; Sat, 19 Mar 2022 03:28:17 -0400
X-MC-Unique: 4JeT8ahuMiaQg24LlkAPOQ-1
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22J1uTjd027608; 
 Sat, 19 Mar 2022 06:29:20 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5y1r5c0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Mar 2022 06:29:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22J6M8Ng027457;
 Sat, 19 Mar 2022 06:29:19 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2044.outbound.protection.outlook.com [104.47.56.44])
 by userp3020.oracle.com with ESMTP id 3ew8mfrwkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Mar 2022 06:29:18 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com (2603:10b6:a03:2d1::14)
 by CY4PR10MB1798.namprd10.prod.outlook.com (2603:10b6:903:126::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Sat, 19 Mar
 2022 06:29:17 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com
 ([fe80::2092:8e36:64c0:a336]) by SJ0PR10MB4429.namprd10.prod.outlook.com
 ([fe80::2092:8e36:64c0:a336%8]) with mapi id 15.20.5081.019; Sat, 19 Mar 2022
 06:29:17 +0000
From: Jane Chu <jane.chu@oracle.com>
To: david@fromorbit.com, djwong@kernel.org, dan.j.williams@intel.com,
 hch@infradead.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
 agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
 ira.weiny@intel.com, willy@infradead.org, vgoyal@redhat.com,
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org
Date: Sat, 19 Mar 2022 00:28:30 -0600
Message-Id: <20220319062833.3136528-4-jane.chu@oracle.com>
In-Reply-To: <20220319062833.3136528-1-jane.chu@oracle.com>
References: <20220319062833.3136528-1-jane.chu@oracle.com>
X-ClientProxiedBy: BY5PR16CA0025.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::38) To SJ0PR10MB4429.namprd10.prod.outlook.com
 (2603:10b6:a03:2d1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc0170ff-0df4-4825-82da-08da0971cadc
X-MS-TrafficTypeDiagnostic: CY4PR10MB1798:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1798CC1C92DC68DEE8AF7544F3149@CY4PR10MB1798.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: boM44YyIcnKPVPXYOi4Cd3P99cPpPUxid68zP7VdyHHKBmR5Z1yuRfsE+uP0D9uwIDhR/eyHZsjcY600anM+OCG5JQOZnwHZjqrlwuafZjEifDzEWPbT1It2yHirLSbFPGoJYWRuxfhCLJENfhI2ENqxKfQZvon18yQkJsUuxPdDNVhTIKvCn+G5651oS0mZTVw4EEnD2gaT5l5P8I4zJ8MPuw7Mnc0FLMe48opVV00qdWZClLRw2OcFGMxp9q0x/TyxVUbxpyUtL7pT0hkkK9iSaGNcc4LUDGxsMvcnVk46rvVy8e6iCVHWYrCM3SohtWZocoEpI2N0pVsvdJQiTaAS4KCYbmmOk8asYkecUfJbNM7v+baVB8apRv6cbiULxFVK9qaoVDrgFj8vVgc55AdiIe8BaTo18JjoyHCTDOpjyIR6XWuyC7yq3NajVW6Hgj2tBgSMDRiFi6QjQk8NLYc1NTuVvrJSIkDHO7s0ZDMuDDeiQyxbUObcCwq9U6rpQkB1vp9xtM4wjXSlvkU/LLwWB1v6lnqckdboT8MTTjMK3gU7I9GqtE4gWySXzaZSXU35KW1oPCOF88WpfHAEbPzpnarv4fAFggG4UurUIj/uDCoz/HEqbifZfhFhbIo4LzzmdyKiNDW7+sP3C9iy+/8UxO74r2sLWClINmJCSkJZlZ36nRTxCEWKQO0+3qorjQyrzraCEO1/Wjuo/DGD6BqMxJyA1hfcHeJCTylE8NCwP/jqS7mps16RDDSls5IydeYEnVNeglDeXIUbCZ6uqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4429.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6512007)(66476007)(8676002)(83380400001)(66556008)(316002)(6506007)(2906002)(38100700002)(66946007)(508600001)(44832011)(966005)(5660300002)(8936002)(7416002)(36756003)(1076003)(6486002)(86362001)(186003)(2616005)(921005)(6666004);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d6MmD1lFSZrIGH5rew5M6omIiM927Tu2Sr5Nt3h4u0zTy8MlERFPUZhdp/wF?=
 =?us-ascii?Q?PjczuwW4ctCgySaesAyjA1xVvdpXoCBVD8wFuqD8Ok4EJBEjlJV4uhJ5hbQR?=
 =?us-ascii?Q?gG+2LMOpH7OGgDJuYTsc5y9k4pIxEFES9p2NfZjkj9QwRgTIuRABUMgbtDf1?=
 =?us-ascii?Q?jmqaKFoFRyV9zL5yhLaUezbAEMZLlvdUxvHJ5s5BP0Vq4ipyaM1+eK0NipsO?=
 =?us-ascii?Q?nBu85a26iQ5Ei1fKivmd3vqSSPmOm1QqwaJQ9NM3mBBDr62FofPhdHWolf9j?=
 =?us-ascii?Q?7SVVU5E0J3lKPrzoVmMLt2qT0L2W6cKWgD2BgNh4DpNyN+c7Ot+RWRdAkN1N?=
 =?us-ascii?Q?7ukwXk1ETzYoPh2BfNf+9e3nONIJwu7HQCE+hAo+ln4W6Iiep4lKwQv/YzcL?=
 =?us-ascii?Q?OOGgd7hLztK7xyRh4N8sXZ8yU/EdEdC2C1a5iEr3cI72v4+L24HawSpxwKDv?=
 =?us-ascii?Q?oHGe+v4rNwNF5hGkyZ9dAsLBg+Zp3/VBwknlX8I4KsTG5r3skuZvIl/+WssX?=
 =?us-ascii?Q?JgzkH0RBg8LdGjX6CxZyv22UrLVnDIlIdPIA4RTnWgz6PCeKbvDnZoPdOVjr?=
 =?us-ascii?Q?hn2hvT6+fmxVfwEhKAz1qCfaQhTjTuweUw97p2ltvP1qYF711odEdNPqBvE6?=
 =?us-ascii?Q?EmBM9mqd2PvjARNd8Kbz8re7Ehkdw/jNZ7gCbauiJDgXjDSKmdfMppaRsrFo?=
 =?us-ascii?Q?TuCCk7xV2N7vaJMzXvw8lHXX4FoijMqvHASu8mRn8UTMbQaC1UvSKL+gIgSb?=
 =?us-ascii?Q?Dw2bbd2C6yLW97fNMnpqp69H1Z7P/4wmDdB1ufYqBt5AUH/gdMyUdb6bhQgq?=
 =?us-ascii?Q?+wINbIVLOOva8Uho+pZez0b9vL6dWq6kJ6Vwl8mV+MCSVPn6MzZghJj/V+Cj?=
 =?us-ascii?Q?FoAGflxvYVLvk3WcqFYbtZr/HB2uXzaGTIamcouKcUsc+UMDVMuRqKGOYrdv?=
 =?us-ascii?Q?BFaDTs/ByFxyFZuy7ZxSW0QJP9QMbD3El4YKzL5nneatJ6TKFKZe0ucTMgA4?=
 =?us-ascii?Q?Z5UbS2QHEHWcOrdvhZz1UIrHRZ7dCfgLBPHCe8pNLPB2m+C8ETyYEFYYdlkC?=
 =?us-ascii?Q?qzdeVPf3gDmxzV1N+NO9M7myLLxe4YaD+B3Zsi8FASa3csAaDeDlv8+rt0Du?=
 =?us-ascii?Q?lJZf4tF48czT2Pa6VHo0UzajeItARyonVLgsq4yCTqyN7zaSmPXhrBsoTV2i?=
 =?us-ascii?Q?S4SPVdM4PEzo526Y105mFpXrAYop9Ce47w0iEY7gfCcZdWRnUYsJ3A8c711Q?=
 =?us-ascii?Q?gDHR634RlFmSRYMw2Ac4GhDtdJCutJ09zuJjJ/Tcj6adeydWW7epWIySZU83?=
 =?us-ascii?Q?SSb2bzb2NyIMA6ClgD9BYqeN7VR3o2oEevJBVs7vfpK2yWZC24v9wOLnF/Yk?=
 =?us-ascii?Q?u7hKj4KZIB1VxJI5sL+Z88E8ZAHINC1ZD3jG4eLcV4bL7qr/zdzOLnXlrfhA?=
 =?us-ascii?Q?9HnfcA/VCmmm5SnhEzDg7qBBYnuiPPfjfbwTLC15H7qj7PQ/AR4PBoRKmgw6?=
 =?us-ascii?Q?UY4NTEiNtM3IhP4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0170ff-0df4-4825-82da-08da0971cadc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4429.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2022 06:29:16.9824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vmMtnUI39iMVlam3Dsvcrp/oXczj6ZCvUl3Ki1TtP/RNFoPgkrNAsgeisW31geMrnXpKR4DM8e9LBWiEeYefg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1798
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10290
 signatures=694221
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203190038
X-Proofpoint-GUID: rGe-jUCbnLULhNV454fh_8CjQ8bcRNa-
X-Proofpoint-ORIG-GUID: rGe-jUCbnLULhNV454fh_8CjQ8bcRNa-
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [dm-devel] [PATCH v6 3/6] mce: fix set_mce_nospec to always unmap
 the whole page
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

Now since poisoned page is marked as not-present, in order to
avoid writing to a 'np' page and trigger kernel Oops, also fix
pmem_do_write().

Fixes: 284ce4011ba6 ("x86/memory_failure: Introduce {set, clear}_mce_nospec()")
Signed-off-by: Jane Chu <jane.chu@oracle.com>
---
 arch/x86/kernel/cpu/mce/core.c |  6 +++---
 arch/x86/mm/pat/set_memory.c   | 21 +++++++++------------
 drivers/nvdimm/pmem.c          | 31 +++++++------------------------
 include/linux/set_memory.h     |  4 ++--
 4 files changed, 21 insertions(+), 41 deletions(-)

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
index 9abc6077d768..747614c3dd83 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1925,14 +1925,14 @@ int set_memory_wb(unsigned long addr, int numpages)
 }
 EXPORT_SYMBOL(set_memory_wb);
 
+static int _set_memory_present(unsigned long addr, int numpages)
+{
+	return change_page_attr_set(&addr, numpages, __pgprot(_PAGE_PRESENT), 0);
+}
+
 #ifdef CONFIG_X86_64
-/*
- * Prevent speculative access to the page by either unmapping
- * it (if we do not require access to any part of the page) or
- * marking it uncacheable (if we want to try to retrieve data
- * from non-poisoned lines in the page).
- */
-int set_mce_nospec(unsigned long pfn, bool unmap)
+/* Prevent speculative access to a page by marking it not-present */
+int set_mce_nospec(unsigned long pfn)
 {
 	unsigned long decoy_addr;
 	int rc;
@@ -1954,10 +1954,7 @@ int set_mce_nospec(unsigned long pfn, bool unmap)
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
@@ -1967,7 +1964,7 @@ EXPORT_SYMBOL(set_mce_nospec);
 /* Restore full speculative operation to the pfn. */
 int clear_mce_nospec(unsigned long pfn)
 {
-	return set_memory_wb((unsigned long) pfn_to_kaddr(pfn), 1);
+	return _set_memory_present((unsigned long) pfn_to_kaddr(pfn), 1);
 }
 EXPORT_SYMBOL(clear_mce_nospec);
 
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 58d95242a836..30c71a68175b 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -158,36 +158,19 @@ static blk_status_t pmem_do_write(struct pmem_device *pmem,
 			struct page *page, unsigned int page_off,
 			sector_t sector, unsigned int len)
 {
-	blk_status_t rc = BLK_STS_OK;
-	bool bad_pmem = false;
 	phys_addr_t pmem_off = sector * 512 + pmem->data_offset;
 	void *pmem_addr = pmem->virt_addr + pmem_off;
 
-	if (unlikely(is_bad_pmem(&pmem->bb, sector, len)))
-		bad_pmem = true;
+	if (unlikely(is_bad_pmem(&pmem->bb, sector, len))) {
+		blk_status_t rc = pmem_clear_poison(pmem, pmem_off, len);
 
-	/*
-	 * Note that we write the data both before and after
-	 * clearing poison.  The write before clear poison
-	 * handles situations where the latest written data is
-	 * preserved and the clear poison operation simply marks
-	 * the address range as valid without changing the data.
-	 * In this case application software can assume that an
-	 * interrupted write will either return the new good
-	 * data or an error.
-	 *
-	 * However, if pmem_clear_poison() leaves the data in an
-	 * indeterminate state we need to perform the write
-	 * after clear poison.
-	 */
+		if (rc != BLK_STS_OK)
+			pr_warn_ratelimited("%s: failed to clear poison\n", __func__);
+			return rc;
+	}
 	flush_dcache_page(page);
 	write_pmem(pmem_addr, page, page_off, len);
-	if (unlikely(bad_pmem)) {
-		rc = pmem_clear_poison(pmem, pmem_off, len);
-		write_pmem(pmem_addr, page, page_off, len);
-	}
-
-	return rc;
+	return BLK_STS_OK;
 }
 
 static void pmem_submit_bio(struct bio *bio)
diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index d6263d7afb55..cde2d8687a7b 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -43,10 +43,10 @@ static inline bool can_set_direct_map(void)
 #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 
 #ifdef CONFIG_X86_64
-int set_mce_nospec(unsigned long pfn, bool unmap);
+int set_mce_nospec(unsigned long pfn);
 int clear_mce_nospec(unsigned long pfn);
 #else
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

