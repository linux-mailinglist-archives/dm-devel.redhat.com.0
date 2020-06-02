Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B6DC21EBA14
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 13:10:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591096238;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8W8eZhy/TPqNv4W24CMgHsHKfIeHSXdMy9E38HiAw+Y=;
	b=i2EaYyi7C34cGoeo+1kI+eTitpaJzhwb6wvJi+JIUtLHlqmJWiu7vrumHveDUVjlyv1jhR
	QvQbJqdzQdOtqM7UUBV5q9IwvxxAz+D1JWdjFZz4HPQ7crpucOI8NXl7uBwnTd3IxmenZJ
	X/mXBcV1UYI3GWNF+60gDgR0+cxXENQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-Sm_69SLbOH2NPR71yBadxQ-1; Tue, 02 Jun 2020 07:10:36 -0400
X-MC-Unique: Sm_69SLbOH2NPR71yBadxQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E7A58018A6;
	Tue,  2 Jun 2020 11:10:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECAB95C240;
	Tue,  2 Jun 2020 11:10:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF7921809543;
	Tue,  2 Jun 2020 11:10:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052BAB7D027421 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 07:10:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E5838C6128; Tue,  2 Jun 2020 11:10:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E12CBC6132
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E18A1859163
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:08 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-505-mnbjleQDO1CSugcuQwWB5g-1;
	Tue, 02 Jun 2020 07:10:04 -0400
X-MC-Unique: mnbjleQDO1CSugcuQwWB5g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id EAF7DAD5D;
	Tue,  2 Jun 2020 11:10:04 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue,  2 Jun 2020 13:09:44 +0200
Message-Id: <20200602110956.121170-4-hare@suse.de>
In-Reply-To: <20200602110956.121170-1-hare@suse.de>
References: <20200602110956.121170-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

