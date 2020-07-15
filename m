Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 71AD12206E8
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 10:18:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-RaLNWws0Nomp9STFtjVXRg-1; Wed, 15 Jul 2020 04:18:37 -0400
X-MC-Unique: RaLNWws0Nomp9STFtjVXRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D29C19057BD;
	Wed, 15 Jul 2020 08:18:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6121A78A55;
	Wed, 15 Jul 2020 08:18:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E713296226;
	Wed, 15 Jul 2020 08:18:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06F8I4Ta029858 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 04:18:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E2D9120A8C46; Wed, 15 Jul 2020 08:18:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE3952026D5D
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 08:18:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D0EE833B7E
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 08:18:01 +0000 (UTC)
Received: from mx2.suse.de (195.135.220.15 [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-375-rfoEsqg_P_aW5UqyZxbKCA-1;
	Wed, 15 Jul 2020 04:17:58 -0400
X-MC-Unique: rfoEsqg_P_aW5UqyZxbKCA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2B4CDAEAA;
	Wed, 15 Jul 2020 08:18:00 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Wed, 15 Jul 2020 10:17:52 +0200
Message-Id: <20200715081752.28130-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm zoned: update atime for new buffer zones
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When a new buffer zone is allocated in dmz_handle_buffered_write()
we should update the 'atime' to inform reclaim that this zone has
been accessed.
Otherwise we end up with the pathological case where the first write
allocates a new buffer zone, but the next write will start reclaim
before processing the bio. As the atime is not set reclaim declares
the system idle and reclaims the zone. Then the write will be processed
and re-allocate the very same zone again; this repeats for every
consecutive write, making for a _very_ slow mkfs.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-target.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index cf915009c306..b32d37bef14f 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -297,6 +297,9 @@ static int dmz_handle_buffered_write(struct dmz_target *dmz,
 	if (dmz_is_readonly(bzone))
 		return -EROFS;
 
+	/* Tell reclaim we're doing some work here */
+	dmz_reclaim_bio_acc(bzone->dev->reclaim);
+
 	/* Submit write */
 	ret = dmz_submit_bio(dmz, bzone, bio, chunk_block, nr_blocks);
 	if (ret)
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

