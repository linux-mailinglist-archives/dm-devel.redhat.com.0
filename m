Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6F83FE62EC
	for <lists+dm-devel@lfdr.de>; Sun, 27 Oct 2019 15:07:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572185250;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2/r/SdgvW3jP+h6ggMaHkxyJ4ieTIiHF8gbmyUwXRCY=;
	b=DKZ5emNz+hu2XEU8dRqFhnhiUpKFjjLSCdEzGlwLcdiPZ8BGW8jRGRFkd92FDWJjjRT+TY
	36SmQ5d75oZmwKcF7XkTbueZ0qn6zEewZWSt1Fbt6wfUhUu3ihYGbISHFFCa4bbWGJRDfy
	uytMvaICmrXsGAlMdeM3uqRU3WlMxMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-Ezt2zCIZOSmx3Ny4ZEkeRA-1; Sun, 27 Oct 2019 10:07:26 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6954801E5C;
	Sun, 27 Oct 2019 14:07:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2E1B5DA5B;
	Sun, 27 Oct 2019 14:07:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D363180B761;
	Sun, 27 Oct 2019 14:07:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9RE7HTE007693 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 27 Oct 2019 10:07:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9A29160603; Sun, 27 Oct 2019 14:07:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3605760A9D;
	Sun, 27 Oct 2019 14:07:12 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DD7B300DFA9;
	Sun, 27 Oct 2019 14:06:49 +0000 (UTC)
IronPort-SDR: E8gwrcTKxZY4lMptmsDc211OqxzNM1ovNUSaSgMKvSsda1oKmaWmOwe2OkdwUF9JHcw/paDZJF
	iazzzy1rShzLovxPwRzdC2Xv4LI3HwtsfvBC0554CBwjPbiwg+H+6soSLWvkSiydSQgdpkLXhB
	B/D2F/cv+3Mc/QHPJNJPcpcVZI+HcLBYaDKUqj8AoJUH1J8VyMovoyRVqqK8yOfvlOwieOAmvm
	c8WUtoYL1yNuLQyYiCul7UjSAYY0ii5fgvYuwLmfFb2Zq+QLMpdTOnu/iaVZj1FhGqPrKXKSFb
	6UE=
X-IronPort-AV: E=Sophos;i="5.68,236,1569254400"; d="scan'208";a="122197766"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2019 22:06:03 +0800
IronPort-SDR: 6Tl0gNRiLoZBtyLf9Cfrwv5nQknCoTv1peD9MWqD9sd4mOcxMRsL0wnss5eZj0Og7GChEgSHIX
	wzHhSYSHJOvJWObAAE+Eqerx+e8Q8nBfbCvH+jysbCLAu4DeDzeZWjfyyFS5vd1yWP19aZtcvt
	XZlilKlTd4dl9Uqqoyshffop4xEKN2DVzTx9Su+FJc3TmYYMWDeUr3TyEbAVMXj1gS5uN3XdK+
	tGtUMNUSvZ/DEtdMHbAqxvJBbTDqeZ+o2bMoaurZX6cfr6i9SV1HHz/j7gBff5I6rDIcvR/g9Z
	lYmDUFhRjk0PFrsUIwpB9qrQ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Oct 2019 07:01:32 -0700
IronPort-SDR: xsDPaaX7ug3izD4+t1ANL9/KQMDmbU4f3DDNjrwLsfkJndSpOKgGt6scuMfMQJCEPQOOqwzWYA
	y92DaZ45IgcYGF0KTRJnlkjjif9OuVzxhe/xsvHGhk5uOsI+lCBnMb+bcR269eCkQI57xEnLpw
	IzxLlwRqxVRvZLEcHWC24/jtxIOUZE8ufm+W877LON5TZg4nOIJwOgt0Nqqq0Ys5RDuHnqaY/A
	/11OlB6nDVFNPhq0HvE86JgaTxCnYd3zqRo61hnHUqm0Wt5ShbdUTHyblUwOZJfDDa2/FbfGN3
	0P0=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 07:06:01 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Sun, 27 Oct 2019 23:05:47 +0900
Message-Id: <20191027140549.26272-7-damien.lemoal@wdc.com>
In-Reply-To: <20191027140549.26272-1-damien.lemoal@wdc.com>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Sun, 27 Oct 2019 14:07:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Sun, 27 Oct 2019 14:07:02 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com 216.71.153.144
	esa5.hgst.iphmx.com <prvs=196f58c8b=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>, Keith Busch <kbusch@kernel.org>,
	Hans Holmberg <Hans.Holmberg@wdc.com>, Ajay Joshi <ajay.joshi@wdc.com>,
	Matias Bjorling <matias.bjorling@wdc.com>
Subject: [dm-devel] [PATCH 6/8] scsi: sd_zbc: add zone open, close,
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Ezt2zCIZOSmx3Ny4ZEkeRA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Ajay Joshi <ajay.joshi@wdc.com>

Implement REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH
support to allow explicit control of zone states.

Contains contributions from Matias Bjorling, Hans Holmberg,
Keith Busch and Damien Le Moal.

Signed-off-by: Ajay Joshi <ajay.joshi@wdc.com>
Signed-off-by: Matias Bjorling <matias.bjorling@wdc.com>
Signed-off-by: Hans Holmberg <hans.holmberg@wdc.com>
Signed-off-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/scsi/sd.c     | 15 +++++++++++++--
 drivers/scsi/sd.h     |  8 +++++---
 drivers/scsi/sd_zbc.c | 22 +++++++++++++---------
 3 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 03163ac5fe95..ff0a22e2a34e 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1290,9 +1290,17 @@ static blk_status_t sd_init_command(struct scsi_cmnd *cmd)
 	case REQ_OP_WRITE:
 		return sd_setup_read_write_cmnd(cmd);
 	case REQ_OP_ZONE_RESET:
-		return sd_zbc_setup_reset_cmnd(cmd, false);
+		return sd_zbc_setup_zone_mgmt_cmnd(cmd, ZO_RESET_WRITE_POINTER,
+						   false);
 	case REQ_OP_ZONE_RESET_ALL:
-		return sd_zbc_setup_reset_cmnd(cmd, true);
+		return sd_zbc_setup_zone_mgmt_cmnd(cmd, ZO_RESET_WRITE_POINTER,
+						   true);
+	case REQ_OP_ZONE_OPEN:
+		return sd_zbc_setup_zone_mgmt_cmnd(cmd, ZO_OPEN_ZONE, false);
+	case REQ_OP_ZONE_CLOSE:
+		return sd_zbc_setup_zone_mgmt_cmnd(cmd, ZO_CLOSE_ZONE, false);
+	case REQ_OP_ZONE_FINISH:
+		return sd_zbc_setup_zone_mgmt_cmnd(cmd, ZO_FINISH_ZONE, false);
 	default:
 		WARN_ON_ONCE(1);
 		return BLK_STS_NOTSUPP;
@@ -1960,6 +1968,9 @@ static int sd_done(struct scsi_cmnd *SCpnt)
 	case REQ_OP_WRITE_SAME:
 	case REQ_OP_ZONE_RESET:
 	case REQ_OP_ZONE_RESET_ALL:
+	case REQ_OP_ZONE_OPEN:
+	case REQ_OP_ZONE_CLOSE:
+	case REQ_OP_ZONE_FINISH:
 		if (!result) {
 			good_bytes = blk_rq_bytes(req);
 			scsi_set_resid(SCpnt, 0);
diff --git a/drivers/scsi/sd.h b/drivers/scsi/sd.h
index 1eab779f812b..bf2102a749bc 100644
--- a/drivers/scsi/sd.h
+++ b/drivers/scsi/sd.h
@@ -209,7 +209,8 @@ static inline int sd_is_zoned(struct scsi_disk *sdkp)
 
 extern int sd_zbc_read_zones(struct scsi_disk *sdkp, unsigned char *buffer);
 extern void sd_zbc_print_zones(struct scsi_disk *sdkp);
-extern blk_status_t sd_zbc_setup_reset_cmnd(struct scsi_cmnd *cmd, bool all);
+blk_status_t sd_zbc_setup_zone_mgmt_cmnd(struct scsi_cmnd *cmd,
+					 unsigned char op, bool all);
 extern void sd_zbc_complete(struct scsi_cmnd *cmd, unsigned int good_bytes,
 			    struct scsi_sense_hdr *sshdr);
 extern int sd_zbc_report_zones(struct gendisk *disk, sector_t sector,
@@ -225,8 +226,9 @@ static inline int sd_zbc_read_zones(struct scsi_disk *sdkp,
 
 static inline void sd_zbc_print_zones(struct scsi_disk *sdkp) {}
 
-static inline blk_status_t sd_zbc_setup_reset_cmnd(struct scsi_cmnd *cmd,
-						   bool all)
+static inline blk_status_t sd_zbc_setup_zone_mgmt_cmnd(struct scsi_cmnd *cmd,
+						       unsigned char op,
+						       bool all)
 {
 	return BLK_STS_TARGET;
 }
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 1efc69e194f8..39f10ec0dfcf 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -207,13 +207,17 @@ static inline sector_t sd_zbc_zone_sectors(struct scsi_disk *sdkp)
 }
 
 /**
- * sd_zbc_setup_reset_cmnd - Prepare a RESET WRITE POINTER scsi command.
+ * sd_zbc_setup_zone_mgmt_cmnd - Prepare a zone ZBC_OUT command. The operations
+ *			can be RESET WRITE POINTER, OPEN, CLOSE or FINISH.
  * @cmd: the command to setup
- * @all: Reset all zones control.
+ * @op: Operation to be performed
+ * @all: All zones control
  *
- * Called from sd_init_command() for a REQ_OP_ZONE_RESET request.
+ * Called from sd_init_command() for REQ_OP_ZONE_RESET, REQ_OP_ZONE_RESET_ALL,
+ * REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE or REQ_OP_ZONE_FINISH requests.
  */
-blk_status_t sd_zbc_setup_reset_cmnd(struct scsi_cmnd *cmd, bool all)
+blk_status_t sd_zbc_setup_zone_mgmt_cmnd(struct scsi_cmnd *cmd,
+					 unsigned char op, bool all)
 {
 	struct request *rq = cmd->request;
 	struct scsi_disk *sdkp = scsi_disk(rq->rq_disk);
@@ -234,7 +238,7 @@ blk_status_t sd_zbc_setup_reset_cmnd(struct scsi_cmnd *cmd, bool all)
 	cmd->cmd_len = 16;
 	memset(cmd->cmnd, 0, cmd->cmd_len);
 	cmd->cmnd[0] = ZBC_OUT;
-	cmd->cmnd[1] = ZO_RESET_WRITE_POINTER;
+	cmd->cmnd[1] = op;
 	if (all)
 		cmd->cmnd[14] = 0x1;
 	else
@@ -263,14 +267,14 @@ void sd_zbc_complete(struct scsi_cmnd *cmd, unsigned int good_bytes,
 	int result = cmd->result;
 	struct request *rq = cmd->request;
 
-	if (req_op(rq) == REQ_OP_ZONE_RESET &&
+	if (op_is_zone_mgmt(req_op(rq)) &&
 	    result &&
 	    sshdr->sense_key == ILLEGAL_REQUEST &&
 	    sshdr->asc == 0x24) {
 		/*
-		 * INVALID FIELD IN CDB error: reset of a conventional
-		 * zone was attempted. Nothing to worry about, so be
-		 * quiet about the error.
+		 * INVALID FIELD IN CDB error: a zone management command was
+		 * attempted on a conventional zone. Nothing to worry about,
+		 * so be quiet about the error.
 		 */
 		rq->rq_flags |= RQF_QUIET;
 	}
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

