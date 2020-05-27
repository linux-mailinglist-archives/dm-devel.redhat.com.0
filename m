Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3D51E3906
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 08:23:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590560596;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m78NjrOrONiAdmmjklVRVTjmS0i/NHbHnI7sgS8xl6Y=;
	b=BzGyvvZbqWH5ceVid3Gtl+EbIL1mRmrHUU/Hw4lPGOLN2XyQUqoIRifShg+HCaonJ/jbBu
	xvDGrdVvzurvHVSUKsosgD/CDAxgd/19VZimchZJl9XIx14npEo+1YSlf0CBMh1PzcSs7l
	Fk7hml2Mkw4BbhC5Hpg8YR3xTG5sJX8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-ymtxj-R4Pd-WZkzhHFW9jg-1; Wed, 27 May 2020 02:23:14 -0400
X-MC-Unique: ymtxj-R4Pd-WZkzhHFW9jg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C994AEC1A5;
	Wed, 27 May 2020 06:23:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A46416EF8C;
	Wed, 27 May 2020 06:23:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D9F51806B0C;
	Wed, 27 May 2020 06:23:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R6Muui015824 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 02:22:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C10682016F32; Wed, 27 May 2020 06:22:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6B702029F62
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBB4F833B45
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:52 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-471-UaErR_KKMqCyuSCEuk7tUQ-1;
	Wed, 27 May 2020 02:22:44 -0400
X-MC-Unique: UaErR_KKMqCyuSCEuk7tUQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id C110FB308;
	Wed, 27 May 2020 06:22:43 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Wed, 27 May 2020 08:22:25 +0200
Message-Id: <20200527062225.72849-16-hare@suse.de>
In-Reply-To: <20200527062225.72849-1-hare@suse.de>
References: <20200527062225.72849-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 15/15] dm-zoned: prefer full zones for reclaim
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Prefer full zones when selecting the next zone for reclaim.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index b89b3d3b9ec9..f161ef4e3d3d 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1936,7 +1936,7 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
 						    unsigned int idx, bool idle)
 {
 	struct dm_zone *dzone = NULL;
-	struct dm_zone *zone;
+	struct dm_zone *zone, *last = NULL;
 	struct list_head *zone_list;
 
 	/* If we have cache zones select from the cache zone list */
@@ -1953,6 +1953,13 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
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

