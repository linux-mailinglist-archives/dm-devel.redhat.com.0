Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD774A02CD
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jan 2022 22:33:06 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-wuHY3dLRNx2DBEjw60JRPw-1; Fri, 28 Jan 2022 16:33:03 -0500
X-MC-Unique: wuHY3dLRNx2DBEjw60JRPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 829328145E2;
	Fri, 28 Jan 2022 21:32:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4539610D0;
	Fri, 28 Jan 2022 21:32:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4981A4CA93;
	Fri, 28 Jan 2022 21:32:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20SLWmUP018777 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Jan 2022 16:32:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A331C48FB09; Fri, 28 Jan 2022 21:32:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E7314021B4
	for <dm-devel@redhat.com>; Fri, 28 Jan 2022 21:32:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 811BF185A7B2
	for <dm-devel@redhat.com>; Fri, 28 Jan 2022 21:32:48 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-529-hTzr25weOn2J9HgGEMfY0Q-1; Fri, 28 Jan 2022 16:32:43 -0500
X-MC-Unique: hTzr25weOn2J9HgGEMfY0Q-1
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	20SK3xK2005724; Fri, 28 Jan 2022 21:32:36 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by mx0b-00069f02.pphosted.com with ESMTP id 3duwub4cvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jan 2022 21:32:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20SLRAqG184491;
	Fri, 28 Jan 2022 21:32:34 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
	(mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by userp3030.oracle.com with ESMTP id 3dr726n024-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jan 2022 21:32:34 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com (2603:10b6:a03:2d1::14)
	by DS7PR10MB5022.namprd10.prod.outlook.com (2603:10b6:5:3a3::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15;
	Fri, 28 Jan 2022 21:32:32 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com
	([fe80::d034:a8db:9e32:acde]) by
	SJ0PR10MB4429.namprd10.prod.outlook.com
	([fe80::d034:a8db:9e32:acde%5]) with mapi id 15.20.4930.018;
	Fri, 28 Jan 2022 21:32:32 +0000
From: Jane Chu <jane.chu@oracle.com>
To: david@fromorbit.com, djwong@kernel.org, dan.j.williams@intel.com,
	hch@infradead.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
	ira.weiny@intel.com, willy@infradead.org, vgoyal@redhat.com,
	linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org
Date: Fri, 28 Jan 2022 14:31:49 -0700
Message-Id: <20220128213150.1333552-7-jane.chu@oracle.com>
In-Reply-To: <20220128213150.1333552-1-jane.chu@oracle.com>
References: <20220128213150.1333552-1-jane.chu@oracle.com>
X-ClientProxiedBy: SN7PR04CA0071.namprd04.prod.outlook.com
	(2603:10b6:806:121::16) To SJ0PR10MB4429.namprd10.prod.outlook.com
	(2603:10b6:a03:2d1::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 735031a9-4eef-4c8b-24bc-08d9e2a5b18a
X-MS-TrafficTypeDiagnostic: DS7PR10MB5022:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB502272960C8913518521B004F3229@DS7PR10MB5022.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: xHUiZFZSvrvzTECb8svQVbU335TU5NhA0EOPEucoiEUcKtROlsxHYW/G2+yiTPPFx8TRK199V599pc3+vRCKiy0L07z15IbsqhalW7M/o5wHAz9jHQEtiBFk7sBSCc/Z/cMzZ+G2bEMwPxuPQFXVf/R5PUTrcij6el0aNoFYknzV+QWNJToaCh1Mst23UzL+KL16mtwHQ7OfSR9Dek+1pmPWl9kJBdY9qh7ecATbjLXb71DFa+2k/vUjbTaZsBpZXXuNhrHzwxT5U/RsqoNPrrQqjnO4g1hFEIVZKZvkR/fBjOEdt+ZIBfnMzDvnOzdpavpRpNKnzV/pkpHUq12LlQQCr6MMf8MLrD/qaOmTRXdqwckqBZxBbQiSv7a8oMtG5m8D7hTdPT2pRwELCvQxchBDbEuQ+QXZo3CBJWR6w4/A5YpqLX7Ksan6YGm0rwWS6pfpzYqUESbkTKvduo6nzSTS8Aga8pyBDW4+7W9pkj0BCXZuhqbKmjdr2/fVOGol234tbjR1vCkc5RBm+KLq+8KxoNZ21m6U96CuR5zU/589SlH2XMZ8oDbBbrVTWSJMGix/4IMDyOs6/1w34uRJTCiLnqtpN6YdMmjJLslYgPyU/uSU6+clu5LXy3NWCkfht+8YVt8JvLlTnt0EmOxG9c1v2X5HOuy8kjgFP2clxbUC597mkXIRNn43s97nsE13ZMrKKy8IN00xlKkFI+RaGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR10MB4429.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(13230001)(366004)(6506007)(6512007)(6666004)(83380400001)(2906002)(8936002)(52116002)(66946007)(508600001)(66556008)(66476007)(36756003)(86362001)(6486002)(316002)(186003)(1076003)(2616005)(7416002)(38100700002)(921005)(5660300002)(44832011)(8676002)(20210929001);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?34kDvhgJuealC8TDJchq52Qc62r2OYvSaEEZx78Vt3eeHZnIDdKuL8s/n8St?=
	=?us-ascii?Q?z244tECZeO5oHkB2cxXnSKNo2sbaEYg2XjbRc6XKQVFJ17kI25VZeaj/kyj4?=
	=?us-ascii?Q?3LDz7llU4ZA80BbLrd+8hH0lv1zukarsVZ4W1mRW0oXBVXXTWpK000v61Uc3?=
	=?us-ascii?Q?SMIPIJPg+v3a4BZOI/r3dcFwD4mMdxI13g49RR2HkhK8LE9YN2SlW9es3W2W?=
	=?us-ascii?Q?bxyaGN9bVtNPuZyfLPTNkaCn3WFLRBTmHd45X8Rf1MCn5wKNGHYD5qly3ZLt?=
	=?us-ascii?Q?lufmdh8mvs8SPxn3Ge4nlCB+pdl1olxECXBwMnt4csNTpWzxLiJoAKJIfLoU?=
	=?us-ascii?Q?Se/Xit0WYLarcoE7HzVLE3lcCuJ8XXSrnh26MrgEA+oFflkHwtoHCFCIXUrS?=
	=?us-ascii?Q?ihATeozJISa3jQpfXKx71pnOZ+O8fzgDDKwRT6cOqZW0hV5RqLFmI55oIzp7?=
	=?us-ascii?Q?CN8VAm9pMRB1NWyOudI5c6j8go/SPV7ke9wZuLZpmliMj8db+2P64O/eQuqN?=
	=?us-ascii?Q?1tRFvlmw1/k0oq24KSb429q9VgqlBiEvdYpOo4vdLfpJBHu1aP0TzmJoBHW2?=
	=?us-ascii?Q?BykfKTgNPMxX6lA2nQkUXb57RE00VL11o4AThYf7DQB2VClyCD0ZodXKxTd0?=
	=?us-ascii?Q?bICghxMOuyptt0/8r1oa0AXllhpt1GDUAhCQoPDDWGJvP1NDlqJoMU74toVs?=
	=?us-ascii?Q?MpN+AORCDQBNkMC9EEnQE07YtTmfY7F37OCTuTpN5lsOyh+yNxwP54tOfqck?=
	=?us-ascii?Q?GYYeLKoueg5a4ARxdS7WPHOHZBz4dKA1qhOIZBLJV8DDgycV5MTZLl7h/1gX?=
	=?us-ascii?Q?9ocB0cpPDYcBU6gSFT7YbaO3pao31pFkkZjd9D3FDVYoPVqonJ5IT2hx690A?=
	=?us-ascii?Q?1gu1/B4gujDpLjw5w81nIhmXzwHpQDDFYZyMw4g7x7WO5KJ7XQqoJsUxPlWC?=
	=?us-ascii?Q?Y/q/2fpWzCHMKqGu+pycMJSx853C0pPem/JhzwXo11+gQbxsAp5Tt0O7uVMF?=
	=?us-ascii?Q?q8mvOmuApvWEXqsmWfWHdPDpHOmxKhkjebrQHUEScLXzuWf1vE6OeWZubIF2?=
	=?us-ascii?Q?AdSA4TSqIedD1F/NnPcQtfMRniWW8fudulld5lJoL/rGHlIhngHY59CebrA4?=
	=?us-ascii?Q?9Z6Fhxl7CVn7bov8yCBEXdMSS1gt/u/yXkMcFiyjBKWKSunxmwITiJ1Xnq85?=
	=?us-ascii?Q?yDyD6syLujR6vy2FUBIvLeIBO6cRxcXNJRb7uBbXlJbvkmtejdBPg8k3tGTG?=
	=?us-ascii?Q?UDBzhPZ94tXAXITo+dl7/UJrttHXPEVcHFH9hb6q9L9Qy5sUgxwQm/Ub2lZI?=
	=?us-ascii?Q?7DY3nE2o12UKUP2yNVQxDw4cGTDEr6ArRS9tcqOiuRSNxUBTapWW5VBtdsov?=
	=?us-ascii?Q?7pbv1cN49bv8Ztv2G0RqIjViCAuqUkzumUzuYvdwrVgx/jvgkT3FFTpXjQ5t?=
	=?us-ascii?Q?qraFAtz98gQMBCNZs5qIOrwWV7NAmQcerIbHMuSpDVxDmrz4NZ1v0J/Q0jQy?=
	=?us-ascii?Q?24d2AxNVkeAU0vIwqUT4x48zovSEhoHLPVuQikqcpzPvn/iGJeUmtTlmOtQO?=
	=?us-ascii?Q?RWJ6V6g2AoR+w20DEElLiQn2AWc3w8twMtm7aDYmfZC5UHKt5JHwvP2cSsQn?=
	=?us-ascii?Q?RS+//AoxBoZUi1H0geZQ6z1h2QkckUUq/3L7yfSaO4eN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 735031a9-4eef-4c8b-24bc-08d9e2a5b18a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4429.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 21:32:32.6831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bL/L5hP8gAtm7qHotDUVO9CFj7Uoo0M/M+xsv7x6H6B8/Lhm9LBu/LeQXYCxHo0ojeO6Rpbs72c0iYOMf19KDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5022
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10241
	signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
	mlxlogscore=999
	adultscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
	suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2201110000 definitions=main-2201280122
X-Proofpoint-GUID: UZwckryaTJEVRlm0H2FJP-UvsoJZYcC2
X-Proofpoint-ORIG-GUID: UZwckryaTJEVRlm0H2FJP-UvsoJZYcC2
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH v5 6/7] dax: add recovery_write to dax_iomap_iter
	in failure path
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dax_iomap_iter() fails if the destination range contains poison.
Add recovery_write to the failure code path.

Signed-off-by: Jane Chu <jane.chu@oracle.com>
---
 fs/dax.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index cd03485867a7..236675bd5946 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1199,6 +1199,8 @@ int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
 }
 EXPORT_SYMBOL_GPL(dax_truncate_page);
 
+typedef size_t (*iter_func_t)(struct dax_device *dax_dev, pgoff_t pgoff,
+		void *addr, size_t bytes, struct iov_iter *i);
 static loff_t dax_iomap_iter(const struct iomap_iter *iomi,
 		struct iov_iter *iter)
 {
@@ -1210,6 +1212,7 @@ static loff_t dax_iomap_iter(const struct iomap_iter *iomi,
 	ssize_t ret = 0;
 	size_t xfer;
 	int id;
+	iter_func_t write_func = dax_copy_from_iter;
 
 	if (iov_iter_rw(iter) == READ) {
 		end = min(end, i_size_read(iomi->inode));
@@ -1249,6 +1252,17 @@ static loff_t dax_iomap_iter(const struct iomap_iter *iomi,
 
 		map_len = dax_direct_access(dax_dev, pgoff, PHYS_PFN(size),
 				&kaddr, NULL);
+		if ((map_len == -EIO) && (iov_iter_rw(iter) == WRITE)) {
+			if (dax_prep_recovery(dax_dev, &kaddr) < 0) {
+				ret = map_len;
+				break;
+			}
+			map_len = dax_direct_access(dax_dev, pgoff,
+					PHYS_PFN(size), &kaddr, NULL);
+			if (map_len > 0)
+				write_func = dax_recovery_write;
+		}
+
 		if (map_len < 0) {
 			ret = map_len;
 			break;
@@ -1261,12 +1275,17 @@ static loff_t dax_iomap_iter(const struct iomap_iter *iomi,
 			map_len = end - pos;
 
 		if (iov_iter_rw(iter) == WRITE)
-			xfer = dax_copy_from_iter(dax_dev, pgoff, kaddr,
-					map_len, iter);
+			xfer = write_func(dax_dev, pgoff, kaddr, map_len, iter);
 		else
 			xfer = dax_copy_to_iter(dax_dev, pgoff, kaddr,
 					map_len, iter);
 
+		if (xfer == (ssize_t) -EIO) {
+			pr_warn("dax_ioma_iter: write_func returns -EIO\n");
+			ret = -EIO;
+			break;
+		}
+
 		pos += xfer;
 		length -= xfer;
 		done += xfer;
-- 
2.18.4

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

