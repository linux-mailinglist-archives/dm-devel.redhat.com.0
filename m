Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E9E727F6D
	for <lists+dm-devel@lfdr.de>; Thu,  8 Jun 2023 13:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686225181;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=R2r3g1+ToEY3QWEkkAVtoFkaU3uDgipHyKve7pZHTsQ=;
	b=YRT3ECKSRjK+otdpMYNqke+za7sKxVlaB1pMOuHTx4C6lb4JzRMCz3WGEknGBSW4FllguF
	4qjRsDvuE6Bvm5wMMDI8vWCkIDg0sbX6ULoW08Nf456b+Fiyy90wPiC8YBeEEOsmwWUY36
	GjUyzp7XL70VsrJHHi+QUVBuD97L5eE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-_qLD_rb9N82GKfIwa-gbvg-1; Thu, 08 Jun 2023 07:52:55 -0400
X-MC-Unique: _qLD_rb9N82GKfIwa-gbvg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50F69101AA6F;
	Thu,  8 Jun 2023 11:52:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 366F4112132D;
	Thu,  8 Jun 2023 11:52:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B902E19451C6;
	Thu,  8 Jun 2023 11:52:52 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EE51D194658C
 for <dm-devel@listman.corp.redhat.com>; Thu,  8 Jun 2023 11:52:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C169440CF8E4; Thu,  8 Jun 2023 11:52:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B9EE340CF8F6
 for <dm-devel@redhat.com>; Thu,  8 Jun 2023 11:52:50 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 968EB101A55C
 for <dm-devel@redhat.com>; Thu,  8 Jun 2023 11:52:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-8K-gaA5dM2OJ6ev1iHJWgA-1; Thu, 08 Jun 2023 07:52:48 -0400
X-MC-Unique: 8K-gaA5dM2OJ6ev1iHJWgA-1
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q7DQq-0092W2-2a; Thu, 08 Jun 2023 11:03:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  8 Jun 2023 13:02:48 +0200
Message-Id: <20230608110258.189493-21-hch@lst.de>
In-Reply-To: <20230608110258.189493-1-hch@lst.de>
References: <20230608110258.189493-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [dm-devel] [PATCH 20/30] scsi: replace the fmode_t argument to
 ->sg_io_fn with a simple bool
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of passing a fmode_t and only checking it for FMODE_WRITE, pass
a bool open_for_write to prepare for callers that won't have the fmode_t.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Acked-by: Christian Brauner <brauner@kernel.org>
---
 block/bsg-lib.c         | 2 +-
 block/bsg.c             | 8 +++++---
 drivers/scsi/scsi_bsg.c | 4 ++--
 include/linux/bsg.h     | 2 +-
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/block/bsg-lib.c b/block/bsg-lib.c
index 435c32373cd68f..b3acdbdb6e7ea8 100644
--- a/block/bsg-lib.c
+++ b/block/bsg-lib.c
@@ -26,7 +26,7 @@ struct bsg_set {
 };
 
 static int bsg_transport_sg_io_fn(struct request_queue *q, struct sg_io_v4 *hdr,
-		fmode_t mode, unsigned int timeout)
+		bool open_for_write, unsigned int timeout)
 {
 	struct bsg_job *job;
 	struct request *rq;
diff --git a/block/bsg.c b/block/bsg.c
index 7eca43f33d7ff8..bec4027842b31e 100644
--- a/block/bsg.c
+++ b/block/bsg.c
@@ -54,7 +54,8 @@ static unsigned int bsg_timeout(struct bsg_device *bd, struct sg_io_v4 *hdr)
 	return max_t(unsigned int, timeout, BLK_MIN_SG_TIMEOUT);
 }
 
-static int bsg_sg_io(struct bsg_device *bd, fmode_t mode, void __user *uarg)
+static int bsg_sg_io(struct bsg_device *bd, bool open_for_write,
+		     void __user *uarg)
 {
 	struct sg_io_v4 hdr;
 	int ret;
@@ -63,7 +64,8 @@ static int bsg_sg_io(struct bsg_device *bd, fmode_t mode, void __user *uarg)
 		return -EFAULT;
 	if (hdr.guard != 'Q')
 		return -EINVAL;
-	ret = bd->sg_io_fn(bd->queue, &hdr, mode, bsg_timeout(bd, &hdr));
+	ret = bd->sg_io_fn(bd->queue, &hdr, open_for_write,
+			   bsg_timeout(bd, &hdr));
 	if (!ret && copy_to_user(uarg, &hdr, sizeof(hdr)))
 		return -EFAULT;
 	return ret;
@@ -146,7 +148,7 @@ static long bsg_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case SG_EMULATED_HOST:
 		return put_user(1, intp);
 	case SG_IO:
-		return bsg_sg_io(bd, file->f_mode, uarg);
+		return bsg_sg_io(bd, file->f_mode & FMODE_WRITE, uarg);
 	case SCSI_IOCTL_SEND_COMMAND:
 		pr_warn_ratelimited("%s: calling unsupported SCSI_IOCTL_SEND_COMMAND\n",
 				current->comm);
diff --git a/drivers/scsi/scsi_bsg.c b/drivers/scsi/scsi_bsg.c
index 12431f35f861e1..a9a9ec086a7e3f 100644
--- a/drivers/scsi/scsi_bsg.c
+++ b/drivers/scsi/scsi_bsg.c
@@ -10,7 +10,7 @@
 #define uptr64(val) ((void __user *)(uintptr_t)(val))
 
 static int scsi_bsg_sg_io_fn(struct request_queue *q, struct sg_io_v4 *hdr,
-		fmode_t mode, unsigned int timeout)
+		bool open_for_write, unsigned int timeout)
 {
 	struct scsi_cmnd *scmd;
 	struct request *rq;
@@ -42,7 +42,7 @@ static int scsi_bsg_sg_io_fn(struct request_queue *q, struct sg_io_v4 *hdr,
 	if (copy_from_user(scmd->cmnd, uptr64(hdr->request), scmd->cmd_len))
 		goto out_put_request;
 	ret = -EPERM;
-	if (!scsi_cmd_allowed(scmd->cmnd, mode & FMODE_WRITE))
+	if (!scsi_cmd_allowed(scmd->cmnd, open_for_write))
 		goto out_put_request;
 
 	ret = 0;
diff --git a/include/linux/bsg.h b/include/linux/bsg.h
index 1ac81c809da9b3..ee2df73edf83f8 100644
--- a/include/linux/bsg.h
+++ b/include/linux/bsg.h
@@ -9,7 +9,7 @@ struct device;
 struct request_queue;
 
 typedef int (bsg_sg_io_fn)(struct request_queue *, struct sg_io_v4 *hdr,
-		fmode_t mode, unsigned int timeout);
+		bool open_for_write, unsigned int timeout);
 
 struct bsg_device *bsg_register_queue(struct request_queue *q,
 		struct device *parent, const char *name,
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

