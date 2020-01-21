Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A7678144D3D
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579681300;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A0QpIbGdeYl0hR4UB/XkHutrxViMG4QxXlCN5xz09do=;
	b=TfhnaYsJX5qgJjVui6W1AFQr/RKPhhWjxpgr37bSoc8Mjsdo7R/zDe806Su+55Z84Hwjjq
	DWCEw3zZLkee4eWtVaHXheM7DyRHd3NvILD6JpUBG8aKbCOaj9OyPnDjOM7/iutyzSSL7+
	VlK+bS5aNUyJWPLSA34pEzqTVbVTZYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-KWC0mUFSOUinbzsLpfC1FA-1; Wed, 22 Jan 2020 03:21:37 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B5E6DBB1;
	Wed, 22 Jan 2020 08:21:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C0A41001B28;
	Wed, 22 Jan 2020 08:21:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ADAD118089D6;
	Wed, 22 Jan 2020 08:21:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00LAJRqX004436 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jan 2020 05:19:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3CFDE2166B30; Tue, 21 Jan 2020 10:19:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 390B12166B2F
	for <dm-devel@redhat.com>; Tue, 21 Jan 2020 10:19:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD3C9185B0CA
	for <dm-devel@redhat.com>; Tue, 21 Jan 2020 10:19:24 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-12-J5LwdWXxP7OmmlFKOYaTPw-1;
	Tue, 21 Jan 2020 05:19:22 -0500
Received: from dhcp-172-16-24-104.sw.ru ([172.16.24.104]
	helo=localhost.localdomain) by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1itqcs-000692-3J; Tue, 21 Jan 2020 13:19:14 +0300
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
Date: Tue, 21 Jan 2020 13:19:12 +0300
Message-ID: <157960195201.97730.125791396853976710.stgit@localhost.localdomain>
In-Reply-To: <157960153921.97730.9973412459876396302.stgit@localhost.localdomain>
References: <157960153921.97730.9973412459876396302.stgit@localhost.localdomain>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-MC-Unique: J5LwdWXxP7OmmlFKOYaTPw-1
X-MC-Unique: KWC0mUFSOUinbzsLpfC1FA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00LAJRqX004436
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 22 Jan 2020 03:20:59 -0500
Subject: [dm-devel] [PATCH v3 6/7] dm: Directly disable max_allocate_sectors
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
index acd681939112..b9b6d78035a2 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -798,5 +798,6 @@ static inline void mddev_check_write_zeroes(struct mddev *mddev, struct bio *bio
 	if (bio_op(bio) == REQ_OP_WRITE_ZEROES &&
 	    !bio->bi_disk->queue->limits.max_write_zeroes_sectors)
 		mddev->queue->limits.max_write_zeroes_sectors = 0;
+	blk_queue_max_allocate_sectors(mddev->queue);
 }
 #endif /* _MD_MD_H */



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

