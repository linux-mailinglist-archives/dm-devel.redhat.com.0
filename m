Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE441D91DD
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 10:15:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589876118;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3Ei0blfT4RafLPL2xNJZaqWARhijCXkn2tIe6yLeVHo=;
	b=XtwJFc4tK5upOeLW7amsr7yT3LsFAwLIQDnUOCo9A2b8NxWwtTtzLtFj56qt0+3aTiZl++
	fZWpD1Az5jO4GdI2T0ouTDIciiJsVd31d1reA67EWmcItC76UWvb4kZSzCbVNpbeIZfQoF
	vWP+v7dHanzMaHLO34OOtxRwu5Zgaik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-Bs8WXvvkPwujwT0WdEGR3Q-1; Tue, 19 May 2020 04:15:16 -0400
X-MC-Unique: Bs8WXvvkPwujwT0WdEGR3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8EDD107ACF4;
	Tue, 19 May 2020 08:15:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D25A21CA;
	Tue, 19 May 2020 08:15:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71A5E4ED3C;
	Tue, 19 May 2020 08:14:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04J8Eons030965 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 04:14:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 100B942ACB; Tue, 19 May 2020 08:14:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C1CA5AB72
	for <dm-devel@redhat.com>; Tue, 19 May 2020 08:14:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED24C8A5E91
	for <dm-devel@redhat.com>; Tue, 19 May 2020 08:14:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-487-NL4skRJiN0GReOrItF1vYw-1;
	Tue, 19 May 2020 04:14:44 -0400
X-MC-Unique: NL4skRJiN0GReOrItF1vYw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id EDE74AFE6;
	Tue, 19 May 2020 08:14:43 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue, 19 May 2020 10:14:24 +0200
Message-Id: <20200519081424.103318-7-hare@suse.de>
In-Reply-To: <20200519081424.103318-1-hare@suse.de>
References: <20200519081424.103318-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 6/6] dm-zoned: remove unused variable in
	dmz_do_reclaim()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

'dev' is unused, and can be removed.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-reclaim.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 3ed88581dc48..571bc1d41bab 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -366,7 +366,6 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 	struct dmz_metadata *zmd = zrc->metadata;
 	struct dm_zone *dzone;
 	struct dm_zone *rzone;
-	struct dmz_dev *dev;
 	unsigned long start;
 	int ret;
 
@@ -376,7 +375,6 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 		return -EBUSY;
 
 	start = jiffies;
-	dev = dmz_zone_to_dev(zmd, dzone);
 	if (dmz_is_cache(dzone) || dmz_is_rnd(dzone)) {
 		if (!dmz_weight(dzone)) {
 			/* Empty zone */
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

