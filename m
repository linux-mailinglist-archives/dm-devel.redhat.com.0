Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E57446FB9
	for <lists+dm-devel@lfdr.de>; Sat,  6 Nov 2021 19:07:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-X96uDYNaM3aYQXjBJCuPHQ-1; Sat, 06 Nov 2021 14:07:04 -0400
X-MC-Unique: X96uDYNaM3aYQXjBJCuPHQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFA7B804140;
	Sat,  6 Nov 2021 18:06:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E43217155;
	Sat,  6 Nov 2021 18:06:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A7F64A703;
	Sat,  6 Nov 2021 18:06:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A6I6e3g012530 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 6 Nov 2021 14:06:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A107840CFD13; Sat,  6 Nov 2021 18:06:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9211540CFD10
	for <dm-devel@redhat.com>; Sat,  6 Nov 2021 18:06:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 660B7100DDF5
	for <dm-devel@redhat.com>; Sat,  6 Nov 2021 18:06:40 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-184-8GorVs8VP86Bnv8styWqRw-1; Fri, 05 Nov 2021 21:17:45 -0400
X-MC-Unique: 8GorVs8VP86Bnv8styWqRw-1
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	1A5MiJrF021985; Sat, 6 Nov 2021 01:17:11 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by mx0b-00069f02.pphosted.com with ESMTP id 3c4t7f5egq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 06 Nov 2021 01:17:11 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A61786m127298;
	Sat, 6 Nov 2021 01:17:10 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
	(mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by userp3030.oracle.com with ESMTP id 3c5etrsyru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 06 Nov 2021 01:17:09 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com (2603:10b6:a03:2d1::14)
	by SJ0PR10MB5890.namprd10.prod.outlook.com (2603:10b6:a03:3ef::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13;
	Sat, 6 Nov 2021 01:17:07 +0000
Received: from SJ0PR10MB4429.namprd10.prod.outlook.com
	([fe80::418c:dfe4:f3ee:feaa]) by
	SJ0PR10MB4429.namprd10.prod.outlook.com
	([fe80::418c:dfe4:f3ee:feaa%6]) with mapi id 15.20.4669.013;
	Sat, 6 Nov 2021 01:17:07 +0000
From: Jane Chu <jane.chu@oracle.com>
To: david@fromorbit.com, djwong@kernel.org, dan.j.williams@intel.com,
	hch@infradead.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
	ira.weiny@intel.com, willy@infradead.org, vgoyal@redhat.com,
	linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org
Date: Fri,  5 Nov 2021 19:16:37 -0600
Message-Id: <20211106011638.2613039-2-jane.chu@oracle.com>
In-Reply-To: <20211106011638.2613039-1-jane.chu@oracle.com>
References: <20211106011638.2613039-1-jane.chu@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0357.namprd03.prod.outlook.com
	(2603:10b6:a03:39c::32) To SJ0PR10MB4429.namprd10.prod.outlook.com
	(2603:10b6:a03:2d1::14)
MIME-Version: 1.0
Received: from brm-x62-16.us.oracle.com (2606:b400:8004:44::1c) by
	SJ0PR03CA0357.namprd03.prod.outlook.com (2603:10b6:a03:39c::32)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11
	via Frontend Transport; Sat, 6 Nov 2021 01:17:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65e48592-b218-4f9c-3521-08d9a0c3261a
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5890:
X-Microsoft-Antispam-PRVS: <SJ0PR10MB58908BC160ED6CEA16C1A3DAF38F9@SJ0PR10MB5890.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: eyrR+PlG+0mdHSythY/mgEWweknqhLFYxBI7C2o5mUfhIgSDvhbmclww6+FIcAzy/xZl4wEd0zpm7Uwahsye0lEQo48jIqoIUJ6GZgJhGU9oNDZWvEP4/Av9MkxQKSU7IFGZwDxOBFIRGD6P49vZPTjbzwbI/BUF9JqbGvzc1rbLZvD3CfcfCuvoZbICfDrfQpncx2H5EWJORgKcz2bjl+NdwT4Rm/ZoOhU9m2hqGnnxWH/gbwdVvwkWxeZVwl2C4+gRMJTFzLHweLf4yYHGWsQjaO9Y5qgjw0V3Xkn3z2IWqvLW7XPMdMbaYMRJiN2GlW3yekwPybYnSeXbV5pgolu7/UCTrk42xtMIvRc08CKSsO/trJItHAnm099o/FY34loN8zO5ytV5/NVHtKutSl4+rdz8/7DhkqACOIhowr6n5B8B31gBT/Q/Goj+XA00Q+FudEno+gRNWdSiC/1Ce1z3kFeqo01jBXYr8TLgbpr+yEOyiY6WkMGESHbO6f6n0wJqIG0ZbNyWDVzmCJj53sxPQmhzKhf7jzYJjR4zeIkm2rngEmytcZu+4sM458BoXjkaLnOvkzajKZQcZxfE6OyU/2/E4zFyITp5xUbZV1+3Rz6K9DqWsn2Ecm3Zg0K/xk7Pf9W51b9K1btINAxbiboDZImbhCw1bt005nig3z6kxFJg54YHxKWZq14vuXCUB3j1hsmy2ALkcCKdWYnCZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:SJ0PR10MB4429.namprd10.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(366004)(921005)(36756003)(8676002)(316002)(86362001)(66476007)(66946007)(508600001)(2906002)(44832011)(6486002)(83380400001)(2616005)(5660300002)(186003)(52116002)(7416002)(7696005)(1076003)(6666004)(38100700002)(8936002)(66556008)(30864003);
	DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9sp6cOy9rgD1pqGUz4RxkF+gulsunrlqrNiJTqF8K2/VGbXSBPQcJSyrjPU7?=
	=?us-ascii?Q?tOFz6Z32acMcJI8nTjXBZP+i9mUXILXnL//dpepT+mmku0mSXzYaVvwtTPdZ?=
	=?us-ascii?Q?x2kBOuh/EHT5noWNJ4h31wKe4LtnTvjBQwr1ekLJopHiulROqxb8IFRwvA4i?=
	=?us-ascii?Q?p4UQ1/bO6JSaeY/sATH2Y6EATo/Z9fa7BrzL+LiLEDOv6HncjbVrJp18M/X6?=
	=?us-ascii?Q?CGT/nBu7Pevzn9LrLK5I41pJv7/W8yJLYcRLrnGwfp0EqbdkOPx6zVHYfFYa?=
	=?us-ascii?Q?6tdibVhUHR9GRPzBlCldXDvQaPwOIilsZOGszo0iNlftaJnrF7WnzJKrMgKR?=
	=?us-ascii?Q?qPXU6+3oEv2Ddhq2iKFL20zb8hvssdq6MTcXVe5WE+lwQvOvmfr/2pWvhOvh?=
	=?us-ascii?Q?a7P70qzqT1N9HSEs4ZR5+EV3r/12ETQSi/ZJzfNy4pu2ViIhzh0PC1mDzy9H?=
	=?us-ascii?Q?k0I1as26bh+fKOPcWqD6+7qGBv6Dak2oLw8aY1rGAsqOt8Ab16SIMnPw8RnC?=
	=?us-ascii?Q?WC0F0tpOAH/MZuN+ga8b4CjTJUp8Rbq1RQR750ClCbM+ilzLVjFx/h5ibj3X?=
	=?us-ascii?Q?WJVj/uYvavi5Pv3an6jyKIk12Do2aMyjggKMwHchS0iq/anL40IZX98kbfQ2?=
	=?us-ascii?Q?Gh0f07iQVebCmiGyazxySL8VVA68bcAS5RxUpsgBDSu0oKLGC6Wwpgv6FH8d?=
	=?us-ascii?Q?VBsx6nfWv79YtFB1DBH0wm8CBw7fMLjQSJpBMBzH2cPRNx/4tYmqRdxMUCTH?=
	=?us-ascii?Q?vy4FvoC6y/H8OBXRNBa85QE68xYvCAEvo2F6UmvtDqp4SgCX7w0WggS+dh0I?=
	=?us-ascii?Q?3GAA4G6D+M4lP63zlo/WHeqKt7NDV5+qvXCDWJlfI5gO1MCYS5EqU3rQA1Wd?=
	=?us-ascii?Q?dOLuxgKNC9iSCT4qvZ4HpAHgXEg23L+vS2RVNwIdRhSZS9ZkRTABBSpqkxsR?=
	=?us-ascii?Q?UaMc5RqHPGoA1h63pyu2vo7blCCfpfEZANwAnOa+hz2tmKuyykosEuyCo/iP?=
	=?us-ascii?Q?p3gA5jimsNCc6DNiQ4fYP5b2Y3YpvbJHc5dEvsU1qam4dZn1rOgGUBVPtpNv?=
	=?us-ascii?Q?KlH4DrZJuN4AtROyI20sKe4CxtbtJwoJAWFqOMKOaXgxSXN9qXAGku22fj43?=
	=?us-ascii?Q?8+nKoYatL8b2qE+53Cm5VkOf0MF2/AYSSH3/EznJRJYD9NNFzkvWfvbFKf1f?=
	=?us-ascii?Q?WHQTCzxzWhnxuu9yWIVL/zMTGFC87p/mU2HEw5MQMxfbgUTImnfVmIqcMVIU?=
	=?us-ascii?Q?PtIfM9Yeesw3x1EBxeHcBku5LCzc09+VsfNpcejdxAviN0L1dSfJOdOJRRRs?=
	=?us-ascii?Q?oXAKrcLC92IHaEJOcLOkZ5Tx9mey0LShsdDqsdw47OBeGmv1vCQ7hAmV7GcA?=
	=?us-ascii?Q?8IatPX6daM9ww8CJBpYmm4H1LcEDG4Akur0hjD8RYomI+K/19Eapezc82GGs?=
	=?us-ascii?Q?PjXt0zRUmfIQb1fiWG2tJr6gvGnnT+rq1kz2AjqtJHdwoJod0vrjTfAgsWJX?=
	=?us-ascii?Q?74Gy+LuaOx+mRGDkCrT3fZ1zYFRQaFS+g6lbP7h3/m73kEctf1X4lr/CiTN8?=
	=?us-ascii?Q?tQPIQoh4c5Wfr7X0M+ObsPV4LZdHESl3bctKQNi4c5Eh7oV76f1AtvHJWo6H?=
	=?us-ascii?Q?AK7WWME7QrCc9D/1EWGH1Y4L10iuEpayu5SjgzL53GDs?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e48592-b218-4f9c-3521-08d9a0c3261a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4429.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2021 01:17:07.0373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2exHhXcV9H/lBs0NRzIMAijXfuHE0hVfTdK8ZJymu1ZVA4l7r/eQ4BqQ7InHHFewH68XiwKOBnIX4L9D0mUyNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5890
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10159
	signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
	adultscore=0
	mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
	spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2110150000 definitions=main-2111060005
X-Proofpoint-ORIG-GUID: 44KRL2MPqggxMI4rqehMZNT6wF-GX24O
X-Proofpoint-GUID: 44KRL2MPqggxMI4rqehMZNT6wF-GX24O
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
Subject: [dm-devel] [PATCH v2 1/2] dax: Introduce normal and recovery dax
	operation modes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce DAX_OP_NORMAL and DAX_OP_RECOVERY operation modes to
{dax_direct_access, dax_copy_from_iter, dax_copy_to_iter}.
DAX_OP_NORMAL is the default or the existing mode, and
DAX_OP_RECOVERY is a new mode for data recovery purpose.

When dax-FS suspects dax media error might be encountered
on a read or write, it can enact the recovery mode read or write
by setting DAX_OP_RECOVERY in the aforementioned APIs. A read
in recovery mode attempts to fetch as much data as possible
until the first poisoned page is encountered. A write in recovery
mode attempts to clear poison(s) in a page-aligned range and
then write the user provided data over.

DAX_OP_NORMAL should be used for all non-recovery code path.

Signed-off-by: Jane Chu <jane.chu@oracle.com>
---
 drivers/dax/super.c             | 15 +++++++++------
 drivers/md/dm-linear.c          | 14 ++++++++------
 drivers/md/dm-log-writes.c      | 19 +++++++++++--------
 drivers/md/dm-stripe.c          | 14 ++++++++------
 drivers/md/dm-target.c          |  2 +-
 drivers/md/dm-writecache.c      |  8 +++++---
 drivers/md/dm.c                 | 14 ++++++++------
 drivers/nvdimm/pmem.c           | 11 ++++++-----
 drivers/nvdimm/pmem.h           |  2 +-
 drivers/s390/block/dcssblk.c    | 13 ++++++++-----
 fs/dax.c                        | 14 ++++++++------
 fs/fuse/dax.c                   |  4 ++--
 fs/fuse/virtio_fs.c             | 12 ++++++++----
 include/linux/dax.h             | 18 +++++++++++-------
 include/linux/device-mapper.h   |  5 +++--
 tools/testing/nvdimm/pmem-dax.c |  2 +-
 16 files changed, 98 insertions(+), 69 deletions(-)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index c0910687fbcb..90cae9d84b9c 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -110,6 +110,7 @@ enum dax_device_flags {
  * @dax_dev: a dax_device instance representing the logical memory range
  * @pgoff: offset in pages from the start of the device to translate
  * @nr_pages: number of consecutive pages caller can handle relative to @pfn
+ * @mode: indicate whether dax operation is in normal or recovery mode
  * @kaddr: output parameter that returns a virtual address mapping of pfn
  * @pfn: output parameter that returns an absolute pfn translation of @pgoff
  *
@@ -117,7 +118,7 @@ enum dax_device_flags {
  * pages accessible at the device relative @pgoff.
  */
 long dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff, long nr_pages,
-		void **kaddr, pfn_t *pfn)
+		int mode, void **kaddr, pfn_t *pfn)
 {
 	long avail;
 
@@ -131,7 +132,7 @@ long dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff, long nr_pages,
 		return -EINVAL;
 
 	avail = dax_dev->ops->direct_access(dax_dev, pgoff, nr_pages,
-			kaddr, pfn);
+			mode, kaddr, pfn);
 	if (!avail)
 		return -ERANGE;
 	return min(avail, nr_pages);
@@ -139,22 +140,24 @@ long dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff, long nr_pages,
 EXPORT_SYMBOL_GPL(dax_direct_access);
 
 size_t dax_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
-		size_t bytes, struct iov_iter *i)
+		size_t bytes, struct iov_iter *i, int mode)
 {
 	if (!dax_alive(dax_dev))
 		return 0;
 
-	return dax_dev->ops->copy_from_iter(dax_dev, pgoff, addr, bytes, i);
+	return dax_dev->ops->copy_from_iter(dax_dev, pgoff, addr, bytes, i,
+						mode);
 }
 EXPORT_SYMBOL_GPL(dax_copy_from_iter);
 
 size_t dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
-		size_t bytes, struct iov_iter *i)
+		size_t bytes, struct iov_iter *i, int mode)
 {
 	if (!dax_alive(dax_dev))
 		return 0;
 
-	return dax_dev->ops->copy_to_iter(dax_dev, pgoff, addr, bytes, i);
+	return dax_dev->ops->copy_to_iter(dax_dev, pgoff, addr, bytes, i,
+						mode);
 }
 EXPORT_SYMBOL_GPL(dax_copy_to_iter);
 
diff --git a/drivers/md/dm-linear.c b/drivers/md/dm-linear.c
index 90de42f6743a..c73ac6b98801 100644
--- a/drivers/md/dm-linear.c
+++ b/drivers/md/dm-linear.c
@@ -173,27 +173,29 @@ static struct dax_device *linear_dax_pgoff(struct dm_target *ti, pgoff_t *pgoff)
 }
 
 static long linear_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
-		long nr_pages, void **kaddr, pfn_t *pfn)
+		long nr_pages, int mode, void **kaddr, pfn_t *pfn)
 {
 	struct dax_device *dax_dev = linear_dax_pgoff(ti, &pgoff);
 
-	return dax_direct_access(dax_dev, pgoff, nr_pages, kaddr, pfn);
+	return dax_direct_access(dax_dev, pgoff, nr_pages, mode, kaddr, pfn);
 }
 
 static size_t linear_dax_copy_from_iter(struct dm_target *ti, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i)
+		void *addr, size_t bytes, struct iov_iter *i,
+		int mode)
 {
 	struct dax_device *dax_dev = linear_dax_pgoff(ti, &pgoff);
 
-	return dax_copy_from_iter(dax_dev, pgoff, addr, bytes, i);
+	return dax_copy_from_iter(dax_dev, pgoff, addr, bytes, i, mode);
 }
 
 static size_t linear_dax_copy_to_iter(struct dm_target *ti, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i)
+		void *addr, size_t bytes, struct iov_iter *i,
+		int mode)
 {
 	struct dax_device *dax_dev = linear_dax_pgoff(ti, &pgoff);
 
-	return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i);
+	return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i, mode);
 }
 
 static int linear_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index df3cd78223fb..1e9847f904ef 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -959,16 +959,18 @@ static struct dax_device *log_writes_dax_pgoff(struct dm_target *ti,
 }
 
 static long log_writes_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
-					 long nr_pages, void **kaddr, pfn_t *pfn)
+					 long nr_pages, int mode,
+					 void **kaddr, pfn_t *pfn)
 {
 	struct dax_device *dax_dev = log_writes_dax_pgoff(ti, &pgoff);
 
-	return dax_direct_access(dax_dev, pgoff, nr_pages, kaddr, pfn);
+	return dax_direct_access(dax_dev, pgoff, nr_pages, mode, kaddr, pfn);
 }
 
 static size_t log_writes_dax_copy_from_iter(struct dm_target *ti,
-					    pgoff_t pgoff, void *addr, size_t bytes,
-					    struct iov_iter *i)
+					    pgoff_t pgoff, void *addr,
+					    size_t bytes, struct iov_iter *i,
+					    int mode)
 {
 	struct log_writes_c *lc = ti->private;
 	sector_t sector = pgoff * PAGE_SECTORS;
@@ -985,16 +987,17 @@ static size_t log_writes_dax_copy_from_iter(struct dm_target *ti,
 		return 0;
 	}
 dax_copy:
-	return dax_copy_from_iter(dax_dev, pgoff, addr, bytes, i);
+	return dax_copy_from_iter(dax_dev, pgoff, addr, bytes, i, mode);
 }
 
 static size_t log_writes_dax_copy_to_iter(struct dm_target *ti,
-					  pgoff_t pgoff, void *addr, size_t bytes,
-					  struct iov_iter *i)
+					  pgoff_t pgoff, void *addr,
+					  size_t bytes, struct iov_iter *i,
+					  int mode)
 {
 	struct dax_device *dax_dev = log_writes_dax_pgoff(ti, &pgoff);
 
-	return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i);
+	return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i, mode);
 }
 
 static int log_writes_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
index 50dba3f39274..4c098452268b 100644
--- a/drivers/md/dm-stripe.c
+++ b/drivers/md/dm-stripe.c
@@ -317,27 +317,29 @@ static struct dax_device *stripe_dax_pgoff(struct dm_target *ti, pgoff_t *pgoff)
 }
 
 static long stripe_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
-		long nr_pages, void **kaddr, pfn_t *pfn)
+		long nr_pages, int mode, void **kaddr, pfn_t *pfn)
 {
 	struct dax_device *dax_dev = stripe_dax_pgoff(ti, &pgoff);
 
-	return dax_direct_access(dax_dev, pgoff, nr_pages, kaddr, pfn);
+	return dax_direct_access(dax_dev, pgoff, nr_pages, mode, kaddr, pfn);
 }
 
 static size_t stripe_dax_copy_from_iter(struct dm_target *ti, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i)
+		void *addr, size_t bytes, struct iov_iter *i,
+		int mode)
 {
 	struct dax_device *dax_dev = stripe_dax_pgoff(ti, &pgoff);
 
-	return dax_copy_from_iter(dax_dev, pgoff, addr, bytes, i);
+	return dax_copy_from_iter(dax_dev, pgoff, addr, bytes, i, mode);
 }
 
 static size_t stripe_dax_copy_to_iter(struct dm_target *ti, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i)
+		void *addr, size_t bytes, struct iov_iter *i,
+		int mode)
 {
 	struct dax_device *dax_dev = stripe_dax_pgoff(ti, &pgoff);
 
-	return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i);
+	return dax_copy_to_iter(dax_dev, pgoff, addr, bytes, i, mode);
 }
 
 static int stripe_dax_zero_page_range(struct dm_target *ti, pgoff_t pgoff,
diff --git a/drivers/md/dm-target.c b/drivers/md/dm-target.c
index 64dd0b34fcf4..2de1073dbad6 100644
--- a/drivers/md/dm-target.c
+++ b/drivers/md/dm-target.c
@@ -142,7 +142,7 @@ static void io_err_release_clone_rq(struct request *clone,
 }
 
 static long io_err_dax_direct_access(struct dm_target *ti, pgoff_t pgoff,
-		long nr_pages, void **kaddr, pfn_t *pfn)
+		long nr_pages, int mode, void **kaddr, pfn_t *pfn)
 {
 	return -EIO;
 }
diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 0af464a863fe..b2e4ff922fe2 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -286,7 +286,8 @@ static int persistent_memory_claim(struct dm_writecache *wc)
 
 	id = dax_read_lock();
 
-	da = dax_direct_access(wc->ssd_dev->dax_dev, offset, p, &wc->memory_map, &pfn);
+	da = dax_direct_access(wc->ssd_dev->dax_dev, offset, p, DAX_OP_NORMAL,
+				&wc->memory_map, &pfn);
 	if (da < 0) {
 		wc->memory_map = NULL;
 		r = da;
@@ -308,8 +309,9 @@ static int persistent_memory_claim(struct dm_writecache *wc)
 		i = 0;
 		do {
 			long daa;
-			daa = dax_direct_access(wc->ssd_dev->dax_dev, offset + i, p - i,
-						NULL, &pfn);
+			daa = dax_direct_access(wc->ssd_dev->dax_dev,
+						offset + i, p - i,
+						DAX_OP_NORMAL, NULL, &pfn);
 			if (daa <= 0) {
 				r = daa ? daa : -EINVAL;
 				goto err3;
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 282008afc465..dc354db22ef9 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1001,7 +1001,8 @@ static struct dm_target *dm_dax_get_live_target(struct mapped_device *md,
 }
 
 static long dm_dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
-				 long nr_pages, void **kaddr, pfn_t *pfn)
+				 long nr_pages, int mode, void **kaddr,
+				 pfn_t *pfn)
 {
 	struct mapped_device *md = dax_get_private(dax_dev);
 	sector_t sector = pgoff * PAGE_SECTORS;
@@ -1019,7 +1020,7 @@ static long dm_dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
 	if (len < 1)
 		goto out;
 	nr_pages = min(len, nr_pages);
-	ret = ti->type->direct_access(ti, pgoff, nr_pages, kaddr, pfn);
+	ret = ti->type->direct_access(ti, pgoff, nr_pages, mode, kaddr, pfn);
 
  out:
 	dm_put_live_table(md, srcu_idx);
@@ -1028,7 +1029,8 @@ static long dm_dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
 }
 
 static size_t dm_dax_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff,
-				    void *addr, size_t bytes, struct iov_iter *i)
+				    void *addr, size_t bytes,
+				    struct iov_iter *i, int mode)
 {
 	struct mapped_device *md = dax_get_private(dax_dev);
 	sector_t sector = pgoff * PAGE_SECTORS;
@@ -1044,7 +1046,7 @@ static size_t dm_dax_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff,
 		ret = copy_from_iter(addr, bytes, i);
 		goto out;
 	}
-	ret = ti->type->dax_copy_from_iter(ti, pgoff, addr, bytes, i);
+	ret = ti->type->dax_copy_from_iter(ti, pgoff, addr, bytes, i, mode);
  out:
 	dm_put_live_table(md, srcu_idx);
 
@@ -1052,7 +1054,7 @@ static size_t dm_dax_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff,
 }
 
 static size_t dm_dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i)
+		void *addr, size_t bytes, struct iov_iter *i, int mode)
 {
 	struct mapped_device *md = dax_get_private(dax_dev);
 	sector_t sector = pgoff * PAGE_SECTORS;
@@ -1068,7 +1070,7 @@ static size_t dm_dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff,
 		ret = copy_to_iter(addr, bytes, i);
 		goto out;
 	}
-	ret = ti->type->dax_copy_to_iter(ti, pgoff, addr, bytes, i);
+	ret = ti->type->dax_copy_to_iter(ti, pgoff, addr, bytes, i, mode);
  out:
 	dm_put_live_table(md, srcu_idx);
 
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 0d6633987552..3dc99e0bf633 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -255,7 +255,7 @@ static int pmem_rw_page(struct block_device *bdev, sector_t sector,
 
 /* see "strong" declaration in tools/testing/nvdimm/pmem-dax.c */
 __weak long __pmem_direct_access(struct pmem_device *pmem, pgoff_t pgoff,
-		long nr_pages, void **kaddr, pfn_t *pfn)
+		long nr_pages, int mode, void **kaddr, pfn_t *pfn)
 {
 	resource_size_t offset = PFN_PHYS(pgoff) + pmem->data_offset;
 
@@ -294,11 +294,12 @@ static int pmem_dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
 }
 
 static long pmem_dax_direct_access(struct dax_device *dax_dev,
-		pgoff_t pgoff, long nr_pages, void **kaddr, pfn_t *pfn)
+		pgoff_t pgoff, long nr_pages, int mode, void **kaddr,
+		pfn_t *pfn)
 {
 	struct pmem_device *pmem = dax_get_private(dax_dev);
 
-	return __pmem_direct_access(pmem, pgoff, nr_pages, kaddr, pfn);
+	return __pmem_direct_access(pmem, pgoff, nr_pages, mode, kaddr, pfn);
 }
 
 /*
@@ -308,13 +309,13 @@ static long pmem_dax_direct_access(struct dax_device *dax_dev,
  * dax_iomap_actor()
  */
 static size_t pmem_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i)
+		void *addr, size_t bytes, struct iov_iter *i, int mode)
 {
 	return _copy_from_iter_flushcache(addr, bytes, i);
 }
 
 static size_t pmem_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i)
+		void *addr, size_t bytes, struct iov_iter *i, int mode)
 {
 	return _copy_mc_to_iter(addr, bytes, i);
 }
diff --git a/drivers/nvdimm/pmem.h b/drivers/nvdimm/pmem.h
index 59cfe13ea8a8..bda6a898ba81 100644
--- a/drivers/nvdimm/pmem.h
+++ b/drivers/nvdimm/pmem.h
@@ -27,7 +27,7 @@ struct pmem_device {
 };
 
 long __pmem_direct_access(struct pmem_device *pmem, pgoff_t pgoff,
-		long nr_pages, void **kaddr, pfn_t *pfn);
+		long nr_pages, int mode, void **kaddr, pfn_t *pfn);
 
 #ifdef CONFIG_MEMORY_FAILURE
 static inline bool test_and_clear_pmem_poison(struct page *page)
diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index e65e83764d1c..fb9f768e12a1 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -32,7 +32,7 @@ static int dcssblk_open(struct block_device *bdev, fmode_t mode);
 static void dcssblk_release(struct gendisk *disk, fmode_t mode);
 static void dcssblk_submit_bio(struct bio *bio);
 static long dcssblk_dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
-		long nr_pages, void **kaddr, pfn_t *pfn);
+		long nr_pages, int mode, void **kaddr, pfn_t *pfn);
 
 static char dcssblk_segments[DCSSBLK_PARM_LEN] = "\0";
 
@@ -45,13 +45,15 @@ static const struct block_device_operations dcssblk_devops = {
 };
 
 static size_t dcssblk_dax_copy_from_iter(struct dax_device *dax_dev,
-		pgoff_t pgoff, void *addr, size_t bytes, struct iov_iter *i)
+		pgoff_t pgoff, void *addr, size_t bytes, struct iov_iter *i,
+		int mode)
 {
 	return copy_from_iter(addr, bytes, i);
 }
 
 static size_t dcssblk_dax_copy_to_iter(struct dax_device *dax_dev,
-		pgoff_t pgoff, void *addr, size_t bytes, struct iov_iter *i)
+		pgoff_t pgoff, void *addr, size_t bytes, struct iov_iter *i,
+		int mode)
 {
 	return copy_to_iter(addr, bytes, i);
 }
@@ -62,7 +64,8 @@ static int dcssblk_dax_zero_page_range(struct dax_device *dax_dev,
 	long rc;
 	void *kaddr;
 
-	rc = dax_direct_access(dax_dev, pgoff, nr_pages, &kaddr, NULL);
+	rc = dax_direct_access(dax_dev, pgoff, nr_pages, DAX_OP_NORMAL,
+			       &kaddr, NULL);
 	if (rc < 0)
 		return rc;
 	memset(kaddr, 0, nr_pages << PAGE_SHIFT);
@@ -941,7 +944,7 @@ __dcssblk_direct_access(struct dcssblk_dev_info *dev_info, pgoff_t pgoff,
 
 static long
 dcssblk_dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
-		long nr_pages, void **kaddr, pfn_t *pfn)
+		long nr_pages, int mode, void **kaddr, pfn_t *pfn)
 {
 	struct dcssblk_dev_info *dev_info = dax_get_private(dax_dev);
 
diff --git a/fs/dax.c b/fs/dax.c
index eb715363fd66..bea6df1498c3 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -735,7 +735,8 @@ static int copy_cow_page_dax(struct block_device *bdev, struct dax_device *dax_d
 		return rc;
 
 	id = dax_read_lock();
-	rc = dax_direct_access(dax_dev, pgoff, 1, &kaddr, NULL);
+	rc = dax_direct_access(dax_dev, pgoff, 1, DAX_OP_NORMAL, &kaddr,
+			       NULL);
 	if (rc < 0) {
 		dax_read_unlock(id);
 		return rc;
@@ -1036,7 +1037,7 @@ static int dax_iomap_pfn(const struct iomap *iomap, loff_t pos, size_t size,
 		return rc;
 	id = dax_read_lock();
 	length = dax_direct_access(iomap->dax_dev, pgoff, PHYS_PFN(size),
-				   NULL, pfnp);
+				   DAX_OP_NORMAL, NULL, pfnp);
 	if (length < 0) {
 		rc = length;
 		goto out;
@@ -1162,7 +1163,8 @@ s64 dax_iomap_zero(loff_t pos, u64 length, struct iomap *iomap)
 	if (page_aligned)
 		rc = dax_zero_page_range(iomap->dax_dev, pgoff, 1);
 	else
-		rc = dax_direct_access(iomap->dax_dev, pgoff, 1, &kaddr, NULL);
+		rc = dax_direct_access(iomap->dax_dev, pgoff, 1,
+				       DAX_OP_NORMAL, &kaddr, NULL);
 	if (rc < 0) {
 		dax_read_unlock(id);
 		return rc;
@@ -1231,7 +1233,7 @@ static loff_t dax_iomap_iter(const struct iomap_iter *iomi,
 			break;
 
 		map_len = dax_direct_access(dax_dev, pgoff, PHYS_PFN(size),
-				&kaddr, NULL);
+					    DAX_OP_NORMAL, &kaddr, NULL);
 		if (map_len < 0) {
 			ret = map_len;
 			break;
@@ -1250,10 +1252,10 @@ static loff_t dax_iomap_iter(const struct iomap_iter *iomi,
 		 */
 		if (iov_iter_rw(iter) == WRITE)
 			xfer = dax_copy_from_iter(dax_dev, pgoff, kaddr,
-					map_len, iter);
+					map_len, iter, DAX_OP_NORMAL);
 		else
 			xfer = dax_copy_to_iter(dax_dev, pgoff, kaddr,
-					map_len, iter);
+					map_len, iter, DAX_OP_NORMAL);
 
 		pos += xfer;
 		length -= xfer;
diff --git a/fs/fuse/dax.c b/fs/fuse/dax.c
index 713818d74de6..755d8d4b7d34 100644
--- a/fs/fuse/dax.c
+++ b/fs/fuse/dax.c
@@ -1241,8 +1241,8 @@ static int fuse_dax_mem_range_init(struct fuse_conn_dax *fcd)
 	INIT_DELAYED_WORK(&fcd->free_work, fuse_dax_free_mem_worker);
 
 	id = dax_read_lock();
-	nr_pages = dax_direct_access(fcd->dev, 0, PHYS_PFN(dax_size), NULL,
-				     NULL);
+	nr_pages = dax_direct_access(fcd->dev, 0, PHYS_PFN(dax_size),
+				     DAX_OP_NORMAL, NULL, NULL);
 	dax_read_unlock(id);
 	if (nr_pages < 0) {
 		pr_debug("dax_direct_access() returned %ld\n", nr_pages);
diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index b4c7c7fa987f..fb5433a37a7b 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -739,7 +739,8 @@ static void virtio_fs_cleanup_vqs(struct virtio_device *vdev,
  * offset.
  */
 static long virtio_fs_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
-				    long nr_pages, void **kaddr, pfn_t *pfn)
+				    long nr_pages, int mode, void **kaddr,
+				    pfn_t *pfn)
 {
 	struct virtio_fs *fs = dax_get_private(dax_dev);
 	phys_addr_t offset = PFN_PHYS(pgoff);
@@ -755,14 +756,16 @@ static long virtio_fs_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
 
 static size_t virtio_fs_copy_from_iter(struct dax_device *dax_dev,
 				       pgoff_t pgoff, void *addr,
-				       size_t bytes, struct iov_iter *i)
+				       size_t bytes, struct iov_iter *i,
+				       int mode)
 {
 	return copy_from_iter(addr, bytes, i);
 }
 
 static size_t virtio_fs_copy_to_iter(struct dax_device *dax_dev,
 				       pgoff_t pgoff, void *addr,
-				       size_t bytes, struct iov_iter *i)
+				       size_t bytes, struct iov_iter *i,
+				       int mode)
 {
 	return copy_to_iter(addr, bytes, i);
 }
@@ -773,7 +776,8 @@ static int virtio_fs_zero_page_range(struct dax_device *dax_dev,
 	long rc;
 	void *kaddr;
 
-	rc = dax_direct_access(dax_dev, pgoff, nr_pages, &kaddr, NULL);
+	rc = dax_direct_access(dax_dev, pgoff, nr_pages, DAX_OP_NORMAL,
+			       &kaddr, NULL);
 	if (rc < 0)
 		return rc;
 	memset(kaddr, 0, nr_pages << PAGE_SHIFT);
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 324363b798ec..931586df2905 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -9,6 +9,10 @@
 /* Flag for synchronous flush */
 #define DAXDEV_F_SYNC (1UL << 0)
 
+/* dax operation mode dynamically set by caller */
+#define	DAX_OP_NORMAL		0
+#define	DAX_OP_RECOVERY		1
+
 typedef unsigned long dax_entry_t;
 
 struct dax_device;
@@ -22,8 +26,8 @@ struct dax_operations {
 	 * logical-page-offset into an absolute physical pfn. Return the
 	 * number of pages available for DAX at that pfn.
 	 */
-	long (*direct_access)(struct dax_device *, pgoff_t, long,
-			void **, pfn_t *);
+	long (*direct_access)(struct dax_device *, pgoff_t, long, int,
+				void **, pfn_t *);
 	/*
 	 * Validate whether this device is usable as an fsdax backing
 	 * device.
@@ -32,10 +36,10 @@ struct dax_operations {
 			sector_t, sector_t);
 	/* copy_from_iter: required operation for fs-dax direct-i/o */
 	size_t (*copy_from_iter)(struct dax_device *, pgoff_t, void *, size_t,
-			struct iov_iter *);
+			struct iov_iter *, int);
 	/* copy_to_iter: required operation for fs-dax direct-i/o */
 	size_t (*copy_to_iter)(struct dax_device *, pgoff_t, void *, size_t,
-			struct iov_iter *);
+			struct iov_iter *, int);
 	/* zero_page_range: required operation. Zero page range   */
 	int (*zero_page_range)(struct dax_device *, pgoff_t, size_t);
 };
@@ -186,11 +190,11 @@ static inline void dax_read_unlock(int id)
 bool dax_alive(struct dax_device *dax_dev);
 void *dax_get_private(struct dax_device *dax_dev);
 long dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff, long nr_pages,
-		void **kaddr, pfn_t *pfn);
+		int mode, void **kaddr, pfn_t *pfn);
 size_t dax_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
-		size_t bytes, struct iov_iter *i);
+		size_t bytes, struct iov_iter *i, int mode);
 size_t dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
-		size_t bytes, struct iov_iter *i);
+		size_t bytes, struct iov_iter *i, int mode);
 int dax_zero_page_range(struct dax_device *dax_dev, pgoff_t pgoff,
 			size_t nr_pages);
 void dax_flush(struct dax_device *dax_dev, void *addr, size_t size);
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index a7df155ea49b..6596a8e0ceed 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -146,9 +146,10 @@ typedef int (*dm_busy_fn) (struct dm_target *ti);
  * >= 0 : the number of bytes accessible at the address
  */
 typedef long (*dm_dax_direct_access_fn) (struct dm_target *ti, pgoff_t pgoff,
-		long nr_pages, void **kaddr, pfn_t *pfn);
+		long nr_pages, int mode, void **kaddr, pfn_t *pfn);
 typedef size_t (*dm_dax_copy_iter_fn)(struct dm_target *ti, pgoff_t pgoff,
-		void *addr, size_t bytes, struct iov_iter *i);
+		void *addr, size_t bytes, struct iov_iter *i,
+		int mode);
 typedef int (*dm_dax_zero_page_range_fn)(struct dm_target *ti, pgoff_t pgoff,
 		size_t nr_pages);
 
diff --git a/tools/testing/nvdimm/pmem-dax.c b/tools/testing/nvdimm/pmem-dax.c
index af19c85558e7..71c225630e7e 100644
--- a/tools/testing/nvdimm/pmem-dax.c
+++ b/tools/testing/nvdimm/pmem-dax.c
@@ -8,7 +8,7 @@
 #include <nd.h>
 
 long __pmem_direct_access(struct pmem_device *pmem, pgoff_t pgoff,
-		long nr_pages, void **kaddr, pfn_t *pfn)
+		long nr_pages, int mode, void **kaddr, pfn_t *pfn)
 {
 	resource_size_t offset = PFN_PHYS(pgoff) + pmem->data_offset;
 
-- 
2.18.4

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

