Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 30580723995
	for <lists+dm-devel@lfdr.de>; Tue,  6 Jun 2023 09:41:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686037308;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SSre03ZExnw3IOI5WG77mt+HrOMBuf11DTvdWL+H3Vs=;
	b=FR+EK1M9U46XbMK/3htA5AKTxBPtxnLWh1ObDCNOHK8XKolOWVR3xXTfPwGmEim38VTueQ
	M42N02anpScMfmFGPt8CdxjRuV6KLrlp1u+xH2Yvsx9Rcva2IATjqd5toVbI3O6/Z9U/w5
	HQ6Uk86isEQy0eTN4cNbJ+6cm0sFZy4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-wQrHr8vpM3eoRAR52mlgfA-1; Tue, 06 Jun 2023 03:41:47 -0400
X-MC-Unique: wQrHr8vpM3eoRAR52mlgfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD2FF28135B4;
	Tue,  6 Jun 2023 07:41:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A73DE7AE4;
	Tue,  6 Jun 2023 07:41:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 61DF719465BA;
	Tue,  6 Jun 2023 07:41:43 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 382B11946595
 for <dm-devel@listman.corp.redhat.com>; Tue,  6 Jun 2023 07:41:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 25FBAC16044; Tue,  6 Jun 2023 07:41:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E68DC0448E
 for <dm-devel@redhat.com>; Tue,  6 Jun 2023 07:41:42 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9DF4811E85
 for <dm-devel@redhat.com>; Tue,  6 Jun 2023 07:41:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-IuGrcvvXOnGOFxVGscLMTg-1; Tue, 06 Jun 2023 03:41:39 -0400
X-MC-Unique: IuGrcvvXOnGOFxVGscLMTg-1
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q6RJX-000Zqu-1D; Tue, 06 Jun 2023 07:41:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  6 Jun 2023 09:39:43 +0200
Message-Id: <20230606073950.225178-25-hch@lst.de>
In-Reply-To: <20230606073950.225178-1-hch@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [dm-devel] [PATCH 24/31] rnbd-srv: replace sess->open_flags with a
 "bool readonly"
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Stop passing the fmode_t around and just use a simple bool to track if
an export is read-only.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rnbd/rnbd-srv-sysfs.c |  3 +--
 drivers/block/rnbd/rnbd-srv.c       | 15 +++++++--------
 drivers/block/rnbd/rnbd-srv.h       |  2 +-
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-srv-sysfs.c b/drivers/block/rnbd/rnbd-srv-sysfs.c
index d5d9267e1fa5e4..ebd95771c85ec7 100644
--- a/drivers/block/rnbd/rnbd-srv-sysfs.c
+++ b/drivers/block/rnbd/rnbd-srv-sysfs.c
@@ -88,8 +88,7 @@ static ssize_t read_only_show(struct kobject *kobj, struct kobj_attribute *attr,
 
 	sess_dev = container_of(kobj, struct rnbd_srv_sess_dev, kobj);
 
-	return sysfs_emit(page, "%d\n",
-			  !(sess_dev->open_flags & FMODE_WRITE));
+	return sysfs_emit(page, "%d\n", sess_dev->readonly);
 }
 
 static struct kobj_attribute rnbd_srv_dev_session_ro_attr =
diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
index 29d560472d05ba..b680071342b898 100644
--- a/drivers/block/rnbd/rnbd-srv.c
+++ b/drivers/block/rnbd/rnbd-srv.c
@@ -222,7 +222,7 @@ void rnbd_destroy_sess_dev(struct rnbd_srv_sess_dev *sess_dev, bool keep_id)
 	blkdev_put(sess_dev->bdev, NULL);
 	mutex_lock(&sess_dev->dev->lock);
 	list_del(&sess_dev->dev_list);
-	if (sess_dev->open_flags & FMODE_WRITE)
+	if (!sess_dev->readonly)
 		sess_dev->dev->open_write_cnt--;
 	mutex_unlock(&sess_dev->dev->lock);
 
@@ -561,7 +561,7 @@ static void rnbd_srv_fill_msg_open_rsp(struct rnbd_msg_open_rsp *rsp,
 static struct rnbd_srv_sess_dev *
 rnbd_srv_create_set_sess_dev(struct rnbd_srv_session *srv_sess,
 			      const struct rnbd_msg_open *open_msg,
-			      struct block_device *bdev, fmode_t open_flags,
+			      struct block_device *bdev, bool readonly,
 			      struct rnbd_srv_dev *srv_dev)
 {
 	struct rnbd_srv_sess_dev *sdev = rnbd_sess_dev_alloc(srv_sess);
@@ -576,7 +576,7 @@ rnbd_srv_create_set_sess_dev(struct rnbd_srv_session *srv_sess,
 	sdev->bdev		= bdev;
 	sdev->sess		= srv_sess;
 	sdev->dev		= srv_dev;
-	sdev->open_flags	= open_flags;
+	sdev->readonly		= readonly;
 	sdev->access_mode	= open_msg->access_mode;
 
 	return sdev;
@@ -681,13 +681,12 @@ static int process_msg_open(struct rnbd_srv_session *srv_sess,
 	struct rnbd_srv_sess_dev *srv_sess_dev;
 	const struct rnbd_msg_open *open_msg = msg;
 	struct block_device *bdev;
-	fmode_t open_flags;
+	fmode_t open_flags = FMODE_READ;
 	char *full_path;
 	struct rnbd_msg_open_rsp *rsp = data;
 
 	trace_process_msg_open(srv_sess, open_msg);
 
-	open_flags = FMODE_READ;
 	if (open_msg->access_mode != RNBD_ACCESS_RO)
 		open_flags |= FMODE_WRITE;
 
@@ -736,9 +735,9 @@ static int process_msg_open(struct rnbd_srv_session *srv_sess,
 		goto blkdev_put;
 	}
 
-	srv_sess_dev = rnbd_srv_create_set_sess_dev(srv_sess, open_msg,
-						     bdev, open_flags,
-						     srv_dev);
+	srv_sess_dev = rnbd_srv_create_set_sess_dev(srv_sess, open_msg, bdev,
+				open_msg->access_mode == RNBD_ACCESS_RO,
+				srv_dev);
 	if (IS_ERR(srv_sess_dev)) {
 		pr_err("Opening device '%s' on session %s failed, creating sess_dev failed, err: %ld\n",
 		       full_path, srv_sess->sessname, PTR_ERR(srv_sess_dev));
diff --git a/drivers/block/rnbd/rnbd-srv.h b/drivers/block/rnbd/rnbd-srv.h
index f5962fd31d62e4..76077a9db3dd55 100644
--- a/drivers/block/rnbd/rnbd-srv.h
+++ b/drivers/block/rnbd/rnbd-srv.h
@@ -52,7 +52,7 @@ struct rnbd_srv_sess_dev {
 	struct kobject                  kobj;
 	u32                             device_id;
 	bool				keep_id;
-	fmode_t                         open_flags;
+	bool				readonly;
 	struct kref			kref;
 	struct completion               *destroy_comp;
 	char				pathname[NAME_MAX];
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

