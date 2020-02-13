Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 94B691659C7
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 10:06:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582189595;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P4HlSIEKVz4VOH5+3mGmWv7UvaGX5tc/fOVbT0GJFXs=;
	b=dyY5yvcBWsCGNkcSIYmcOKC3a+hBy6pvoOv9DVV3WTJlwapNkpICIvglu4Vb1gzmnsX0JK
	Tokl9piqzFP2HaIo/ZRk4kLA7ytvibUs9n9QqYLnDHPqk9WdZE3hvzwtZN6ETSW17jY68N
	WAkcLFPT5bHNbP93TdtPJxxbIPrQOPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-n9krjzrGPoyWOhDzY12Rjg-1; Thu, 20 Feb 2020 04:06:32 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4487A13FD;
	Thu, 20 Feb 2020 09:06:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A7FA9077C;
	Thu, 20 Feb 2020 09:06:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AB178B2DB;
	Thu, 20 Feb 2020 09:06:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01D7dsXw017103 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 02:39:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 890F111232F; Thu, 13 Feb 2020 07:39:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84698112327
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 07:39:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E0608EFB21
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 07:39:49 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-282-1acXQO9LPgqOxzb4FNZT4g-1;
	Thu, 13 Feb 2020 02:39:46 -0500
Received: from [192.168.15.156] (helo=localhost.localdomain)
	by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1j295d-0001TW-OE; Thu, 13 Feb 2020 10:39:13 +0300
From: Kirill Tkhai <ktkhai@virtuozzo.com>
To: martin.petersen@oracle.com, bob.liu@oracle.com, axboe@kernel.dk,
	darrick.wong@oracle.com
Date: Thu, 13 Feb 2020 10:39:13 +0300
Message-ID: <158157955322.111879.16371696985080169961.stgit@localhost.localdomain>
In-Reply-To: <158157930219.111879.12072477040351921368.stgit@localhost.localdomain>
References: <158157930219.111879.12072477040351921368.stgit@localhost.localdomain>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-MC-Unique: 1acXQO9LPgqOxzb4FNZT4g-1
X-MC-Unique: n9krjzrGPoyWOhDzY12Rjg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01D7dsXw017103
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 04:05:51 -0500
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com,
	bvanassche@acm.org, minwoo.im.dev@gmail.com, jthumshirn@suse.de,
	ajay.joshi@wdc.com, chaitanya.kulkarni@wdc.com,
	ming.lei@redhat.com, linux-block@vger.kernel.org,
	ktkhai@virtuozzo.com, dsterba@suse.com, sagi@grimberg.me,
	damien.lemoal@wdc.com, tytso@mit.edu,
	linux-kernel@vger.kernel.org, tj@kernel.org, asml.silence@gmail.com
Subject: [dm-devel] [PATCH v7 2/6] block: Pass op_flags into
	blk_queue_get_max_sectors()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This preparation patch changes argument type, and now
the function takes full op_flags instead of just op code.

Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
---
 block/blk-core.c       |    4 ++--
 include/linux/blkdev.h |    8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 089e890ab208..28a6d46eb982 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1221,10 +1221,10 @@ EXPORT_SYMBOL(submit_bio);
 static int blk_cloned_rq_check_limits(struct request_queue *q,
 				      struct request *rq)
 {
-	if (blk_rq_sectors(rq) > blk_queue_get_max_sectors(q, req_op(rq))) {
+	if (blk_rq_sectors(rq) > blk_queue_get_max_sectors(q, rq->cmd_flags)) {
 		printk(KERN_ERR "%s: over max size limit. (%u > %u)\n",
 			__func__, blk_rq_sectors(rq),
-			blk_queue_get_max_sectors(q, req_op(rq)));
+			blk_queue_get_max_sectors(q, rq->cmd_flags));
 		return -EIO;
 	}
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 1e3c08854b09..f4ec7ae214ab 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -988,8 +988,10 @@ static inline struct bio_vec req_bvec(struct request *rq)
 }
 
 static inline unsigned int blk_queue_get_max_sectors(struct request_queue *q,
-						     int op)
+						     unsigned int op_flags)
 {
+	int op = op_flags & REQ_OP_MASK;
+
 	if (unlikely(op == REQ_OP_DISCARD || op == REQ_OP_SECURE_ERASE))
 		return min(q->limits.max_discard_sectors,
 			   UINT_MAX >> SECTOR_SHIFT);
@@ -1028,10 +1030,10 @@ static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
 	if (!q->limits.chunk_sectors ||
 	    req_op(rq) == REQ_OP_DISCARD ||
 	    req_op(rq) == REQ_OP_SECURE_ERASE)
-		return blk_queue_get_max_sectors(q, req_op(rq));
+		return blk_queue_get_max_sectors(q, rq->cmd_flags);
 
 	return min(blk_max_size_offset(q, offset),
-			blk_queue_get_max_sectors(q, req_op(rq)));
+			blk_queue_get_max_sectors(q, rq->cmd_flags));
 }
 
 static inline unsigned int blk_rq_count_bios(struct request *rq)



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

