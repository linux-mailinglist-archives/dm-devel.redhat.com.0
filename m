Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 133CF14574D
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jan 2020 14:58:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579701515;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rDNhLA3FfMmc382AEnkuwLbNfk5v71HZPyyziHUMRlg=;
	b=Hq9je2M9czeq6FBwLQFuevbn/mb7wtM2TsCbH67zDH5Q/EqMPXqqELhYlAqW9Q8ogaa06S
	5iGsRY6gfF/8bESBLKRG1wnpi90HgtLpkPKQwf3t0kx0os1aH6KGf2SOsZuhLkU+yUrrQ1
	EdFuVe1weMdsa7x3w902aR2ChW3MqKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-dV43G4myPceTXHf8b9ln8A-1; Wed, 22 Jan 2020 08:58:33 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47E68100551A;
	Wed, 22 Jan 2020 13:58:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F2EA5C28C;
	Wed, 22 Jan 2020 13:58:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B55F318089D0;
	Wed, 22 Jan 2020 13:58:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MAwq3t002588 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 05:58:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 123C12166B28; Wed, 22 Jan 2020 10:58:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DFAE2166B27
	for <dm-devel@redhat.com>; Wed, 22 Jan 2020 10:58:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD3B880289A
	for <dm-devel@redhat.com>; Wed, 22 Jan 2020 10:58:51 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-323-F3K2MR_PPjSj4sVHHmorLA-1;
	Wed, 22 Jan 2020 05:58:50 -0500
Received: from dhcp-172-16-24-104.sw.ru ([172.16.24.104]
	helo=localhost.localdomain) by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1iuDi4-0002gb-Ea; Wed, 22 Jan 2020 13:58:08 +0300
From: Kirill Tkhai <ktkhai@virtuozzo.com>
To: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	martin.petersen@oracle.com, bob.liu@oracle.com, axboe@kernel.dk,
	agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
	song@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	Chaitanya.Kulkarni@wdc.com, darrick.wong@oracle.com,
	ming.lei@redhat.com, osandov@fb.com, jthumshirn@suse.de,
	minwoo.im.dev@gmail.com, damien.lemoal@wdc.com,
	andrea.parri@amarulasolutions.com, hare@suse.com, tj@kernel.org,
	ajay.joshi@wdc.com, sagi@grimberg.me, dsterba@suse.com,
	chaitanya.kulkarni@wdc.com, bvanassche@acm.org, dhowells@redhat.com,
	asml.silence@gmail.com, ktkhai@virtuozzo.com
Date: Wed, 22 Jan 2020 13:58:08 +0300
Message-ID: <157969068832.174869.10818825289800365633.stgit@localhost.localdomain>
In-Reply-To: <157968992539.174869.7490844754165043549.stgit@localhost.localdomain>
References: <157968992539.174869.7490844754165043549.stgit@localhost.localdomain>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-MC-Unique: F3K2MR_PPjSj4sVHHmorLA-1
X-MC-Unique: dV43G4myPceTXHf8b9ln8A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00MAwq3t002588
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:58:06 -0500
Subject: [dm-devel] [PATCH v5 3/6] block: Introduce
 blk_queue_get_max_write_zeroes_sectors()
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

This introduces a new primitive, which returns max sectors
for REQ_OP_WRITE_ZEROES operation.
@op_flags is unused now, and it will be enabled in next patch.

Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
---
 block/blk-core.c       |    2 +-
 block/blk-merge.c      |    9 ++++++---
 include/linux/blkdev.h |    8 +++++++-
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index ac2634bcda1f..2edcd55624f1 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -978,7 +978,7 @@ generic_make_request_checks(struct bio *bio)
 			goto not_supported;
 		break;
 	case REQ_OP_WRITE_ZEROES:
-		if (!q->limits.max_write_zeroes_sectors)
+		if (!blk_queue_get_max_write_zeroes_sectors(q, bio->bi_opf))
 			goto not_supported;
 		break;
 	default:
diff --git a/block/blk-merge.c b/block/blk-merge.c
index 1534ed736363..467b292bc6e8 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -105,15 +105,18 @@ static struct bio *blk_bio_discard_split(struct request_queue *q,
 static struct bio *blk_bio_write_zeroes_split(struct request_queue *q,
 		struct bio *bio, struct bio_set *bs, unsigned *nsegs)
 {
+	unsigned int max_sectors;
+
+	max_sectors = blk_queue_get_max_write_zeroes_sectors(q, bio->bi_opf);
 	*nsegs = 0;
 
-	if (!q->limits.max_write_zeroes_sectors)
+	if (!max_sectors)
 		return NULL;
 
-	if (bio_sectors(bio) <= q->limits.max_write_zeroes_sectors)
+	if (bio_sectors(bio) <= max_sectors)
 		return NULL;
 
-	return bio_split(bio, q->limits.max_write_zeroes_sectors, GFP_NOIO, bs);
+	return bio_split(bio, max_sectors, GFP_NOIO, bs);
 }
 
 static struct bio *blk_bio_write_same_split(struct request_queue *q,
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 23a5850f35f6..264202fa3bf8 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -988,6 +988,12 @@ static inline struct bio_vec req_bvec(struct request *rq)
 	return mp_bvec_iter_bvec(rq->bio->bi_io_vec, rq->bio->bi_iter);
 }
 
+static inline unsigned int blk_queue_get_max_write_zeroes_sectors(
+		struct request_queue *q, unsigned int op_flags)
+{
+	return q->limits.max_write_zeroes_sectors;
+}
+
 static inline unsigned int blk_queue_get_max_sectors(struct request_queue *q,
 						     unsigned int op_flags)
 {
@@ -1001,7 +1007,7 @@ static inline unsigned int blk_queue_get_max_sectors(struct request_queue *q,
 		return q->limits.max_write_same_sectors;
 
 	if (unlikely(op == REQ_OP_WRITE_ZEROES))
-		return q->limits.max_write_zeroes_sectors;
+		return blk_queue_get_max_write_zeroes_sectors(q, op_flags);
 
 	return q->limits.max_sectors;
 }



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

