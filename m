Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2EEED16A204
	for <lists+dm-devel@lfdr.de>; Mon, 24 Feb 2020 10:22:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582536134;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dwrKqxG64oc0SjSNuILVcdsco9ftej3tOtrPjLtIg/A=;
	b=ge7wIZ0FBxzi7GRqvqUNHkA6NV1Jxf08MDkn1Sa58bS7Jp7ENVe1OQcCOIWivD7XuYpxdV
	4ec6qOpo+SWsWj+k6jIMSFXY12D2XRDygNkVONVA385pQoEMX620UdvgAaRvp8VL4TQTKb
	vthxk6Bzu/OV0GiDu+bUhfFH5W4Ppkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-2-IIi2toMUKPRpvXh9XAPg-1; Mon, 24 Feb 2020 04:21:21 -0500
X-MC-Unique: 2-IIi2toMUKPRpvXh9XAPg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44346800D53;
	Mon, 24 Feb 2020 09:21:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFC9E85F13;
	Mon, 24 Feb 2020 09:21:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77BFC182B00E;
	Mon, 24 Feb 2020 09:21:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01O9KqHa001969 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 04:20:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7F9815DA85; Mon, 24 Feb 2020 09:20:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (ovpn-205-115.brq.redhat.com
	[10.40.205.115])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 349855D9CD;
	Mon, 24 Feb 2020 09:20:52 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1j69uz-0001WK-N2; Mon, 24 Feb 2020 10:20:50 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 24 Feb 2020 10:20:49 +0100
Message-Id: <20200224092049.435351600@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 24 Feb 2020 10:20:30 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, 
	Nikhil Kshirsagar <nkshirsa@redhat.com>,
	Alasdair Kergon <agk@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 3/7] dm writecache: verify watermark on resume
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
Content-Disposition: inline;
	filename=dm-writecache-verify-watermark-after-resume.patch

Verify the watermark after resume - so that if the target is reloaded with
lower watermark, it will start the cleanup process immediatelly.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	#av4.18+
Fixes: 48debafe4f2f ("dm: add writecache target")

---
 drivers/md/dm-writecache.c |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2020-02-21 13:23:13.000000000 +0100
+++ linux-2.6/drivers/md/dm-writecache.c	2020-02-21 13:23:13.000000000 +0100
@@ -625,6 +625,12 @@ static void writecache_add_to_freelist(s
 	wc->freelist_size++;
 }
 
+static inline void writecache_verify_watermark(struct dm_writecache *wc)
+{
+	if (unlikely(wc->freelist_size + wc->writeback_size <= wc->freelist_high_watermark))
+		queue_work(wc->writeback_wq, &wc->writeback_work);
+}
+
 static struct wc_entry *writecache_pop_from_freelist(struct dm_writecache *wc, sector_t expected_sector)
 {
 	struct wc_entry *e;
@@ -650,8 +656,8 @@ static struct wc_entry *writecache_pop_f
 		list_del(&e->lru);
 	}
 	wc->freelist_size--;
-	if (unlikely(wc->freelist_size + wc->writeback_size <= wc->freelist_high_watermark))
-		queue_work(wc->writeback_wq, &wc->writeback_work);
+
+	writecache_verify_watermark(wc);
 
 	return e;
 }
@@ -965,6 +971,8 @@ erase_this:
 		writecache_commit_flushed(wc, false);
 	}
 
+	writecache_verify_watermark(wc);
+
 	wc_unlock(wc);
 }
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

