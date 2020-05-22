Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDE81DEC37
	for <lists+dm-devel@lfdr.de>; Fri, 22 May 2020 17:40:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590162007;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kgfyJHNuHrVEiTAtg3LSy/Znw+PC8//HDOFjJLEaI4A=;
	b=XUhVvLiYgQ+blxSUr47Hx/n9nGZPPLkCIeiJUynaaK1H7U0i0r6555OqJ6GDOoUtUruhCJ
	W8VwynclDGa4+LBLFQeEv8uQ6lZFENydff18ViTwdPtbm6wBd0C50nq3YW6iBfP9sXPcBV
	IXhQaoLV5ebTK37d+1q5Ug27z7wuH7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-wtxyjRusPbavYTnPoiFDyA-1; Fri, 22 May 2020 11:40:02 -0400
X-MC-Unique: wtxyjRusPbavYTnPoiFDyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15D848C9C72;
	Fri, 22 May 2020 15:39:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E609A75279;
	Fri, 22 May 2020 15:39:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E96154D09;
	Fri, 22 May 2020 15:39:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04MFdIXI012622 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 11:39:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8DCF2166BA0; Fri, 22 May 2020 15:39:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4A9A2156A3A
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D2D98007B1
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:18 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-372-AlayuuniN82zc__1AyCecQ-1;
	Fri, 22 May 2020 11:39:13 -0400
X-MC-Unique: AlayuuniN82zc__1AyCecQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id C4477B226;
	Fri, 22 May 2020 15:39:12 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Damien LeMoal <damien.lemoal@wdc.com>
Date: Fri, 22 May 2020 17:38:58 +0200
Message-Id: <20200522153901.133375-10-hare@suse.de>
In-Reply-To: <20200522153901.133375-1-hare@suse.de>
References: <20200522153901.133375-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH 09/12] dm-zoned: improve logging messages for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of just reporting the errno this patch adds some more
verbose debugging message in the reclaim path.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-reclaim.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index d1a72b42dea2..fba0d48e38a7 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -367,8 +367,11 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 
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
@@ -412,6 +415,12 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
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
@@ -515,8 +524,6 @@ static void dmz_reclaim_work(struct work_struct *work)
 
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

