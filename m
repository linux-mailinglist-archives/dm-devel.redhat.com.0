Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E861E144D48
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579681306;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z7/6chBEcc9m/EoEJhMdXUv/BncuHV9xOj8xvKsaK3Y=;
	b=jRMAvzCUZDwJPjcE4P7P4zrgnRZ2eZTTWxq4iksROPvGwwMeVeL2bBnIEQhfsch9bYyKmr
	sRoHbCopiSlYD0BmcOyf5MhYLCSBYWFOeQOVzofkJcoEDCfz9lCb/Gea43MevlKHqJ1Ft1
	IBs/cQEU71+KRK+txHbK4kDEWbfEUHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-HD6iAn5-MReDWyoHNnAPJg-1; Wed, 22 Jan 2020 03:21:42 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DD35DBA8;
	Wed, 22 Jan 2020 08:21:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0683E5DA75;
	Wed, 22 Jan 2020 08:21:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 931191808878;
	Wed, 22 Jan 2020 08:21:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00LAhI8k005963 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 05:43:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1152210031FE; Tue, 21 Jan 2020 10:43:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C8E910CD639
	for <dm-devel@redhat.com>; Tue, 21 Jan 2020 10:43:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A64B85A32B
	for <dm-devel@redhat.com>; Tue, 21 Jan 2020 10:43:16 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-45-iGS2HPkMPOCk1znjFPgzsQ-1;
	Tue, 21 Jan 2020 05:43:11 -0500
Received: from dhcp-172-16-24-104.sw.ru ([172.16.24.104]
	helo=localhost.localdomain) by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1itqzl-0006Qk-6Q; Tue, 21 Jan 2020 13:42:53 +0300
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
Date: Tue, 21 Jan 2020 13:42:52 +0300
Message-ID: <157960337238.108120.18048939587162465175.stgit@localhost.localdomain>
In-Reply-To: <157960325642.108120.13626623438131044304.stgit@localhost.localdomain>
References: <157960325642.108120.13626623438131044304.stgit@localhost.localdomain>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-MC-Unique: iGS2HPkMPOCk1znjFPgzsQ-1
X-MC-Unique: HD6iAn5-MReDWyoHNnAPJg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00LAhI8k005963
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 22 Jan 2020 03:20:59 -0500
Subject: [dm-devel] [PATCH v4 6/7] dm: Directly disable max_allocate_sectors
	for now
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since dm inherits limits from underlining block devices,
this patch directly disables max_allocate_sectors for dm
till full allocation support is implemented.

This prevents high-level primitives (generic_make_request_checks(),
__blkdev_issue_write_zeroes(), ...) from sending REQ_ALLOCATE
requests.

Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
---
 drivers/md/dm-table.c |    2 ++
 drivers/md/md.h       |    1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 0a2cc197f62b..e245c0d882aa 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -489,6 +489,7 @@ static int dm_set_device_limits(struct dm_target *ti, struct dm_dev *dev,
 		       (unsigned long long) start << SECTOR_SHIFT);
 
 	limits->zoned = blk_queue_zoned_model(q);
+	blk_queue_max_allocate_sectors(q, 0);
 
 	return 0;
 }
@@ -1548,6 +1549,7 @@ int dm_calculate_queue_limits(struct dm_table *table,
 			       dm_device_name(table->md),
 			       (unsigned long long) ti->begin,
 			       (unsigned long long) ti->len);
+		limits->max_allocate_sectors = 0;
 
 		/*
 		 * FIXME: this should likely be moved to blk_stack_limits(), would
diff --git a/drivers/md/md.h b/drivers/md/md.h
index acd681939112..d9088122674d 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -798,5 +798,6 @@ static inline void mddev_check_write_zeroes(struct mddev *mddev, struct bio *bio
 	if (bio_op(bio) == REQ_OP_WRITE_ZEROES &&
 	    !bio->bi_disk->queue->limits.max_write_zeroes_sectors)
 		mddev->queue->limits.max_write_zeroes_sectors = 0;
+	blk_queue_max_allocate_sectors(mddev->queue, 0);
 }
 #endif /* _MD_MD_H */



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

