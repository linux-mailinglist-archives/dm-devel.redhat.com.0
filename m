Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8561659C0
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 10:06:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582189585;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mPFGar9/NEzfBWvpN8ETY0/P9Vv+Xzk7zPbQG1C+PM8=;
	b=N8tPFt0rZvzMUJbThKJSZ3dfa4IkrTj0f5JK3GQPbt8fqVeMG5TFESydU/c3HkVZxAnWEj
	IivQ3qlFtj188uZClq3w0Lng/cv51fWmtX292MHBrT8uCsLOc39iZ+qEm3q9hFWX6mLQNb
	DjrDhodZCnyDzIxpJry8xAKj5SfHOlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-x0nHASMLPdmXuTROEhITzA-1; Thu, 20 Feb 2020 04:06:23 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FD2A100726C;
	Thu, 20 Feb 2020 09:06:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB6275C3FA;
	Thu, 20 Feb 2020 09:06:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 561151803C32;
	Thu, 20 Feb 2020 09:06:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01D7dpoH017078 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 02:39:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B797B2166B2A; Thu, 13 Feb 2020 07:39:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3A912166B2C
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 07:39:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6787A1017E73
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 07:39:51 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-104-siBOAQPwOrKwbPCbs9rT4Q-1;
	Thu, 13 Feb 2020 02:39:47 -0500
Received: from [192.168.15.156] (helo=localhost.localdomain)
	by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1j2961-0001Tq-5i; Thu, 13 Feb 2020 10:39:37 +0300
From: Kirill Tkhai <ktkhai@virtuozzo.com>
To: martin.petersen@oracle.com, bob.liu@oracle.com, axboe@kernel.dk,
	darrick.wong@oracle.com
Date: Thu, 13 Feb 2020 10:39:35 +0300
Message-ID: <158157957565.111879.5952051034259419400.stgit@localhost.localdomain>
In-Reply-To: <158157930219.111879.12072477040351921368.stgit@localhost.localdomain>
References: <158157930219.111879.12072477040351921368.stgit@localhost.localdomain>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-MC-Unique: siBOAQPwOrKwbPCbs9rT4Q-1
X-MC-Unique: x0nHASMLPdmXuTROEhITzA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01D7dpoH017078
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
Subject: [dm-devel] [PATCH v7 6/6] loop: Add support for REQ_ALLOCATE
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Support for new modifier of REQ_OP_WRITE_ZEROES command.
This results in allocation extents in backing file instead
of actual blocks zeroing.

Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
---
 drivers/block/loop.c |   20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 739b372a5112..0704167a5aaa 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -581,6 +581,16 @@ static int lo_rw_aio(struct loop_device *lo, struct loop_cmd *cmd,
 	return 0;
 }
 
+/* Convert REQ_OP_WRITE_ZEROES modifiers into fallocate mode */
+static unsigned int write_zeroes_to_fallocate_mode(unsigned int flags)
+{
+	if (flags & REQ_ALLOCATE)
+		return 0;
+	if (flags & REQ_NOUNMAP)
+		return FALLOC_FL_ZERO_RANGE;
+	return FALLOC_FL_PUNCH_HOLE;
+}
+
 static int do_req_filebacked(struct loop_device *lo, struct request *rq)
 {
 	struct loop_cmd *cmd = blk_mq_rq_to_pdu(rq);
@@ -599,14 +609,8 @@ static int do_req_filebacked(struct loop_device *lo, struct request *rq)
 	case REQ_OP_FLUSH:
 		return lo_req_flush(lo, rq);
 	case REQ_OP_WRITE_ZEROES:
-		/*
-		 * If the caller doesn't want deallocation, call zeroout to
-		 * write zeroes the range.  Otherwise, punch them out.
-		 */
 		return lo_fallocate(lo, rq, pos,
-			(rq->cmd_flags & REQ_NOUNMAP) ?
-				FALLOC_FL_ZERO_RANGE :
-				FALLOC_FL_PUNCH_HOLE);
+			write_zeroes_to_fallocate_mode(rq->cmd_flags));
 	case REQ_OP_DISCARD:
 		return lo_fallocate(lo, rq, pos, FALLOC_FL_PUNCH_HOLE);
 	case REQ_OP_WRITE:
@@ -877,6 +881,7 @@ static void loop_config_discard(struct loop_device *lo)
 		q->limits.discard_alignment = 0;
 		blk_queue_max_discard_sectors(q, 0);
 		blk_queue_max_write_zeroes_sectors(q, 0);
+		blk_queue_max_allocate_sectors(q, 0);
 		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, q);
 		return;
 	}
@@ -886,6 +891,7 @@ static void loop_config_discard(struct loop_device *lo)
 
 	blk_queue_max_discard_sectors(q, UINT_MAX >> 9);
 	blk_queue_max_write_zeroes_sectors(q, UINT_MAX >> 9);
+	blk_queue_max_allocate_sectors(q, UINT_MAX >> 9);
 	blk_queue_flag_set(QUEUE_FLAG_DISCARD, q);
 }
 



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

