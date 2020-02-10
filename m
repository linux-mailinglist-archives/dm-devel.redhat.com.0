Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B24E71571FF
	for <lists+dm-devel@lfdr.de>; Mon, 10 Feb 2020 10:45:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581327922;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JoUv8gywQOqmZsTnHmpWH9jbzHoo7j75nZc51y8q7Do=;
	b=WUcdJbRMk7dLoT2v4f5YX0psEj2jyYQkAiKiB4KeICE1+BjDmCXmxywBz0pNVTZZEbzGW6
	6GPHt5DaHx6AR+YgXRjzaE25faANuEtodvPBlczAGTk/3P4lQUgJDT34racNfHy+K+cLdz
	RQTpkGZa268Xk1vkCQFmUFEL1UxQ7mc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-_fdszEKqMvGyR-T9nCqHCA-1; Mon, 10 Feb 2020 04:45:17 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF5EA100551C;
	Mon, 10 Feb 2020 09:45:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD36B7FB60;
	Mon, 10 Feb 2020 09:45:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0DDF18089D7;
	Mon, 10 Feb 2020 09:45:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01A9YT8p000886 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Feb 2020 04:34:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 052BB728ED; Mon, 10 Feb 2020 09:34:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0141C6DCCF
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 09:34:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCC06800F5A
	for <dm-devel@redhat.com>; Mon, 10 Feb 2020 09:34:28 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-42-Lhcp23kENnK5TzLbVcTqzg-1;
	Mon, 10 Feb 2020 04:34:23 -0500
Received: from dhcp-172-16-24-104.sw.ru ([172.16.24.104]
	helo=localhost.localdomain) by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1j15S2-0000Jm-OM; Mon, 10 Feb 2020 12:33:58 +0300
From: Kirill Tkhai <ktkhai@virtuozzo.com>
To: martin.petersen@oracle.com, bob.liu@oracle.com, axboe@kernel.dk
Date: Mon, 10 Feb 2020 12:33:58 +0300
Message-ID: <158132723860.239613.17590551491822950307.stgit@localhost.localdomain>
In-Reply-To: <158132703141.239613.3550455492676290009.stgit@localhost.localdomain>
References: <158132703141.239613.3550455492676290009.stgit@localhost.localdomain>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-MC-Unique: Lhcp23kENnK5TzLbVcTqzg-1
X-MC-Unique: _fdszEKqMvGyR-T9nCqHCA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01A9YT8p000886
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 10 Feb 2020 04:44:34 -0500
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com,
	bvanassche@acm.org, darrick.wong@oracle.com,
	minwoo.im.dev@gmail.com, jthumshirn@suse.de, ajay.joshi@wdc.com,
	chaitanya.kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, ktkhai@virtuozzo.com,
	dsterba@suse.com, sagi@grimberg.me, damien.lemoal@wdc.com,
	tytso@mit.edu, linux-kernel@vger.kernel.org, tj@kernel.org,
	asml.silence@gmail.com
Subject: [dm-devel] [PATCH v6 5/6] block: Add
	blk_queue_max_allocate_sectors()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a new helper to assign max_allocate_sectors
limit of block device queue.

Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
---
 block/blk-settings.c   |   13 +++++++++++++
 include/linux/blkdev.h |    2 ++
 2 files changed, 15 insertions(+)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 8d5df9d37239..24cf8fbbd125 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -259,6 +259,19 @@ void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
 }
 EXPORT_SYMBOL(blk_queue_max_write_zeroes_sectors);
 
+/**
+ * blk_queue_max_allocate_sectors - set max sectors for a single
+ *                                  allocate request
+ * @q:  the request queue for the device
+ * @max_allocate_sectors: maximum number of sectors to write per command
+ **/
+void blk_queue_max_allocate_sectors(struct request_queue *q,
+		unsigned int max_allocate_sectors)
+{
+	q->limits.max_allocate_sectors = max_allocate_sectors;
+}
+EXPORT_SYMBOL(blk_queue_max_allocate_sectors);
+
 /**
  * blk_queue_max_segments - set max hw segments for a request for this queue
  * @q:  the request queue for the device
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 40707f980a2e..f5edbfea7b84 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1088,6 +1088,8 @@ extern void blk_queue_max_write_same_sectors(struct request_queue *q,
 		unsigned int max_write_same_sectors);
 extern void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
 		unsigned int max_write_same_sectors);
+extern void blk_queue_max_allocate_sectors(struct request_queue *q,
+		unsigned int max_allocate_sectors);
 extern void blk_queue_logical_block_size(struct request_queue *, unsigned int);
 extern void blk_queue_physical_block_size(struct request_queue *, unsigned int);
 extern void blk_queue_alignment_offset(struct request_queue *q,



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

