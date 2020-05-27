Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A4AEE1E38FF
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 08:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590560588;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8W8eZhy/TPqNv4W24CMgHsHKfIeHSXdMy9E38HiAw+Y=;
	b=Tat/96jl8PPJvUbnQjbQLalFus7k4HSWxPz8PhHV7KxZ4PX425CEsokhbxgbf20sDeZlBu
	DsA3uyVY9eSduQO+2xHG6E/YACQ8FHqPDxUA5Q5T3oJEFvhXc6itCCgPXbg9IJMuHJD/2O
	mTIFXEInxYpq1fPKKZHjH0UgukE0SYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-42X3ACKQOPWfQzIWi77oRg-1; Wed, 27 May 2020 02:23:05 -0400
X-MC-Unique: 42X3ACKQOPWfQzIWi77oRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5C8A107ACF6;
	Wed, 27 May 2020 06:22:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0A1B10016E8;
	Wed, 27 May 2020 06:22:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4AE6B6B49A;
	Wed, 27 May 2020 06:22:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04R6Ml3o015699 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 02:22:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A5DD32157F26; Wed, 27 May 2020 06:22:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A25152157F24
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D52B833B45
	for <dm-devel@redhat.com>; Wed, 27 May 2020 06:22:47 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-176-VyPEjtCzN62VtFbOk5DtvA-1;
	Wed, 27 May 2020 02:22:42 -0400
X-MC-Unique: VyPEjtCzN62VtFbOk5DtvA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 4272CB29C;
	Wed, 27 May 2020 06:22:43 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Wed, 27 May 2020 08:22:13 +0200
Message-Id: <20200527062225.72849-4-hare@suse.de>
In-Reply-To: <20200527062225.72849-1-hare@suse.de>
References: <20200527062225.72849-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 03/15] dm-zoned: improve logging messages for
	reclaim
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of just reporting the errno this patch adds some more
verbose debugging message in the reclaim path.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-reclaim.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 571bc1d41bab..fd4d47dfcea1 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -371,8 +371,11 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 
 	/* Get a data zone */
 	dzone = dmz_get_zone_for_reclaim(zmd, dmz_target_idle(zrc));
-	if (!dzone)
+	if (!dzone) {
+		DMDEBUG("(%s): No zone found to reclaim",
+			dmz_metadata_label(zmd));
 		return -EBUSY;
+	}
 
 	start = jiffies;
 	if (dmz_is_cache(dzone) || dmz_is_rnd(dzone)) {
@@ -416,6 +419,12 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 	}
 out:
 	if (ret) {
+		if (ret == -EINTR)
+			DMDEBUG("(%s): reclaim zone %u interrupted",
+				dmz_metadata_label(zmd), rzone->id);
+		else
+			DMDEBUG("(%s): Failed to reclaim zone %u, err %d",
+				dmz_metadata_label(zmd), rzone->id, ret);
 		dmz_unlock_zone_reclaim(dzone);
 		return ret;
 	}
@@ -519,8 +528,6 @@ static void dmz_reclaim_work(struct work_struct *work)
 
 	ret = dmz_do_reclaim(zrc);
 	if (ret && ret != -EINTR) {
-		DMDEBUG("(%s): Reclaim error %d",
-			dmz_metadata_label(zmd), ret);
 		if (!dmz_check_dev(zmd))
 			return;
 	}
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

