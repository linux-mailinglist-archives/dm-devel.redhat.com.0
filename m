Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 768391E8537
	for <lists+dm-devel@lfdr.de>; Fri, 29 May 2020 19:40:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590774001;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nFjrah1WNkUtrPcAqRRHSmQup3oGa7PS6QDLlUqabQg=;
	b=WEc+vxEPkIN6XLg4mtYUlbiz7YexHY4YkDwVqKnm47cTBsMhyuxcxlXewU9AwEy9FlPWYA
	OLHKWAChd/lFfhiTibsd9h0ZkZifyXRSvy0GpPfxcQZ5UxibQxLI+t562UtdQWMMxFXxyz
	aQG7NbIoc1TT/21omcHb51J8P4XxQKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-OwXaFyQXMl-Z1kJwlwIx_A-1; Fri, 29 May 2020 13:39:59 -0400
X-MC-Unique: OwXaFyQXMl-Z1kJwlwIx_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E282581E22B;
	Fri, 29 May 2020 17:39:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C107A6298C;
	Fri, 29 May 2020 17:39:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7760D7CCCD;
	Fri, 29 May 2020 17:39:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04THdP4U004844 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 29 May 2020 13:39:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 99D6D2029F62; Fri, 29 May 2020 17:39:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 534102029F71
	for <dm-devel@redhat.com>; Fri, 29 May 2020 17:39:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 413D282884B
	for <dm-devel@redhat.com>; Fri, 29 May 2020 17:39:21 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-398-BKw8bjnMNp689u7u-7VGuA-1;
	Fri, 29 May 2020 13:39:17 -0400
X-MC-Unique: BKw8bjnMNp689u7u-7VGuA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 7ACA1B140;
	Fri, 29 May 2020 17:39:15 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 29 May 2020 19:38:55 +0200
Message-Id: <20200529173907.40529-3-hare@suse.de>
In-Reply-To: <20200529173907.40529-1-hare@suse.de>
References: <20200529173907.40529-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 02/14] dm-zoned: secondary superblock must reside
	on the same devices than primary superblock
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

The secondary superblock must reside on the same device than the
primary superblock, so there's no need to re-calculate the device.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index ef1524d5928a..043ed882970a 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1135,7 +1135,7 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
 	/* Bad first super block: search for the second one */
 	zmd->sb[1].block = zmd->sb[0].block + zone_nr_blocks;
 	zmd->sb[1].zone = zmd->sb[0].zone + 1;
-	zmd->sb[1].dev = dmz_zone_to_dev(zmd, zmd->sb[1].zone);
+	zmd->sb[1].dev = zmd->sb[0].dev;
 	for (i = 0; i < zmd->nr_rnd_zones - 1; i++) {
 		if (dmz_read_sb(zmd, 1) != 0)
 			break;
@@ -1144,7 +1144,6 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
 			return 0;
 		}
 		zmd->sb[1].block += zone_nr_blocks;
-		zmd->sb[1].dev = dmz_zone_to_dev(zmd, zmd->sb[1].zone + i);
 	}
 
 	dmz_free_mblock(zmd, mblk);
@@ -1263,7 +1262,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 		if (!zmd->sb[1].zone)
 			zmd->sb[1].zone = zmd->sb[0].zone + zmd->nr_meta_zones;
 		zmd->sb[1].block = dmz_start_block(zmd, zmd->sb[1].zone);
-		zmd->sb[1].dev = dmz_zone_to_dev(zmd, zmd->sb[1].zone);
+		zmd->sb[1].dev = zmd->sb[0].dev;
 		ret = dmz_get_sb(zmd, 1);
 	} else
 		ret = dmz_lookup_secondary_sb(zmd);
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

