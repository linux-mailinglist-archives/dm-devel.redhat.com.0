Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BCD8A1D098C
	for <lists+dm-devel@lfdr.de>; Wed, 13 May 2020 09:08:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589353707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Tv8XYPeRyzOKlz3OrdkLJcV2yscukfoQF/ySdAZ6cGs=;
	b=e3HYih+VK6T2r3lpRBukUzZyjnQAVlbGSW3m8LthtPY3ljBUbcvmMcmEGUBidTUn4tXzu5
	4H43I73mEiz7zMXWPlYf9IIvZ1OAt0sN6wO9EgPvxmLXENOS3pbdyEyIwyl6u1bT5WowH2
	2oEPHK3qybXVikqzL+CR2KMgPjyEcjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-lZZIw_RONLSCsprR2Q4KRA-1; Wed, 13 May 2020 03:08:25 -0400
X-MC-Unique: lZZIw_RONLSCsprR2Q4KRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D83B801504;
	Wed, 13 May 2020 07:08:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08A776E6F9;
	Wed, 13 May 2020 07:08:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D01894CAA0;
	Wed, 13 May 2020 07:08:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D77exL025849 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 03:07:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8D5122166BA3; Wed, 13 May 2020 07:07:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8922B2166BA0
	for <dm-devel@redhat.com>; Wed, 13 May 2020 07:07:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8E8C811E77
	for <dm-devel@redhat.com>; Wed, 13 May 2020 07:07:37 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-346-GfwDmwLHM8isyiDfLBjyFA-1;
	Wed, 13 May 2020 03:07:35 -0400
X-MC-Unique: GfwDmwLHM8isyiDfLBjyFA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 42612B080;
	Wed, 13 May 2020 07:07:36 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Wed, 13 May 2020 09:07:28 +0200
Message-Id: <20200513070729.71461-2-hare@suse.de>
In-Reply-To: <20200513070729.71461-1-hare@suse.de>
References: <20200513070729.71461-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 1/2] dm-zoned: invert zone check in
	dmz_reset_zone()
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

Instead of excluding invalid zones we should check if the zone
is sequential and exclude invalid states. That way we don't need
to touch the selection when new zone states or flags are added.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index d9e256762eff..9b93d7ff1dfc 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1570,12 +1570,16 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 	int ret;
 
 	/*
-	 * Ignore offline zones, read only zones,
-	 * and conventional zones.
+	 * Only check sequential zones.
+	 */
+	if (!dmz_is_seq(zone))
+		return 0;
+
+	/*
+	 * But ignore offline and read only zones.
 	 */
 	if (dmz_is_offline(zone) ||
-	    dmz_is_readonly(zone) ||
-	    dmz_is_rnd(zone))
+	    dmz_is_readonly(zone))
 		return 0;
 
 	if (!dmz_is_empty(zone) || dmz_seq_write_err(zone)) {
-- 
2.25.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

