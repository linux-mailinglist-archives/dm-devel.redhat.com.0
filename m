Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CDE6C9AF4
	for <lists+dm-devel@lfdr.de>; Mon, 27 Mar 2023 07:41:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679895710;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0ZlbRZ4kJCp2iRQh49oHGaM6jKzpR6QpYyKrqLIh6qA=;
	b=QuMRr1mltzCewleBB0wgGE9q0K/eXa2N5rhjckpmA/5DGi7E3PqfXaRmLOXq3UmGD2AfLx
	AUaC37Yt8N+6HD2qi5vBU2KXq7X9ZE5sAS9coifp6UviIbodRx7VJrY7KnS1erAlVVhZfE
	XXJeKhzimKOQIrTxX+YmaXxMIx9IPkM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-SLJnTdJ4Ocucp0UbVT53Yg-1; Mon, 27 Mar 2023 01:41:48 -0400
X-MC-Unique: SLJnTdJ4Ocucp0UbVT53Yg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90B2C1C0907A;
	Mon, 27 Mar 2023 05:41:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B1DEB404DC4C;
	Mon, 27 Mar 2023 05:41:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 590EB19465B5;
	Mon, 27 Mar 2023 05:41:35 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6EA541946A5A
 for <dm-devel@listman.corp.redhat.com>; Fri, 24 Mar 2023 18:20:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 50ADD492C3E; Fri, 24 Mar 2023 18:20:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48048492B01
 for <dm-devel@redhat.com>; Fri, 24 Mar 2023 18:20:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26742889057
 for <dm-devel@redhat.com>; Fri, 24 Mar 2023 18:20:20 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-zniTbIPbMcSb03hEedTh1g-1; Fri, 24 Mar 2023 14:20:18 -0400
X-MC-Unique: zniTbIPbMcSb03hEedTh1g-1
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32OI0BbR021956; Fri, 24 Mar 2023 18:18:08 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3phgrg81d6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Mar 2023 18:18:07 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32OHfmHi001435; Fri, 24 Mar 2023 18:18:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3pgxk4bxer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Mar 2023 18:18:07 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32OIHiEb021017;
 Fri, 24 Mar 2023 18:18:06 GMT
Received: from mnchrist-mac.us.oracle.com (dhcp-10-154-153-54.vpn.oracle.com
 [10.154.153.54])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3pgxk4bx19-10; Fri, 24 Mar 2023 18:18:06 +0000
From: Mike Christie <michael.christie@oracle.com>
To: bvanassche@acm.org, hch@lst.de, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, james.bottomley@hansenpartnership.com,
 linux-block@vger.kernel.org, dm-devel@redhat.com, snitzer@kernel.org,
 axboe@kernel.dk, linux-nvme@lists.infradead.org, chaitanyak@nvidia.com,
 kbusch@kernel.org, target-devel@vger.kernel.org
Date: Fri, 24 Mar 2023 13:17:32 -0500
Message-Id: <20230324181741.13908-10-michael.christie@oracle.com>
In-Reply-To: <20230324181741.13908-1-michael.christie@oracle.com>
References: <20230324181741.13908-1-michael.christie@oracle.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303240143
X-Proofpoint-ORIG-GUID: mIM4Cp-tKl6TK1Axqu94gdj29Ke7ye10
X-Proofpoint-GUID: mIM4Cp-tKl6TK1Axqu94gdj29Ke7ye10
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Mon, 27 Mar 2023 05:41:34 +0000
Subject: [dm-devel] [PATCH v5 09/18] nvme: Move pr code to it's own file
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
Cc: Chaitanya Kulkarni <kch@nvidia.com>,
 Mike Christie <michael.christie@oracle.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch moves the pr code to it's own file because I'm going to be
adding more functions and core.c is getting bigger.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 drivers/nvme/host/Makefile |   2 +-
 drivers/nvme/host/core.c   | 148 ----------------------------------
 drivers/nvme/host/nvme.h   |   2 +
 drivers/nvme/host/pr.c     | 158 +++++++++++++++++++++++++++++++++++++
 4 files changed, 161 insertions(+), 149 deletions(-)
 create mode 100644 drivers/nvme/host/pr.c

diff --git a/drivers/nvme/host/Makefile b/drivers/nvme/host/Makefile
index e27202d22c7d..06c18a65da99 100644
--- a/drivers/nvme/host/Makefile
+++ b/drivers/nvme/host/Makefile
@@ -10,7 +10,7 @@ obj-$(CONFIG_NVME_FC)			+= nvme-fc.o
 obj-$(CONFIG_NVME_TCP)			+= nvme-tcp.o
 obj-$(CONFIG_NVME_APPLE)		+= nvme-apple.o
 
-nvme-core-y				+= core.o ioctl.o
+nvme-core-y				+= core.o ioctl.o pr.o
 nvme-core-$(CONFIG_NVME_VERBOSE_ERRORS)	+= constants.o
 nvme-core-$(CONFIG_TRACING)		+= trace.o
 nvme-core-$(CONFIG_NVME_MULTIPATH)	+= multipath.o
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 48a22c3aff15..16d4564967bc 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2061,154 +2061,6 @@ static int nvme_update_ns_info(struct nvme_ns *ns, struct nvme_ns_info *info)
 	}
 }
 
-static char nvme_pr_type(enum pr_type type)
-{
-	switch (type) {
-	case PR_WRITE_EXCLUSIVE:
-		return 1;
-	case PR_EXCLUSIVE_ACCESS:
-		return 2;
-	case PR_WRITE_EXCLUSIVE_REG_ONLY:
-		return 3;
-	case PR_EXCLUSIVE_ACCESS_REG_ONLY:
-		return 4;
-	case PR_WRITE_EXCLUSIVE_ALL_REGS:
-		return 5;
-	case PR_EXCLUSIVE_ACCESS_ALL_REGS:
-		return 6;
-	default:
-		return 0;
-	}
-}
-
-static int nvme_send_ns_head_pr_command(struct block_device *bdev,
-		struct nvme_command *c, u8 *data, unsigned int data_len)
-{
-	struct nvme_ns_head *head = bdev->bd_disk->private_data;
-	int srcu_idx = srcu_read_lock(&head->srcu);
-	struct nvme_ns *ns = nvme_find_path(head);
-	int ret = -EWOULDBLOCK;
-
-	if (ns) {
-		c->common.nsid = cpu_to_le32(ns->head->ns_id);
-		ret = nvme_submit_sync_cmd(ns->queue, c, data, data_len);
-	}
-	srcu_read_unlock(&head->srcu, srcu_idx);
-	return ret;
-}
-	
-static int nvme_send_ns_pr_command(struct nvme_ns *ns, struct nvme_command *c,
-		u8 *data, unsigned int data_len)
-{
-	c->common.nsid = cpu_to_le32(ns->head->ns_id);
-	return nvme_submit_sync_cmd(ns->queue, c, data, data_len);
-}
-
-static int nvme_sc_to_pr_err(int nvme_sc)
-{
-	if (nvme_is_path_error(nvme_sc))
-		return PR_STS_PATH_FAILED;
-
-	switch (nvme_sc) {
-	case NVME_SC_SUCCESS:
-		return PR_STS_SUCCESS;
-	case NVME_SC_RESERVATION_CONFLICT:
-		return PR_STS_RESERVATION_CONFLICT;
-	case NVME_SC_ONCS_NOT_SUPPORTED:
-		return -EOPNOTSUPP;
-	case NVME_SC_BAD_ATTRIBUTES:
-	case NVME_SC_INVALID_OPCODE:
-	case NVME_SC_INVALID_FIELD:
-	case NVME_SC_INVALID_NS:
-		return -EINVAL;
-	default:
-		return PR_STS_IOERR;
-	}
-}
-
-static int nvme_pr_command(struct block_device *bdev, u32 cdw10,
-				u64 key, u64 sa_key, u8 op)
-{
-	struct nvme_command c = { };
-	u8 data[16] = { 0, };
-	int ret;
-
-	put_unaligned_le64(key, &data[0]);
-	put_unaligned_le64(sa_key, &data[8]);
-
-	c.common.opcode = op;
-	c.common.cdw10 = cpu_to_le32(cdw10);
-
-	if (IS_ENABLED(CONFIG_NVME_MULTIPATH) &&
-	    bdev->bd_disk->fops == &nvme_ns_head_ops)
-		ret = nvme_send_ns_head_pr_command(bdev, &c, data,
-						   sizeof(data));
-	else
-		ret = nvme_send_ns_pr_command(bdev->bd_disk->private_data, &c,
-					      data, sizeof(data));
-	if (ret < 0)
-		return ret;
-
-	return nvme_sc_to_pr_err(ret);
-}
-
-static int nvme_pr_register(struct block_device *bdev, u64 old,
-		u64 new, unsigned flags)
-{
-	u32 cdw10;
-
-	if (flags & ~PR_FL_IGNORE_KEY)
-		return -EOPNOTSUPP;
-
-	cdw10 = old ? 2 : 0;
-	cdw10 |= (flags & PR_FL_IGNORE_KEY) ? 1 << 3 : 0;
-	cdw10 |= (1 << 30) | (1 << 31); /* PTPL=1 */
-	return nvme_pr_command(bdev, cdw10, old, new, nvme_cmd_resv_register);
-}
-
-static int nvme_pr_reserve(struct block_device *bdev, u64 key,
-		enum pr_type type, unsigned flags)
-{
-	u32 cdw10;
-
-	if (flags & ~PR_FL_IGNORE_KEY)
-		return -EOPNOTSUPP;
-
-	cdw10 = nvme_pr_type(type) << 8;
-	cdw10 |= ((flags & PR_FL_IGNORE_KEY) ? 1 << 3 : 0);
-	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_acquire);
-}
-
-static int nvme_pr_preempt(struct block_device *bdev, u64 old, u64 new,
-		enum pr_type type, bool abort)
-{
-	u32 cdw10 = nvme_pr_type(type) << 8 | (abort ? 2 : 1);
-
-	return nvme_pr_command(bdev, cdw10, old, new, nvme_cmd_resv_acquire);
-}
-
-static int nvme_pr_clear(struct block_device *bdev, u64 key)
-{
-	u32 cdw10 = 1 | (key ? 0 : 1 << 3);
-
-	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_release);
-}
-
-static int nvme_pr_release(struct block_device *bdev, u64 key, enum pr_type type)
-{
-	u32 cdw10 = nvme_pr_type(type) << 8 | (key ? 0 : 1 << 3);
-
-	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_release);
-}
-
-const struct pr_ops nvme_pr_ops = {
-	.pr_register	= nvme_pr_register,
-	.pr_reserve	= nvme_pr_reserve,
-	.pr_release	= nvme_pr_release,
-	.pr_preempt	= nvme_pr_preempt,
-	.pr_clear	= nvme_pr_clear,
-};
-
 #ifdef CONFIG_BLK_SED_OPAL
 static int nvme_sec_submit(void *data, u16 spsp, u8 secp, void *buffer, size_t len,
 		bool send)
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index bf46f122e9e1..c0762346b441 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -19,6 +19,8 @@
 
 #include <trace/events/block.h>
 
+extern const struct pr_ops nvme_pr_ops;
+
 extern unsigned int nvme_io_timeout;
 #define NVME_IO_TIMEOUT	(nvme_io_timeout * HZ)
 
diff --git a/drivers/nvme/host/pr.c b/drivers/nvme/host/pr.c
new file mode 100644
index 000000000000..ca7a8d531a23
--- /dev/null
+++ b/drivers/nvme/host/pr.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2015 Intel Corporation
+ *	Keith Busch <kbusch@kernel.org>
+ */
+#include <linux/blkdev.h>
+#include <linux/pr.h>
+#include <asm/unaligned.h>
+
+#include "nvme.h"
+
+static char nvme_pr_type(enum pr_type type)
+{
+	switch (type) {
+	case PR_WRITE_EXCLUSIVE:
+		return 1;
+	case PR_EXCLUSIVE_ACCESS:
+		return 2;
+	case PR_WRITE_EXCLUSIVE_REG_ONLY:
+		return 3;
+	case PR_EXCLUSIVE_ACCESS_REG_ONLY:
+		return 4;
+	case PR_WRITE_EXCLUSIVE_ALL_REGS:
+		return 5;
+	case PR_EXCLUSIVE_ACCESS_ALL_REGS:
+		return 6;
+	default:
+		return 0;
+	}
+}
+
+static int nvme_send_ns_head_pr_command(struct block_device *bdev,
+		struct nvme_command *c, u8 *data, unsigned int data_len)
+{
+	struct nvme_ns_head *head = bdev->bd_disk->private_data;
+	int srcu_idx = srcu_read_lock(&head->srcu);
+	struct nvme_ns *ns = nvme_find_path(head);
+	int ret = -EWOULDBLOCK;
+
+	if (ns) {
+		c->common.nsid = cpu_to_le32(ns->head->ns_id);
+		ret = nvme_submit_sync_cmd(ns->queue, c, data, data_len);
+	}
+	srcu_read_unlock(&head->srcu, srcu_idx);
+	return ret;
+}
+
+static int nvme_send_ns_pr_command(struct nvme_ns *ns, struct nvme_command *c,
+		u8 *data, unsigned int data_len)
+{
+	c->common.nsid = cpu_to_le32(ns->head->ns_id);
+	return nvme_submit_sync_cmd(ns->queue, c, data, data_len);
+}
+
+static int nvme_sc_to_pr_err(int nvme_sc)
+{
+	if (nvme_is_path_error(nvme_sc))
+		return PR_STS_PATH_FAILED;
+
+	switch (nvme_sc) {
+	case NVME_SC_SUCCESS:
+		return PR_STS_SUCCESS;
+	case NVME_SC_RESERVATION_CONFLICT:
+		return PR_STS_RESERVATION_CONFLICT;
+	case NVME_SC_ONCS_NOT_SUPPORTED:
+		return -EOPNOTSUPP;
+	case NVME_SC_BAD_ATTRIBUTES:
+	case NVME_SC_INVALID_OPCODE:
+	case NVME_SC_INVALID_FIELD:
+	case NVME_SC_INVALID_NS:
+		return -EINVAL;
+	default:
+		return PR_STS_IOERR;
+	}
+}
+
+static int nvme_pr_command(struct block_device *bdev, u32 cdw10,
+				u64 key, u64 sa_key, u8 op)
+{
+	struct nvme_command c = { };
+	u8 data[16] = { 0, };
+	int ret;
+
+	put_unaligned_le64(key, &data[0]);
+	put_unaligned_le64(sa_key, &data[8]);
+
+	c.common.opcode = op;
+	c.common.cdw10 = cpu_to_le32(cdw10);
+
+	if (IS_ENABLED(CONFIG_NVME_MULTIPATH) &&
+	    bdev->bd_disk->fops == &nvme_ns_head_ops)
+		ret = nvme_send_ns_head_pr_command(bdev, &c, data,
+						   sizeof(data));
+	else
+		ret = nvme_send_ns_pr_command(bdev->bd_disk->private_data, &c,
+					      data, sizeof(data));
+	if (ret < 0)
+		return ret;
+
+	return nvme_sc_to_pr_err(ret);
+}
+
+static int nvme_pr_register(struct block_device *bdev, u64 old,
+		u64 new, unsigned flags)
+{
+	u32 cdw10;
+
+	if (flags & ~PR_FL_IGNORE_KEY)
+		return -EOPNOTSUPP;
+
+	cdw10 = old ? 2 : 0;
+	cdw10 |= (flags & PR_FL_IGNORE_KEY) ? 1 << 3 : 0;
+	cdw10 |= (1 << 30) | (1 << 31); /* PTPL=1 */
+	return nvme_pr_command(bdev, cdw10, old, new, nvme_cmd_resv_register);
+}
+
+static int nvme_pr_reserve(struct block_device *bdev, u64 key,
+		enum pr_type type, unsigned flags)
+{
+	u32 cdw10;
+
+	if (flags & ~PR_FL_IGNORE_KEY)
+		return -EOPNOTSUPP;
+
+	cdw10 = nvme_pr_type(type) << 8;
+	cdw10 |= ((flags & PR_FL_IGNORE_KEY) ? 1 << 3 : 0);
+	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_acquire);
+}
+
+static int nvme_pr_preempt(struct block_device *bdev, u64 old, u64 new,
+		enum pr_type type, bool abort)
+{
+	u32 cdw10 = nvme_pr_type(type) << 8 | (abort ? 2 : 1);
+
+	return nvme_pr_command(bdev, cdw10, old, new, nvme_cmd_resv_acquire);
+}
+
+static int nvme_pr_clear(struct block_device *bdev, u64 key)
+{
+	u32 cdw10 = 1 | (key ? 0 : 1 << 3);
+
+	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_release);
+}
+
+static int nvme_pr_release(struct block_device *bdev, u64 key, enum pr_type type)
+{
+	u32 cdw10 = nvme_pr_type(type) << 8 | (key ? 0 : 1 << 3);
+
+	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_release);
+}
+
+const struct pr_ops nvme_pr_ops = {
+	.pr_register	= nvme_pr_register,
+	.pr_reserve	= nvme_pr_reserve,
+	.pr_release	= nvme_pr_release,
+	.pr_preempt	= nvme_pr_preempt,
+	.pr_clear	= nvme_pr_clear,
+};
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

