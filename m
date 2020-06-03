Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1851A1F03B9
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402450;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xiNWgrIkbJxPFeCaXDs2kZfr677i90ITlZgyzzuRTyk=;
	b=M+8ydOXsWjfyvfk6mwiOBDAd50/ReUx0gl6mipWR/6RzNH2hO06fxNCdRIJ6ygPYUIQumr
	j6kdujN2mFWjXM9X/9ruOYFlHUoMljhqnhmadoAVQJeSThB143+uamsScbbqwUa7rjjkKH
	UP8Fh5ubv+UJ7uGDefhwPO0DfjqLKsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-73bxsfL6Oh-AQzF4PzrjfQ-1; Fri, 05 Jun 2020 20:14:08 -0400
X-MC-Unique: 73bxsfL6Oh-AQzF4PzrjfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7660A1883604;
	Sat,  6 Jun 2020 00:14:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2C9F5FC01;
	Sat,  6 Jun 2020 00:14:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1C78B3493;
	Sat,  6 Jun 2020 00:13:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 053G3Fq6001083 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Jun 2020 12:03:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 699F42156A59; Wed,  3 Jun 2020 16:03:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42A2D2156A3A
	for <dm-devel@redhat.com>; Wed,  3 Jun 2020 16:03:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9018618A6660
	for <dm-devel@redhat.com>; Wed,  3 Jun 2020 16:03:10 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-144-DRruJ4MpPv2NFMPy6WkCbQ-1; Wed, 03 Jun 2020 12:02:56 -0400
X-MC-Unique: DRruJ4MpPv2NFMPy6WkCbQ-1
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
	by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <colin.king@canonical.com>)
	id 1jgVqw-0006Bm-JU; Wed, 03 Jun 2020 16:02:54 +0000
From: Colin King <colin.king@canonical.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	Hannes Reinecke <hare@suse.de>
Date: Wed,  3 Jun 2020 17:02:54 +0100
Message-Id: <20200603160254.142222-1-colin.king@canonical.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 05 Jun 2020 09:30:21 -0400
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH][next] dm zoned: fix memory leak of newly
	allocated zone on xa_insert failure
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Colin Ian King <colin.king@canonical.com>

Currently if an xa_insert fails then there is a memory lead of the
recently allocated zone object. Fix this by kfree'ing zone before
returning on the error return path.

Addresses-Coverity: ("Resource leak")
Fixes: 1a311efa3916 ("dm zoned: convert to xarray")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/md/dm-zoned-metadata.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index b23ff090c056..130b5a6d9f12 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -313,8 +313,10 @@ static struct dm_zone *dmz_insert(struct dmz_metadata *zmd,
 	if (!zone)
 		return ERR_PTR(-ENOMEM);
 
-	if (xa_insert(&zmd->zones, zone_id, zone, GFP_KERNEL))
+	if (xa_insert(&zmd->zones, zone_id, zone, GFP_KERNEL)) {
+		kfree(zone);
 		return ERR_PTR(-EBUSY);
+	}
 
 	INIT_LIST_HEAD(&zone->link);
 	atomic_set(&zone->refcount, 0);
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

