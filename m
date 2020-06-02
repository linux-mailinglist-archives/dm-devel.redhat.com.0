Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CCB261EBA1B
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 13:10:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591096246;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yk87YhiFKpVGrgdQLJDIU4Q9P5Y2h/MxSYTngogbry0=;
	b=cAuH5phSgfKmj6aLogFYloxnWr72YMhx6PZDtiJ8YXp5YUFPIzHbUTet16QnXK77GkVwwQ
	iZtR3OEQGCIS6oaKq1LBSyJAq6KMBmVG4ADhm/jpuril8fkQbdUd6MevgKpUKWwI5djH7O
	2ZdR3V4z91MZBtPlFwEycZEfO3kWhJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-mfV2cHHrM0Oso55MipAYUw-1; Tue, 02 Jun 2020 07:10:42 -0400
X-MC-Unique: mfV2cHHrM0Oso55MipAYUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D735281CBE3;
	Tue,  2 Jun 2020 11:10:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B521061988;
	Tue,  2 Jun 2020 11:10:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77E72941D5;
	Tue,  2 Jun 2020 11:10:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052BAAOl027418 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 07:10:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF4D72157F23; Tue,  2 Jun 2020 11:10:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB8822166B28
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6994101A526
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:10 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-359-74G09UqoO8KkCpVjC1O2yQ-1;
	Tue, 02 Jun 2020 07:10:06 -0400
X-MC-Unique: 74G09UqoO8KkCpVjC1O2yQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 6DE3FAED8;
	Tue,  2 Jun 2020 11:10:05 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue,  2 Jun 2020 13:09:55 +0200
Message-Id: <20200602110956.121170-15-hare@suse.de>
In-Reply-To: <20200602110956.121170-1-hare@suse.de>
References: <20200602110956.121170-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 14/15] dm-zoned: prefer full zones for reclaim
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Prefer full zones when selecting the next zone for reclaim.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 6c8d4ddd8b27..e01ca1c57ff2 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1939,7 +1939,7 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
 						    unsigned int idx, bool idle)
 {
 	struct dm_zone *dzone = NULL;
-	struct dm_zone *zone;
+	struct dm_zone *zone, *last = NULL;
 	struct list_head *zone_list;
 
 	/* If we have cache zones select from the cache zone list */
@@ -1956,6 +1956,13 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
 			dzone = zone->bzone;
 			if (dzone->dev->dev_idx != idx)
 				continue;
+			if (!last) {
+				last = dzone;
+				continue;
+			}
+			if (last->weight < dzone->weight)
+				continue;
+			dzone = last;
 		} else
 			dzone = zone;
 		if (dmz_lock_zone_reclaim(dzone))
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

