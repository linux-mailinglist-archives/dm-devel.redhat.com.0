Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8B21B023E
	for <lists+dm-devel@lfdr.de>; Mon, 20 Apr 2020 09:07:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587366449;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EvzvcKcbiEN1d/mwvpwbFkTOKTrN+qrPZKHRsjjALZ8=;
	b=P9WVTPS/8ToLivRIyQpnAjSVK3jvenWH/qih+4L31fJ9dmmeaBY/b8VydLDuhwV/yO0rR9
	XbaVVRkJfvTgCwkFwxEvYZ/p5nCZc/I2TFx6Xj5vv11u8L1BnQS22ulxkyjp7rcHmva0co
	apo34SNOano5t+1qb4XpaOCzmNcy0GY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-0uXHnxBtN7a-Molb7Po2eA-1; Mon, 20 Apr 2020 03:07:27 -0400
X-MC-Unique: 0uXHnxBtN7a-Molb7Po2eA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D831D107ACCD;
	Mon, 20 Apr 2020 07:07:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1729129F8C;
	Mon, 20 Apr 2020 07:07:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FEFD18089CE;
	Mon, 20 Apr 2020 07:07:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03J7jW03003026 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 19 Apr 2020 03:45:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F2DD12166B28; Sun, 19 Apr 2020 07:45:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF15A2166B27
	for <dm-devel@redhat.com>; Sun, 19 Apr 2020 07:45:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8D08101A55A
	for <dm-devel@redhat.com>; Sun, 19 Apr 2020 07:45:29 +0000 (UTC)
Received: from master.debian.org (master.debian.org [82.195.75.110]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-197-gx7EzL2QM6-QCoxr54ZvUQ-1; Sun, 19 Apr 2020 03:45:24 -0400
X-MC-Unique: gx7EzL2QM6-QCoxr54ZvUQ-1
Received: from pabs by master.debian.org with local (Exim 4.92)
	(envelope-from <pabs@master.debian.org>)
	id 1jQ4QD-00040m-1R; Sun, 19 Apr 2020 07:31:21 +0000
From: Paul Wise <pabs3@bonedaddy.net>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org
Date: Sun, 19 Apr 2020 15:30:26 +0800
Message-Id: <20200419073026.197967-4-pabs3@bonedaddy.net>
In-Reply-To: <20200419073026.197967-1-pabs3@bonedaddy.net>
References: <20200419073026.197967-1-pabs3@bonedaddy.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03J7jW03003026
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 20 Apr 2020 03:06:56 -0400
Cc: Paul Wise <pabs3@bonedaddy.net>
Subject: [dm-devel] [PATCH 3/3] dm raid/raid1: enable discard support when
	any devices support discard
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

This will allow fstrim to work on filesystems on dm RAID arrays with
both HDDs and SSDs or dm raid SSD arrays with varying discard support,
which should increase the lifetime of the SSDs that support discard.

This makes dm raid and dm raid1 (mirroring) consistent with md raid,
which supports discard when only some of the devices support discard.

The existing code prevents this from being enabled with RAID 4/5/6,
which require more certainty about the behaviour of underlying devices
after a discard has been issued and processed.

Simply enable discard and return from the configure_discard_support
function when any of the underlying devices has support for discards,
since there are now no other checks in the device check loop.

Mixed discard support for md RAID types was added in these commits:

commit c83057a1f4f9 ("md: raid 0 supports TRIM")
commit 2ff8cc2c6d4e ("md: raid 1 supports TRIM")
commit 532a2a3fba8d ("md: raid 10 supports TRIM")
commit f1cad2b68ed1 ("md: linear supports TRIM")

Signed-off-by: Paul Wise <pabs3@bonedaddy.net>
---
 drivers/md/dm-raid.c  | 8 ++++++--
 drivers/md/dm-raid1.c | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 0f95e50e62a8..63f5d05021a9 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -2962,11 +2962,15 @@ static void configure_discard_support(struct raid_set *rs)
 			continue;
 
 		q = bdev_get_queue(rs->dev[i].rdev.bdev);
-		if (!q || !blk_queue_discard(q))
+		if (q && blk_queue_discard(q)) {
+			ti->discard_support = DM_DISCARD_ANY_DEVS;
+			ti->num_discard_bios = 1;
 			return;
+		}
 	}
 
-	ti->num_discard_bios = 1;
+	ti->discard_support = DM_DISCARD_ALL_DEVS;
+	ti->num_discard_bios = 0;
 }
 
 /*
diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
index 089aed57e083..2bfed681dd3f 100644
--- a/drivers/md/dm-raid1.c
+++ b/drivers/md/dm-raid1.c
@@ -1114,6 +1114,7 @@ static int mirror_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		goto err_free_context;
 
 	ti->num_flush_bios = 1;
+	ti->discard_support = DM_DISCARD_ANY_DEVS;
 	ti->num_discard_bios = 1;
 	ti->per_io_data_size = sizeof(struct dm_raid1_bio_record);
 
-- 
2.26.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

