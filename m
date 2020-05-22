Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 814241DE285
	for <lists+dm-devel@lfdr.de>; Fri, 22 May 2020 10:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590137978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=thCY1ZlUSNi29fymr7GAj7pg5dG56qxyi7lcOZ/11EU=;
	b=TU9Dsfnb4ar4uz8tW3vuHhJwQQTMVpQiwaBTGZnwneeWvAjyxmdaPveVV4r763KzXvNFo9
	ItsjbXXqNnevebm2kL//x83bBCF0QKINWCjHlMGT99RKk7lEX8zDrELanxBKQnEPvy7YH+
	fqMKCWBXxifzjvq6x/ZoDyF4GHd2AdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-10mwYK39OVCtb2h90hGO0g-1; Fri, 22 May 2020 04:59:36 -0400
X-MC-Unique: 10mwYK39OVCtb2h90hGO0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB755A0C00;
	Fri, 22 May 2020 08:59:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FDE55C1D0;
	Fri, 22 May 2020 08:59:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3558554D0B;
	Fri, 22 May 2020 08:59:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04M8x6L0016405 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 04:59:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ADD5A2156A3B; Fri, 22 May 2020 08:59:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BBAF2157F23
	for <dm-devel@redhat.com>; Fri, 22 May 2020 08:59:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 629D68007A4
	for <dm-devel@redhat.com>; Fri, 22 May 2020 08:59:01 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-406-Fiy0JAvhMZKkZ1eCrtwH-w-1;
	Fri, 22 May 2020 04:58:58 -0400
X-MC-Unique: Fiy0JAvhMZKkZ1eCrtwH-w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 87EAAB1D9E;
	Fri, 22 May 2020 08:58:59 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 22 May 2020 10:58:53 +0200
Message-Id: <20200522085853.123291-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCHv2] dm-zoned: remove leftover hunk for switching
	to sequential zones
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

Remove a leftover hunk to switch from random zones to sequential
zones when selecting a reclaim zone; the logic has moved into the
caller and this hunk is now pointless.

Fixes: 34f5affd04c4 ("dm zoned: separate random and cache zones")
Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index db0dc2b5d44d..4a2e351365c5 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -2111,14 +2111,6 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
 		 */
 		if (!(flags & DMZ_ALLOC_RECLAIM))
 			return NULL;
-		/*
-		 * Use sequential write zones if we started off with random
-		 * zones and the list is empty
-		 */
-		if (list == &zmd->unmap_rnd_list) {
-			list = &zmd->unmap_seq_list;
-			goto again;
-		}
 		/*
 		 * Fallback to the reserved sequential zones
 		 */
-- 
2.25.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

