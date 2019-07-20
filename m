Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED446ED77
	for <lists+dm-devel@lfdr.de>; Sat, 20 Jul 2019 05:07:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F7E6859FE;
	Sat, 20 Jul 2019 03:07:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE4C3196F6;
	Sat, 20 Jul 2019 03:07:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B7144EA30;
	Sat, 20 Jul 2019 03:07:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6K37Cel016021 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jul 2019 23:07:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F9631A7CD; Sat, 20 Jul 2019 03:07:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (ovpn-8-23.pek2.redhat.com [10.72.8.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0788196F6;
	Sat, 20 Jul 2019 03:07:06 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat, 20 Jul 2019 11:06:37 +0800
Message-Id: <20190720030637.14447-3-ming.lei@redhat.com>
In-Reply-To: <20190720030637.14447-1-ming.lei@redhat.com>
References: <20190720030637.14447-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Hannes Reinecke <hare@suse.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, "James E . J . Bottomley" <jejb@linux.ibm.com>,
	"Ewan D . Milne" <emilne@redhat.com>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	stable@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [dm-devel] [PATCH V2 2/2] scsi: implement .cleanup_rq callback
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Sat, 20 Jul 2019 03:07:34 +0000 (UTC)

Implement .cleanup_rq() callback for freeing driver private part of the
request. Then we can avoid to leak request private data if the request
isn't completed by SCSI, and freed by blk-mq or upper layer(such as dm-rq)
finally.

Cc: Ewan D. Milne <emilne@redhat.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Hannes Reinecke <hare@suse.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Mike Snitzer <snitzer@redhat.com>
Cc: dm-devel@redhat.com
Cc: <stable@vger.kernel.org>
Fixes: 396eaf21ee17 ("blk-mq: improve DM's blk-mq IO merging via blk_insert_cloned_request feedback")
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/scsi/scsi_lib.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index e1da8c70a266..52537c145762 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -154,12 +154,9 @@ scsi_set_blocked(struct scsi_cmnd *cmd, int reason)
 
 static void scsi_mq_requeue_cmd(struct scsi_cmnd *cmd)
 {
-	if (cmd->request->rq_flags & RQF_DONTPREP) {
-		cmd->request->rq_flags &= ~RQF_DONTPREP;
-		scsi_mq_uninit_cmd(cmd);
-	} else {
-		WARN_ON_ONCE(true);
-	}
+	WARN_ON_ONCE(!(cmd->request->rq_flags & RQF_DONTPREP));
+
+	scsi_mq_uninit_cmd(cmd);
 	blk_mq_requeue_request(cmd->request, true);
 }
 
@@ -563,9 +560,13 @@ static void scsi_mq_free_sgtables(struct scsi_cmnd *cmd)
 
 static void scsi_mq_uninit_cmd(struct scsi_cmnd *cmd)
 {
+	if (!(cmd->request->rq_flags & RQF_DONTPREP))
+		return;
+
 	scsi_mq_free_sgtables(cmd);
 	scsi_uninit_cmd(cmd);
 	scsi_del_cmd_from_list(cmd);
+	cmd->request->rq_flags &= ~RQF_DONTPREP;
 }
 
 /* Returns false when no more bytes to process, true if there are more */
@@ -1089,6 +1090,17 @@ static void scsi_initialize_rq(struct request *rq)
 	cmd->retries = 0;
 }
 
+/*
+ * Only called when the request isn't completed by SCSI, and not freed by
+ * SCSI
+ */
+static void scsi_cleanup_rq(struct request *rq)
+{
+	struct scsi_cmnd *cmd = blk_mq_rq_to_pdu(rq);
+
+	scsi_mq_uninit_cmd(cmd);
+}
+
 /* Add a command to the list used by the aacraid and dpt_i2o drivers */
 void scsi_add_cmd_to_list(struct scsi_cmnd *cmd)
 {
@@ -1708,8 +1720,7 @@ static blk_status_t scsi_queue_rq(struct blk_mq_hw_ctx *hctx,
 		 * we hit an error, as we will never see this command
 		 * again.
 		 */
-		if (req->rq_flags & RQF_DONTPREP)
-			scsi_mq_uninit_cmd(cmd);
+		scsi_mq_uninit_cmd(cmd);
 		break;
 	}
 	return ret;
@@ -1816,6 +1827,7 @@ static const struct blk_mq_ops scsi_mq_ops = {
 	.init_request	= scsi_mq_init_request,
 	.exit_request	= scsi_mq_exit_request,
 	.initialize_rq_fn = scsi_initialize_rq,
+	.cleanup_rq	= scsi_cleanup_rq,
 	.busy		= scsi_mq_lld_busy,
 	.map_queues	= scsi_map_queues,
 };
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
