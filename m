Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0614719FB70
	for <lists+dm-devel@lfdr.de>; Mon,  6 Apr 2020 19:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586194041;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5kUIw79ApT05l8C5a5vMatdOtkVk2oLvtXO6FzI1htM=;
	b=FdwjWlVBw/SLLXloDmllV933zvcFdTG4UIzo/1wSXHRLBdSLfmd8+fGoL8BpWgUcXL5QAH
	FOG9O5F2rtFdI/HpBkSzFLrJX6sr5JG8UNHRZaI5SY2BEzBE610bVgiEIRz6PjL9uJjMgH
	u9LxsMxVuBp6RUp/tQrPxn7VVHmJ9cY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-Rg_ruXWvP3KebGLlnssMgA-1; Mon, 06 Apr 2020 13:27:16 -0400
X-MC-Unique: Rg_ruXWvP3KebGLlnssMgA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D4C78017F4;
	Mon,  6 Apr 2020 17:27:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63F119D35B;
	Mon,  6 Apr 2020 17:27:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBE074E476;
	Mon,  6 Apr 2020 17:26:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 036HQjEZ032688 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 13:26:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2F8972166B29; Mon,  6 Apr 2020 17:26:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C0862166B2C
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 17:26:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 903298007A4
	for <dm-devel@redhat.com>; Mon,  6 Apr 2020 17:26:42 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-45-OClvJvoTPXaS29BHV7rj4Q-1;
	Mon, 06 Apr 2020 13:26:34 -0400
X-MC-Unique: OClvJvoTPXaS29BHV7rj4Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E7497B323;
	Mon,  6 Apr 2020 17:26:31 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon,  6 Apr 2020 16:34:55 +0200
Message-Id: <20200406143505.133271-2-hare@suse.de>
In-Reply-To: <20200406143505.133271-1-hare@suse.de>
References: <20200406143505.133271-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 036HQjEZ032688
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 01/11] dm-zoned: store zone id within the zone
	structure
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

Instead of calculating the zone index by the offset within the
zone array store the index within the structure itself.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 3 ++-
 drivers/md/dm-zoned.h          | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index c8787560fa9f..afce594067fb 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -189,7 +189,7 @@ struct dmz_metadata {
  */
 unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
-	return ((unsigned int)(zone - zmd->zones));
+	return zone->id;
 }
 
 sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone)
@@ -1119,6 +1119,7 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
 
 	INIT_LIST_HEAD(&zone->link);
 	atomic_set(&zone->refcount, 0);
+	zone->id = idx;
 	zone->chunk = DMZ_MAP_UNMAPPED;
 
 	switch (blkz->type) {
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 884c0e586082..39d59898abbe 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -87,6 +87,9 @@ struct dm_zone {
 	/* Zone activation reference count */
 	atomic_t		refcount;
 
+	/* Zone id */
+	unsigned int		id;
+
 	/* Zone write pointer block (relative to the zone start block) */
 	unsigned int		wp_block;
 
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

