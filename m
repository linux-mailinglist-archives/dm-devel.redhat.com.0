Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 004A0723986
	for <lists+dm-devel@lfdr.de>; Tue,  6 Jun 2023 09:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686037289;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5L9DI3bewpCByA5oQTta5QuxPNLdpB5A9flV/ZYvtdo=;
	b=aPiE5ydA4FTM8S+vc9IwNoouOKcPOwfcjY02+kjB4T54xjKzgm3OZHpDiVEoUFyQttGMVs
	6+eYlEmOb9JiIi7p/90bHSmLyRy1ZvSgNLm/oRbcLi0S+tjoqFvPDMtqgOiF6bKmqZva1d
	veheNiRwYlAOrQfZq+7iq//Pq6Ieeuw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-lOCC8AnHO0GKnOw_qlDs-g-1; Tue, 06 Jun 2023 03:41:27 -0400
X-MC-Unique: lOCC8AnHO0GKnOw_qlDs-g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C9B428135B5;
	Tue,  6 Jun 2023 07:41:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 35DF3403367;
	Tue,  6 Jun 2023 07:41:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1B45419465BD;
	Tue,  6 Jun 2023 07:41:24 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CF81B1946595
 for <dm-devel@listman.corp.redhat.com>; Tue,  6 Jun 2023 07:41:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AE3692166B27; Tue,  6 Jun 2023 07:41:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A60682166B25
 for <dm-devel@redhat.com>; Tue,  6 Jun 2023 07:41:22 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72A0B1C00B8C
 for <dm-devel@redhat.com>; Tue,  6 Jun 2023 07:41:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-JWmMIMAfMSqXGHBMgcQcrw-1; Tue, 06 Jun 2023 03:41:20 -0400
X-MC-Unique: JWmMIMAfMSqXGHBMgcQcrw-1
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q6RJL-000ZgM-1N; Tue, 06 Jun 2023 07:40:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  6 Jun 2023 09:39:39 +0200
Message-Id: <20230606073950.225178-21-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [dm-devel] [PATCH 20/31] scsi: replace the fmode_t argument to
 scsi_ioctl with a simple bool
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of passing a fmode_t and only checking it for FMODE_WRITE, pass
a bool open_for_write to prepare for callers that won't have the fmode_t.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/ch.c         |  3 ++-
 drivers/scsi/scsi_ioctl.c | 34 +++++++++++++++++-----------------
 drivers/scsi/sd.c         |  2 +-
 drivers/scsi/sg.c         |  5 +++--
 drivers/scsi/sr.c         |  2 +-
 drivers/scsi/st.c         |  2 +-
 include/scsi/scsi_ioctl.h |  2 +-
 7 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/scsi/ch.c b/drivers/scsi/ch.c
index ac648bb8f7e7f4..cb0a399be1ccee 100644
--- a/drivers/scsi/ch.c
+++ b/drivers/scsi/ch.c
@@ -877,7 +877,8 @@ static long ch_ioctl(struct file *file,
 	}
 
 	default:
-		return scsi_ioctl(ch->device, file->f_mode, cmd, argp);
+		return scsi_ioctl(ch->device, file->f_mode & FMODE_WRITE, cmd,
+				  argp);
 
 	}
 }
diff --git a/drivers/scsi/scsi_ioctl.c b/drivers/scsi/scsi_ioctl.c
index dda5468ca97f90..6f6c5973c3ea95 100644
--- a/drivers/scsi/scsi_ioctl.c
+++ b/drivers/scsi/scsi_ioctl.c
@@ -346,7 +346,7 @@ bool scsi_cmd_allowed(unsigned char *cmd, bool open_for_write)
 EXPORT_SYMBOL(scsi_cmd_allowed);
 
 static int scsi_fill_sghdr_rq(struct scsi_device *sdev, struct request *rq,
-		struct sg_io_hdr *hdr, fmode_t mode)
+		struct sg_io_hdr *hdr, bool open_for_write)
 {
 	struct scsi_cmnd *scmd = blk_mq_rq_to_pdu(rq);
 
@@ -354,7 +354,7 @@ static int scsi_fill_sghdr_rq(struct scsi_device *sdev, struct request *rq,
 		return -EMSGSIZE;
 	if (copy_from_user(scmd->cmnd, hdr->cmdp, hdr->cmd_len))
 		return -EFAULT;
-	if (!scsi_cmd_allowed(scmd->cmnd, mode & FMODE_WRITE))
+	if (!scsi_cmd_allowed(scmd->cmnd, open_for_write))
 		return -EPERM;
 	scmd->cmd_len = hdr->cmd_len;
 
@@ -407,7 +407,8 @@ static int scsi_complete_sghdr_rq(struct request *rq, struct sg_io_hdr *hdr,
 	return ret;
 }
 
-static int sg_io(struct scsi_device *sdev, struct sg_io_hdr *hdr, fmode_t mode)
+static int sg_io(struct scsi_device *sdev, struct sg_io_hdr *hdr,
+		bool open_for_write)
 {
 	unsigned long start_time;
 	ssize_t ret = 0;
@@ -448,7 +449,7 @@ static int sg_io(struct scsi_device *sdev, struct sg_io_hdr *hdr, fmode_t mode)
 		goto out_put_request;
 	}
 
-	ret = scsi_fill_sghdr_rq(sdev, rq, hdr, mode);
+	ret = scsi_fill_sghdr_rq(sdev, rq, hdr, open_for_write);
 	if (ret < 0)
 		goto out_put_request;
 
@@ -477,8 +478,7 @@ static int sg_io(struct scsi_device *sdev, struct sg_io_hdr *hdr, fmode_t mode)
 /**
  * sg_scsi_ioctl  --  handle deprecated SCSI_IOCTL_SEND_COMMAND ioctl
  * @q:		request queue to send scsi commands down
- * @mode:	mode used to open the file through which the ioctl has been
- *		submitted
+ * @open_for_write: is the file / block device opened for writing?
  * @sic:	userspace structure describing the command to perform
  *
  * Send down the scsi command described by @sic to the device below
@@ -501,7 +501,7 @@ static int sg_io(struct scsi_device *sdev, struct sg_io_hdr *hdr, fmode_t mode)
  *      Positive numbers returned are the compacted SCSI error codes (4
  *      bytes in one int) where the lowest byte is the SCSI status.
  */
-static int sg_scsi_ioctl(struct request_queue *q, fmode_t mode,
+static int sg_scsi_ioctl(struct request_queue *q, bool open_for_write,
 		struct scsi_ioctl_command __user *sic)
 {
 	struct request *rq;
@@ -554,7 +554,7 @@ static int sg_scsi_ioctl(struct request_queue *q, fmode_t mode,
 		goto error;
 
 	err = -EPERM;
-	if (!scsi_cmd_allowed(scmd->cmnd, mode & FMODE_WRITE))
+	if (!scsi_cmd_allowed(scmd->cmnd, open_for_write))
 		goto error;
 
 	/* default.  possible overridden later */
@@ -776,7 +776,7 @@ static int scsi_put_cdrom_generic_arg(const struct cdrom_generic_command *cgc,
 	return 0;
 }
 
-static int scsi_cdrom_send_packet(struct scsi_device *sdev, fmode_t mode,
+static int scsi_cdrom_send_packet(struct scsi_device *sdev, bool open_for_write,
 		void __user *arg)
 {
 	struct cdrom_generic_command cgc;
@@ -817,7 +817,7 @@ static int scsi_cdrom_send_packet(struct scsi_device *sdev, fmode_t mode,
 	hdr.cmdp = ((struct cdrom_generic_command __user *) arg)->cmd;
 	hdr.cmd_len = sizeof(cgc.cmd);
 
-	err = sg_io(sdev, &hdr, mode);
+	err = sg_io(sdev, &hdr, open_for_write);
 	if (err == -EFAULT)
 		return -EFAULT;
 
@@ -832,7 +832,7 @@ static int scsi_cdrom_send_packet(struct scsi_device *sdev, fmode_t mode,
 	return err;
 }
 
-static int scsi_ioctl_sg_io(struct scsi_device *sdev, fmode_t mode,
+static int scsi_ioctl_sg_io(struct scsi_device *sdev, bool open_for_write,
 		void __user *argp)
 {
 	struct sg_io_hdr hdr;
@@ -841,7 +841,7 @@ static int scsi_ioctl_sg_io(struct scsi_device *sdev, fmode_t mode,
 	error = get_sg_io_hdr(&hdr, argp);
 	if (error)
 		return error;
-	error = sg_io(sdev, &hdr, mode);
+	error = sg_io(sdev, &hdr, open_for_write);
 	if (error == -EFAULT)
 		return error;
 	if (put_sg_io_hdr(&hdr, argp))
@@ -852,7 +852,7 @@ static int scsi_ioctl_sg_io(struct scsi_device *sdev, fmode_t mode,
 /**
  * scsi_ioctl - Dispatch ioctl to scsi device
  * @sdev: scsi device receiving ioctl
- * @mode: mode the block/char device is opened with
+ * @open_for_write: is the file / block device opened for writing?
  * @cmd: which ioctl is it
  * @arg: data associated with ioctl
  *
@@ -860,7 +860,7 @@ static int scsi_ioctl_sg_io(struct scsi_device *sdev, fmode_t mode,
  * does not take a major/minor number as the dev field.  Rather, it takes
  * a pointer to a &struct scsi_device.
  */
-int scsi_ioctl(struct scsi_device *sdev, fmode_t mode, int cmd,
+int scsi_ioctl(struct scsi_device *sdev, bool open_for_write, int cmd,
 		void __user *arg)
 {
 	struct request_queue *q = sdev->request_queue;
@@ -896,11 +896,11 @@ int scsi_ioctl(struct scsi_device *sdev, fmode_t mode, int cmd,
 	case SG_EMULATED_HOST:
 		return sg_emulated_host(q, arg);
 	case SG_IO:
-		return scsi_ioctl_sg_io(sdev, mode, arg);
+		return scsi_ioctl_sg_io(sdev, open_for_write, arg);
 	case SCSI_IOCTL_SEND_COMMAND:
-		return sg_scsi_ioctl(q, mode, arg);
+		return sg_scsi_ioctl(q, open_for_write, arg);
 	case CDROM_SEND_PACKET:
-		return scsi_cdrom_send_packet(sdev, mode, arg);
+		return scsi_cdrom_send_packet(sdev, open_for_write, arg);
 	case CDROMCLOSETRAY:
 		return scsi_send_start_stop(sdev, 3);
 	case CDROMEJECT:
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index c67c84f6ba6178..02b6704ec2b401 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1463,7 +1463,7 @@ static int sd_ioctl(struct block_device *bdev, fmode_t mode,
 
 	if (is_sed_ioctl(cmd))
 		return sed_ioctl(sdkp->opal_dev, cmd, p);
-	return scsi_ioctl(sdp, mode, cmd, p);
+	return scsi_ioctl(sdp, mode & FMODE_WRITE, cmd, p);
 }
 
 static void set_media_not_present(struct scsi_disk *sdkp)
diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index e49ea693d0b656..138e28bb76b749 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -1103,7 +1103,8 @@ sg_ioctl_common(struct file *filp, Sg_device *sdp, Sg_fd *sfp,
 	case SCSI_IOCTL_SEND_COMMAND:
 		if (atomic_read(&sdp->detaching))
 			return -ENODEV;
-		return scsi_ioctl(sdp->device, filp->f_mode, cmd_in, p);
+		return scsi_ioctl(sdp->device, filp->f_mode & FMODE_WRITE,
+				  cmd_in, p);
 	case SG_SET_DEBUG:
 		result = get_user(val, ip);
 		if (result)
@@ -1159,7 +1160,7 @@ sg_ioctl(struct file *filp, unsigned int cmd_in, unsigned long arg)
 	ret = sg_ioctl_common(filp, sdp, sfp, cmd_in, p);
 	if (ret != -ENOIOCTLCMD)
 		return ret;
-	return scsi_ioctl(sdp->device, filp->f_mode, cmd_in, p);
+	return scsi_ioctl(sdp->device, filp->f_mode & FMODE_WRITE, cmd_in, p);
 }
 
 static __poll_t
diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
index 55082acb59bcaa..00aaafc8dd78f8 100644
--- a/drivers/scsi/sr.c
+++ b/drivers/scsi/sr.c
@@ -543,7 +543,7 @@ static int sr_block_ioctl(struct block_device *bdev, fmode_t mode, unsigned cmd,
 		if (ret != -ENOSYS)
 			goto put;
 	}
-	ret = scsi_ioctl(sdev, mode, cmd, argp);
+	ret = scsi_ioctl(sdev, mode & FMODE_WRITE, cmd, argp);
 
 put:
 	scsi_autopm_put_device(sdev);
diff --git a/drivers/scsi/st.c b/drivers/scsi/st.c
index b90a440e135dc4..14d7981ddcdd19 100644
--- a/drivers/scsi/st.c
+++ b/drivers/scsi/st.c
@@ -3832,7 +3832,7 @@ static long st_ioctl(struct file *file, unsigned int cmd_in, unsigned long arg)
 		break;
 	}
 
-	retval = scsi_ioctl(STp->device, file->f_mode, cmd_in, p);
+	retval = scsi_ioctl(STp->device, file->f_mode & FMODE_WRITE, cmd_in, p);
 	if (!retval && cmd_in == SCSI_IOCTL_STOP_UNIT) {
 		/* unload */
 		STp->rew_at_close = 0;
diff --git a/include/scsi/scsi_ioctl.h b/include/scsi/scsi_ioctl.h
index 914201a8cb947c..a207c07da9d20c 100644
--- a/include/scsi/scsi_ioctl.h
+++ b/include/scsi/scsi_ioctl.h
@@ -45,7 +45,7 @@ typedef struct scsi_fctargaddress {
 
 int scsi_ioctl_block_when_processing_errors(struct scsi_device *sdev,
 		int cmd, bool ndelay);
-int scsi_ioctl(struct scsi_device *sdev, fmode_t mode, int cmd,
+int scsi_ioctl(struct scsi_device *sdev, bool open_for_write, int cmd,
 		void __user *arg);
 int get_sg_io_hdr(struct sg_io_hdr *hdr, const void __user *argp);
 int put_sg_io_hdr(const struct sg_io_hdr *hdr, void __user *argp);
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

