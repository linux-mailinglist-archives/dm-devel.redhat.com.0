Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EECE4F3D6A
	for <lists+dm-devel@lfdr.de>; Tue,  5 Apr 2022 21:49:07 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-EaZ5a5xpNuOzMt1EI3gp5A-1; Tue, 05 Apr 2022 15:49:05 -0400
X-MC-Unique: EaZ5a5xpNuOzMt1EI3gp5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2479738009F7;
	Tue,  5 Apr 2022 19:49:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 063DE405D4CC;
	Tue,  5 Apr 2022 19:49:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C2D72193F6E7;
	Tue,  5 Apr 2022 19:49:01 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 55F751947BBD
 for <dm-devel@listman.corp.redhat.com>; Tue,  5 Apr 2022 19:49:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 392192026614; Tue,  5 Apr 2022 19:49:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32B9E2026609
 for <dm-devel@redhat.com>; Tue,  5 Apr 2022 19:48:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E289280016F
 for <dm-devel@redhat.com>; Tue,  5 Apr 2022 19:48:51 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-Orva6t7IOxeNVDdNLLg6lA-1; Tue, 05 Apr 2022 15:48:47 -0400
X-MC-Unique: Orva6t7IOxeNVDdNLLg6lA-1
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 235J49El006378; 
 Tue, 5 Apr 2022 19:48:37 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6d31f35g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Apr 2022 19:48:37 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 235JZiWJ031735; Tue, 5 Apr 2022 19:48:36 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f6cx41e0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Apr 2022 19:48:36 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com (2603:10b6:a03:2d1::14)
 by BN6PR10MB1425.namprd10.prod.outlook.com (2603:10b6:404:42::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 19:48:34 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com
 ([fe80::1c44:15ca:b5c2:603e]) by SJ0PR10MB4429.namprd10.prod.outlook.com
 ([fe80::1c44:15ca:b5c2:603e%7]) with mapi id 15.20.5123.030; Tue, 5 Apr 2022
 19:48:34 +0000
From: Jane Chu <jane.chu@oracle.com>
To: david@fromorbit.com, djwong@kernel.org, dan.j.williams@intel.com,
 hch@infradead.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
 agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
 ira.weiny@intel.com, willy@infradead.org, vgoyal@redhat.com,
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, x86@kernel.org
Date: Tue,  5 Apr 2022 13:47:47 -0600
Message-Id: <20220405194747.2386619-7-jane.chu@oracle.com>
In-Reply-To: <20220405194747.2386619-1-jane.chu@oracle.com>
References: <20220405194747.2386619-1-jane.chu@oracle.com>
X-ClientProxiedBy: SA9PR13CA0054.namprd13.prod.outlook.com
 (2603:10b6:806:22::29) To SJ0PR10MB4429.namprd10.prod.outlook.com
 (2603:10b6:a03:2d1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 314a8693-092b-4e4f-7fbe-08da173d44b5
X-MS-TrafficTypeDiagnostic: BN6PR10MB1425:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1425F69EEF77F15E1973ACF1F3E49@BN6PR10MB1425.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: Cvf0QIcMRzKwYT5ZnJ+heSXx0XGnPa8D3mT0IbO4RVwqypPuHJq7ojPElQAcl9VsjKmSS5e3MsSOKjg2WcH/eQrAu3EcrmYhhTjl7qVesiyTry/cHI/lvGnTIkArLIJtzL13XouS0u78EqvEWjA7uRZHpYI5/09ha+OSYBgAaaMor/XrInOzFio3umcIbHWBHPGxDZPhBo48jynw2cq+djg5FGkp5qGpAUYXP8uDqOFTLIMVOvIl4lY/g0ulfv2kPkbXdveaCnrVnMYiLsIfZwtU+7kxwc8amYFiEMEJ1mUbrP2YvN4kHWvRG3h/0YOjHI7qDNgsSE863+CmHNF/FeThAXkCzfEQM5KXdsBlCesOIK8Flz/OE4rDzaI/hGAVZI9olmPUnph78VD0I1E2rfwQRqkAAdFeYzq4bzFOcNuh/0wd/SJlqhaWQpSjGqgCVlqS8ocjvXPAhmBW7bgmkC4xGv/stqsxdOw8XVIG69PQLwlBlrgx5hCld7zdwqF+R+i3/v4a1K2/bJ4ElrtXjASh2J6nKS5W+OrjpMQc/RCBCykfs5G0ZcMo0Afy7rIfnbiKJOnad1eyWrGyefb0BtgxE/tPFhLR3eBSnoDKyOSi8rJ0wfVO5zxGomSAKkePZXx24llAksFLBt8L+iEE2eVTgpUcE4cN68R+ed9JmP/3J7/pWzxCzM6HRObxAtsr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4429.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(66946007)(5660300002)(86362001)(44832011)(36756003)(921005)(83380400001)(6666004)(2906002)(38100700002)(66556008)(6506007)(2616005)(8676002)(508600001)(66476007)(186003)(7416002)(1076003)(6486002)(52116002)(6512007)(316002);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xR9JhUiXKTlWPxTQjKG0YfRWjyZVrpo2p6+omiSJ7/Oeor/vOyj3pMYo6LDW?=
 =?us-ascii?Q?nJc9RaJQxRDZWny3TGgshtbmwGEheTpGIxU309r0DwiwtRuUBdIqXjG4jiQm?=
 =?us-ascii?Q?6td25hnJ3ljOO+nB19VlDrmOJk618SAv8lVEcaS5wDI+1VxOIzUrU8pNRCeY?=
 =?us-ascii?Q?b4DeSYuyJ8Ti2vvG+QOO2QAeC9ULoJa6awPLhrPbv+a7Ss4p9q4b1oulUUWz?=
 =?us-ascii?Q?Ev2sW+RYmxrndbqhFQxn38KEt8DNeCnU/dDsc0YLNQg/xc8Vb3UcTRygCcy6?=
 =?us-ascii?Q?X1gw7fpZCH8crcwMkMSlhDllyfmvRNWfNW06Jg5Ecnfe2gFhpM8QVtHubvOp?=
 =?us-ascii?Q?06Sb3Cwel6d/Z8x0vqSLoZ70NzVfAb1ApUmj2bhoKRPhIFj4W2pII+0246Rx?=
 =?us-ascii?Q?oxDYRoP6O8qhiNN+y2PCbqKmV9tXdc9YcrN5G47LQ/iwexLdTRcnIvB/i6+s?=
 =?us-ascii?Q?ew3nPR7cqLUASvk8A3dTsa88RcjSJzStQTzFS/Tzv1f8vdYFQ/ggjLYmRJX9?=
 =?us-ascii?Q?M4bRGSCF7fbCd6vgyxbIqH97ixwwMLdRuih4I1dK8O1yk0hztaqjJj9s8/7y?=
 =?us-ascii?Q?Zcgx1o8l0FTKo99WSiDXTcO/u1xf/nUkE78QLkD7/qQVhRimoDVTxgYgrfM3?=
 =?us-ascii?Q?lFEI8F80UONg2fshlIo5Chrtu3u7L9qbmdZ7mUOCdrMnoyGOdxk+nwTg3M52?=
 =?us-ascii?Q?pDVNvRRIf3IMlgUaznwqXv9y8Ty5BC9usPYylzTTEn12wX9coTCfuuDlJAO0?=
 =?us-ascii?Q?3I2VFlBvjtroIpmh4V235O2TEnOWIeFhY2wtlE52lSVmpRKK/0tMGzQFv5Q9?=
 =?us-ascii?Q?zMpybW8QEDMjdlQXq08NWDopzyB6crKlxhmdw7SIK1FTrjTNrNmD2+l2wwSI?=
 =?us-ascii?Q?nIIPzOg8AvMktBvfqhiJobQc5notBs61wMMUzmeSsde2HNA+f8x7O7w82xqq?=
 =?us-ascii?Q?kuwQxNUCTv6YQ4+vu853hReD+BTaq6m65rTxBFe9GqdYbLY1Fa4Gm1yPTBV1?=
 =?us-ascii?Q?OKEGRPLRZjfn4IsYs8pTJtKReU6uhJeSowGCW7XxdBl9iKUN/INbIcQquniG?=
 =?us-ascii?Q?9Z8wdao/7vhUBiAfiYFLRIytxq1SYA5neLjW/4MrU9tWUyYzZFysBpW5T3uK?=
 =?us-ascii?Q?22T2Op4tZcdr2Z22G1dvEznDYY58Tj//9gLvRvrMz5I8U8Y1L54CVLSGnXN/?=
 =?us-ascii?Q?NFQ85evOm5f/O9HHlD7XybfLI/mN7qyIVzWQPGnwiWkcmvWVRqyxyGegmG26?=
 =?us-ascii?Q?dX5jeII6UK/XOMQQUys3axO7aqHOP4YF/YWxack4f1edCOI0tsza4InfgiY0?=
 =?us-ascii?Q?pEY1ozNtNam8SLw5yEX2/sCdq11HRlEBgdPM7nCAwE6CgS9FO2v63sgNXGmf?=
 =?us-ascii?Q?gWpgeGASy2S5BHSBvCS3ZXQck5fRE6CNkgh/0xlXlLHFWfmHpX53/CO2ABF8?=
 =?us-ascii?Q?pnsn3Slj6QxBcHB6TrBokMNeMxKYvjLeIRyaXK4GIqGJ/WWtuCxBD85Tq5hX?=
 =?us-ascii?Q?7pdqUvgOY6pAVhIacu6NKNd9WCCePA8U8QbNtEyOMQzpokjnzRWcdvYnHYEA?=
 =?us-ascii?Q?twOJUG1fB4CLVqROywyKulK+hUIKnkAA6Rib4zA3kAn04Kz4Ip5S+6y4DTcD?=
 =?us-ascii?Q?KGbmkZWggLAbwNDv3FrHdgqjFRgc/ZWsRtl29d1+mzduTwlCddo9OxS7GOZf?=
 =?us-ascii?Q?5o/HwIL4/wyCWXmQI4KW0Ah5/FPZmuTsLKSdpP7wy8FuaD6A2L29XTdxmRtB?=
 =?us-ascii?Q?EqpX6NpVgi+bKiWqtz7CvNyYIb9ibhk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314a8693-092b-4e4f-7fbe-08da173d44b5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4429.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 19:48:34.1098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3UdAqAOEYNin336Ba2NAUyPJY7ZYsLu0a7PVUZxH1JpE237wYXvh4qXiM4BfPsc4KhwR8Qf40aC6h0zejyuoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1425
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-05_06:2022-04-04,
 2022-04-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204050110
X-Proofpoint-GUID: 57AMf8yeafZCkqUbTqjiCZLp15ydsdBc
X-Proofpoint-ORIG-GUID: 57AMf8yeafZCkqUbTqjiCZLp15ydsdBc
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [dm-devel] [PATCH v7 6/6] pmem: implement pmem_recovery_write()
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The recovery write thread started out as a normal pwrite thread and
when the filesystem was told about potential media error in the
range, filesystem turns the normal pwrite to a dax_recovery_write.

The recovery write consists of clearing media poison, clearing page
HWPoison bit, reenable page-wide read-write permission, flush the
caches and finally write.  A competing pread thread will be held
off during the recovery process since data read back might not be
valid, and this is achieved by clearing the badblock records after
the recovery write is complete. Competing recovery write threads
are serialized by pmem device level .recovery_lock.

Signed-off-by: Jane Chu <jane.chu@oracle.com>
---
 drivers/nvdimm/pmem.c | 60 ++++++++++++++++++++++++++++++++++++++++++-
 drivers/nvdimm/pmem.h |  1 +
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 56596be70400..b868a88a0d58 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -340,10 +340,67 @@ static const struct dax_operations pmem_dax_ops = {
 	.zero_page_range = pmem_dax_zero_page_range,
 };
 
+/*
+ * The recovery write thread started out as a normal pwrite thread and
+ * when the filesystem was told about potential media error in the
+ * range, filesystem turns the normal pwrite to a dax_recovery_write.
+ *
+ * The recovery write consists of clearing media poison, clearing page
+ * HWPoison bit, reenable page-wide read-write permission, flush the
+ * caches and finally write.  A competing pread thread will be held
+ * off during the recovery process since data read back might not be
+ * valid, and this is achieved by clearing the badblock records after
+ * the recovery write is complete. Competing recovery write threads
+ * are serialized by pmem device level .recovery_lock.
+ */
 static size_t pmem_recovery_write(struct dev_pagemap *pgmap, pgoff_t pgoff,
 		void *addr, size_t bytes, void *iter)
 {
-	return 0;
+	struct pmem_device *pmem = pgmap->owner;
+	size_t olen, len, off;
+	phys_addr_t pmem_off;
+	struct device *dev = pmem->bb.dev;
+	long cleared;
+
+	if (!pmem) {
+		dev_warn(dev, "pgmap->owner field not set, cannot recover\n");
+		return 0;
+	}
+
+	off = (unsigned long)addr & ~PAGE_MASK;
+	len = PFN_PHYS(PFN_UP(off + bytes));
+	if (!is_bad_pmem(&pmem->bb, PFN_PHYS(pgoff) >> SECTOR_SHIFT, len))
+		return _copy_from_iter_flushcache(addr, bytes, iter);
+
+	/*
+	 * Not page-aligned range cannot be recovered. This should not
+	 * happen unless something else went wrong.
+	 */
+	if (off || !(PAGE_ALIGNED(bytes))) {
+		dev_warn(dev, "Found poison, but addr(%p) or bytes(%#lx) not page aligned\n",
+			addr, bytes);
+		return 0;
+	}
+
+	mutex_lock(&pmem->recovery_lock);
+	pmem_off = PFN_PHYS(pgoff) + pmem->data_offset;
+	cleared = __pmem_clear_poison(pmem, pmem_off, len);
+	if (cleared > 0 && cleared < len) {
+		dev_warn(dev, "poison cleared only %ld out of %lu\n",
+			cleared, len);
+		mutex_unlock(&pmem->recovery_lock);
+		return 0;
+	} else if (cleared < 0) {
+		dev_warn(dev, "poison clear failed: %ld\n", cleared);
+		mutex_unlock(&pmem->recovery_lock);
+		return 0;
+	}
+
+	olen = _copy_from_iter_flushcache(addr, bytes, iter);
+	pmem_clear_bb(pmem, to_sect(pmem, pmem_off), cleared >> SECTOR_SHIFT);
+
+	mutex_unlock(&pmem->recovery_lock);
+	return olen;
 }
 
 static ssize_t write_cache_show(struct device *dev,
@@ -533,6 +590,7 @@ static int pmem_attach_disk(struct device *dev,
 	if (rc)
 		goto out_cleanup_dax;
 	dax_write_cache(dax_dev, nvdimm_has_cache(nd_region));
+	mutex_init(&pmem->recovery_lock);
 	pmem->dax_dev = dax_dev;
 
 	rc = device_add_disk(dev, disk, pmem_attribute_groups);
diff --git a/drivers/nvdimm/pmem.h b/drivers/nvdimm/pmem.h
index e9c53d42c488..d44f6da34009 100644
--- a/drivers/nvdimm/pmem.h
+++ b/drivers/nvdimm/pmem.h
@@ -25,6 +25,7 @@ struct pmem_device {
 	struct dax_device	*dax_dev;
 	struct gendisk		*disk;
 	struct dev_pagemap	pgmap;
+	struct mutex		recovery_lock;
 };
 
 long __pmem_direct_access(struct pmem_device *pmem, pgoff_t pgoff,
-- 
2.18.4

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

