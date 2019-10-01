Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEAAC3F8B
	for <lists+dm-devel@lfdr.de>; Tue,  1 Oct 2019 20:15:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3A0A308402D;
	Tue,  1 Oct 2019 18:15:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB9845D712;
	Tue,  1 Oct 2019 18:15:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05A1B1803518;
	Tue,  1 Oct 2019 18:14:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x91IEcn8011263 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 1 Oct 2019 14:14:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B7C960A35; Tue,  1 Oct 2019 18:14:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B59EF643D8;
	Tue,  1 Oct 2019 18:14:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD44E105795A;
	Tue,  1 Oct 2019 18:14:27 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B233721906;
	Tue,  1 Oct 2019 18:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569953667;
	bh=gn25fPDEIQS8i8mJ0KaCzez3mOIHz7cI8b0zXTGUwrk=;
	h=Subject:To:Cc:From:Date:From;
	b=n10qIo+wRHriao03rfSQg0i8shQjZKPwZmpbM+FKBVk5qtR4tTqT581bb8IomOLlL
	GcH05ljUw8XPyHHWssmf7JH4v637y90+PwsAPbU1pFaEzwky61aI0nz4d6fFCsFAOy
	v9EsF9f6l+LRYzNA/6vWP7iB6vwF1KwsdiPYrDOk=
To: axboe@kernel.dk, bvanassche@acm.org, dm-devel@redhat.com,
	emilne@redhat.com, gregkh@linuxfoundation.org, hare@suse.com,
	hch@lst.de, ming.lei@redhat.com, snitzer@redhat.com
From: <gregkh@linuxfoundation.org>
Date: Tue, 01 Oct 2019 20:06:35 +0200
Message-ID: <1569953195239166@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.64]);
	Tue, 01 Oct 2019 18:14:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Tue, 01 Oct 2019 18:14:27 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'gregkh@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -2.527  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	RCVD_IN_DNSWL_HI, SORTED_RECIPS, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<gregkh@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: stable-commits@vger.kernel.org
Subject: [dm-devel] Patch "scsi: implement .cleanup_rq callback" has been
	added to the 5.2-stable tree
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 01 Oct 2019 18:15:11 +0000 (UTC)


This is a note to let you know that I've just added the patch titled

    scsi: implement .cleanup_rq callback

to the 5.2-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     scsi-implement-.cleanup_rq-callback.patch
and it can be found in the queue-5.2 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From b7e9e1fb7a9227be34ad4a5e778022c3164494cf Mon Sep 17 00:00:00 2001
From: Ming Lei <ming.lei@redhat.com>
Date: Thu, 25 Jul 2019 10:05:00 +0800
Subject: scsi: implement .cleanup_rq callback

From: Ming Lei <ming.lei@redhat.com>

commit b7e9e1fb7a9227be34ad4a5e778022c3164494cf upstream.

Implement .cleanup_rq() callback for freeing driver private part
of the request. Then we can avoid to leak this part if the request isn't
completed by SCSI, and freed by blk-mq or upper layer(such as dm-rq) finally.

Cc: Ewan D. Milne <emilne@redhat.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Hannes Reinecke <hare@suse.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Mike Snitzer <snitzer@redhat.com>
Cc: dm-devel@redhat.com
Cc: <stable@vger.kernel.org>
Fixes: 396eaf21ee17 ("blk-mq: improve DM's blk-mq IO merging via blk_insert_cloned_request feedback")
Signed-off-by: Ming Lei <ming.lei@redhat.com>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/scsi/scsi_lib.c |   13 +++++++++++++
 1 file changed, 13 insertions(+)

--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -1073,6 +1073,18 @@ static void scsi_initialize_rq(struct re
 	cmd->retries = 0;
 }
 
+/*
+ * Only called when the request isn't completed by SCSI, and not freed by
+ * SCSI
+ */
+static void scsi_cleanup_rq(struct request *rq)
+{
+	if (rq->rq_flags & RQF_DONTPREP) {
+		scsi_mq_uninit_cmd(blk_mq_rq_to_pdu(rq));
+		rq->rq_flags &= ~RQF_DONTPREP;
+	}
+}
+
 /* Add a command to the list used by the aacraid and dpt_i2o drivers */
 void scsi_add_cmd_to_list(struct scsi_cmnd *cmd)
 {
@@ -1800,6 +1812,7 @@ static const struct blk_mq_ops scsi_mq_o
 	.init_request	= scsi_mq_init_request,
 	.exit_request	= scsi_mq_exit_request,
 	.initialize_rq_fn = scsi_initialize_rq,
+	.cleanup_rq	= scsi_cleanup_rq,
 	.busy		= scsi_mq_lld_busy,
 	.map_queues	= scsi_map_queues,
 };


Patches currently in stable-queue which might be from ming.lei@redhat.com are

queue-5.2/scsi-implement-.cleanup_rq-callback.patch

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
