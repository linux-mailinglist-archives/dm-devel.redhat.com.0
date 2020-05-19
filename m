Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0361D91E2
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 10:15:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589876122;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NSVjUFnp6FBK3Uhd4u27O1m80ei9BPuQS3HuNRMyui8=;
	b=PYrZEp7z6ncGumXu6/HnvfjHxB95iaR6XQDWli+CZyYOyX5alsgCIYocSHWJnNRLgF5s04
	lHnma4nJdzW3MIUC73bt1pa0uHNGm+bepvAIvI0ekh4/PaU90dmL8+QQCYrJzt4GmHm5jZ
	MVu6tSU6ul9C8TFnSvuyu/oZK6oH/9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-UbfJpG82OyiKt01J4b-OFA-1; Tue, 19 May 2020 04:15:19 -0400
X-MC-Unique: UbfJpG82OyiKt01J4b-OFA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04F421937FE3;
	Tue, 19 May 2020 08:15:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDCD310013D9;
	Tue, 19 May 2020 08:15:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 815AA1809543;
	Tue, 19 May 2020 08:15:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04J8ElO6030922 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 04:14:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A138710F2709; Tue, 19 May 2020 08:14:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BD0810F270C
	for <dm-devel@redhat.com>; Tue, 19 May 2020 08:14:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99A47101A525
	for <dm-devel@redhat.com>; Tue, 19 May 2020 08:14:46 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-249-HJLITzAtOhur4xAt5qhmSA-1;
	Tue, 19 May 2020 04:14:42 -0400
X-MC-Unique: HJLITzAtOhur4xAt5qhmSA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 91251AFC8;
	Tue, 19 May 2020 08:14:43 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue, 19 May 2020 10:14:22 +0200
Message-Id: <20200519081424.103318-5-hare@suse.de>
In-Reply-To: <20200519081424.103318-1-hare@suse.de>
References: <20200519081424.103318-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 4/6] dm-zoned: start reclaim with sequential zones
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

Sequential zones perform better for reclaim, so start off using
them and only use random zones as a fallback when cache zones are
present.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-reclaim.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 1855c056d6a4..1283405bec29 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -281,15 +281,16 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 	struct dm_zone *szone = NULL;
 	struct dmz_metadata *zmd = zrc->metadata;
 	int ret;
-	int alloc_flags = dmz_nr_cache_zones(zmd) ?
-		DMZ_ALLOC_RND : DMZ_ALLOC_SEQ;
+	int alloc_flags = DMZ_ALLOC_SEQ;
 
-	/* Always use sequential zones to reclaim random zones */
-	if (dmz_is_rnd(dzone))
-		alloc_flags = DMZ_ALLOC_SEQ;
 	/* Get a free random or sequential zone */
 	dmz_lock_map(zmd);
+again:
 	szone = dmz_alloc_zone(zmd, alloc_flags | DMZ_ALLOC_RECLAIM);
+	if (!szone && alloc_flags == DMZ_ALLOC_SEQ && dmz_nr_cache_zones(zmd)) {
+		alloc_flags = DMZ_ALLOC_RND;
+		goto again;
+	}
 	dmz_unlock_map(zmd);
 	if (!szone)
 		return -ENOSPC;
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

