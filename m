Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC8B503E3
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 09:43:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91D3EC04AC69;
	Mon, 24 Jun 2019 07:43:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5477560C05;
	Mon, 24 Jun 2019 07:43:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2E2C1806B1E;
	Mon, 24 Jun 2019 07:43:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5LD7k2v014236 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 09:07:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 723A25D969; Fri, 21 Jun 2019 13:07:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D2CF5D962
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 13:07:44 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E43793086231
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 13:07:33 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id s21so5903259lji.8
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 06:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lightnvm-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZVCd7IM94kgrsu/Yv7f6wO5b46wgz2NUp+wKu6X3WWs=;
	b=bh3KhdObg8D6t3pFPfo82I+WgXWKJv4G/TsizdGYb0daA49HCACx94aagx/rw6jaqw
	/ZzfGfVqRjlnDv1HZhNcCNyzKArU3/hZFwQ7MPiUzuBWLfF6Ux728pFvpTmkq3lMDBX0
	HBKgvsvZyrLyLgpgWGTt/LhFGvwi1bgHEfF9WxT5x99CvhDkO14Cemg706vbghHEog2i
	8H/QSVs3K7J9inUJMijKmrYt4Mjvi93SgUgwlwll1NDy1EaYQ/TlnaNsgHZ0xzR25O+e
	i7C9XEPsIw0HJvQwp9Djf7w/xTjNHEy2wOCWz/4tBq7YkpngS5zdV39v0j1B5uGNW77r
	JUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZVCd7IM94kgrsu/Yv7f6wO5b46wgz2NUp+wKu6X3WWs=;
	b=T1jVAuZzuwPSj8s1/PKswo5X46HscLhQf/n7A1jw2+Q/tj2DOMbyJY4jBO708Gr4ac
	c12fvDelZIH2afKkRhMh0bX+/Ynh0SAUupMixMg4lSDwn4DH148ysnPx69KXDqHVweAc
	DkAZT2oN7K9GpBq2JwWhql51bfUE9yXPzTRNkGghdn+ViupR0a6RYTgX08pX/V81ySRA
	8NoRHfx8rVMtZaJIOpx+HBPTYeM1VYbMkL88iWFkkz5bYbbvriY8qPOrjCKojM6/Oioe
	E8JZ9TGkc51DBW/q5Bb+CGLGdgnBXhHV+Qgl1LVenpeII0rF7YvoTOl/XJrQljepk+8N
	jfVQ==
X-Gm-Message-State: APjAAAUxvcUiVRn3Dgi3eSfPIPj22JKapemNmma4knGfMXSMTfl2avtj
	J5rkNttqQyczO6VK92Nf8V4zSA==
X-Google-Smtp-Source: APXvYqwPhCxAWSqz1UWNxNr2CLd1C+Iim3YPxHMo0WKMl0NrncG/ekCweu9ZZy7aeqkjvNbWfd1WUQ==
X-Received: by 2002:a2e:5548:: with SMTP id j69mr26896248ljb.48.1561122452415; 
	Fri, 21 Jun 2019 06:07:32 -0700 (PDT)
Received: from skyninja.webspeed.dk (2-111-91-225-cable.dk.customer.tdc.net.
	[2.111.91.225])
	by smtp.gmail.com with ESMTPSA id r2sm387100lfi.51.2019.06.21.06.07.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 06:07:31 -0700 (PDT)
From: =?UTF-8?q?Matias=20Bj=C3=B8rling?= <mb@lightnvm.io>
To: axboe@fb.com, hch@lst.de, damien.lemoal@wdc.com,
	chaitanya.kulkarni@wdc.com, dmitry.fomichev@wdc.com,
	ajay.joshi@wdc.com, aravind.ramesh@wdc.com, martin.petersen@oracle.com, 
	James.Bottomley@HansenPartnership.com, agk@redhat.com, snitzer@redhat.com
Date: Fri, 21 Jun 2019 15:07:10 +0200
Message-Id: <20190621130711.21986-4-mb@lightnvm.io>
In-Reply-To: <20190621130711.21986-1-mb@lightnvm.io>
References: <20190621130711.21986-1-mb@lightnvm.io>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 21 Jun 2019 13:07:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 21 Jun 2019 13:07:34 +0000 (UTC) for IP:'209.85.208.195'
	DOMAIN:'mail-lj1-f195.google.com'
	HELO:'mail-lj1-f195.google.com' FROM:'mb@lightnvm.io' RCPT:''
X-RedHat-Spam-Score: -0.008  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.208.195 mail-lj1-f195.google.com 209.85.208.195
	mail-lj1-f195.google.com <mb@lightnvm.io>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 24 Jun 2019 03:43:21 -0400
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: [dm-devel] [PATCH 3/4] scsi: sd_zbc: add zone open, close,
	and finish support
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Mon, 24 Jun 2019 07:43:57 +0000 (UTC)

From: Ajay Joshi <ajay.joshi@wdc.com>

Implement REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH
support to allow explicit control of zone states.

Signed-off-by: Ajay Joshi <ajay.joshi@wdc.com>
---
 drivers/scsi/sd.c     | 15 ++++++++++++++-
 drivers/scsi/sd.h     |  6 ++++--
 drivers/scsi/sd_zbc.c | 18 +++++++++++++-----
 3 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index a3406bd62391..89f955a01d44 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1292,7 +1292,17 @@ static blk_status_t sd_init_command(struct scsi_cmnd *cmd)
 	case REQ_OP_WRITE:
 		return sd_setup_read_write_cmnd(cmd);
 	case REQ_OP_ZONE_RESET:
-		return sd_zbc_setup_reset_cmnd(cmd);
+		return sd_zbc_setup_zone_mgmt_op_cmnd(cmd,
+					ZO_RESET_WRITE_POINTER);
+	case REQ_OP_ZONE_OPEN:
+		return sd_zbc_setup_zone_mgmt_op_cmnd(cmd,
+					ZO_OPEN_ZONE);
+	case REQ_OP_ZONE_CLOSE:
+		return sd_zbc_setup_zone_mgmt_op_cmnd(cmd,
+					ZO_CLOSE_ZONE);
+	case REQ_OP_ZONE_FINISH:
+		return sd_zbc_setup_zone_mgmt_op_cmnd(cmd,
+					ZO_FINISH_ZONE);
 	default:
 		WARN_ON_ONCE(1);
 		return BLK_STS_NOTSUPP;
@@ -1958,6 +1968,9 @@ static int sd_done(struct scsi_cmnd *SCpnt)
 	case REQ_OP_WRITE_ZEROES:
 	case REQ_OP_WRITE_SAME:
 	case REQ_OP_ZONE_RESET:
+	case REQ_OP_ZONE_OPEN:
+	case REQ_OP_ZONE_CLOSE:
+	case REQ_OP_ZONE_FINISH:
 		if (!result) {
 			good_bytes = blk_rq_bytes(req);
 			scsi_set_resid(SCpnt, 0);
diff --git a/drivers/scsi/sd.h b/drivers/scsi/sd.h
index 5796ace76225..9a20633caefa 100644
--- a/drivers/scsi/sd.h
+++ b/drivers/scsi/sd.h
@@ -209,7 +209,8 @@ static inline int sd_is_zoned(struct scsi_disk *sdkp)
 
 extern int sd_zbc_read_zones(struct scsi_disk *sdkp, unsigned char *buffer);
 extern void sd_zbc_print_zones(struct scsi_disk *sdkp);
-extern blk_status_t sd_zbc_setup_reset_cmnd(struct scsi_cmnd *cmd);
+extern blk_status_t sd_zbc_setup_zone_mgmt_op_cmnd(struct scsi_cmnd *cmd,
+						   unsigned char op);
 extern void sd_zbc_complete(struct scsi_cmnd *cmd, unsigned int good_bytes,
 			    struct scsi_sense_hdr *sshdr);
 extern int sd_zbc_report_zones(struct gendisk *disk, sector_t sector,
@@ -226,7 +227,8 @@ static inline int sd_zbc_read_zones(struct scsi_disk *sdkp,
 
 static inline void sd_zbc_print_zones(struct scsi_disk *sdkp) {}
 
-static inline blk_status_t sd_zbc_setup_reset_cmnd(struct scsi_cmnd *cmd)
+static inline blk_status_t sd_zbc_setup_zone_mgmt_op_cmnd(struct scsi_cmnd *cmd,
+							  unsigned char op)
 {
 	return BLK_STS_TARGET;
 }
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 7334024b64f1..41020db5353a 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -168,12 +168,17 @@ static inline sector_t sd_zbc_zone_sectors(struct scsi_disk *sdkp)
 }
 
 /**
- * sd_zbc_setup_reset_cmnd - Prepare a RESET WRITE POINTER scsi command.
- * @cmd: the command to setup
+ * sd_zbc_setup_zone_mgmt_op_cmnd - Prepare a zone ZBC_OUT command. The
+ *                                  operations can be RESET WRITE POINTER,
+ *                                  OPEN, CLOSE or FINISH.
+ * @cmd: The command to setup
+ * @op: Operation to be performed
  *
- * Called from sd_init_command() for a REQ_OP_ZONE_RESET request.
+ * Called from sd_init_command() for REQ_OP_ZONE_RESET, REQ_OP_ZONE_OPEN,
+ * REQ_OP_ZONE_CLOSE or REQ_OP_ZONE_FINISH requests.
  */
-blk_status_t sd_zbc_setup_reset_cmnd(struct scsi_cmnd *cmd)
+blk_status_t sd_zbc_setup_zone_mgmt_op_cmnd(struct scsi_cmnd *cmd,
+					    unsigned char op)
 {
 	struct request *rq = cmd->request;
 	struct scsi_disk *sdkp = scsi_disk(rq->rq_disk);
@@ -194,7 +199,7 @@ blk_status_t sd_zbc_setup_reset_cmnd(struct scsi_cmnd *cmd)
 	cmd->cmd_len = 16;
 	memset(cmd->cmnd, 0, cmd->cmd_len);
 	cmd->cmnd[0] = ZBC_OUT;
-	cmd->cmnd[1] = ZO_RESET_WRITE_POINTER;
+	cmd->cmnd[1] = op;
 	put_unaligned_be64(block, &cmd->cmnd[2]);
 
 	rq->timeout = SD_TIMEOUT;
@@ -222,6 +227,9 @@ void sd_zbc_complete(struct scsi_cmnd *cmd, unsigned int good_bytes,
 
 	switch (req_op(rq)) {
 	case REQ_OP_ZONE_RESET:
+	case REQ_OP_ZONE_OPEN:
+	case REQ_OP_ZONE_CLOSE:
+	case REQ_OP_ZONE_FINISH:
 
 		if (result &&
 		    sshdr->sense_key == ILLEGAL_REQUEST &&
-- 
2.19.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
