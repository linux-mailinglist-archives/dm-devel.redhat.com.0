Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E44391FDD37
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 03:25:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592443502;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4GJxctFe/J+AB9vZdNmmk0CpijHZNU198waS11vwGYw=;
	b=Ni8JztqSGJEsKg7jMLlzfKgvaSpRDsw+fec27YHGqivf9p/pdp+itOpjKZ/SKWQOerUZ/t
	Y9CucChpGfJdrPM6Cy8/1U+WH/wL3aybXyV551NLQ3fa26/+abFXFyPdRgZ8FRxtqV3URS
	SPeKjhab84HsL21dx/zepDE3EfegGGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-9SD3R9B_PuGDOwj_KjLC_Q-1; Wed, 17 Jun 2020 21:24:59 -0400
X-MC-Unique: 9SD3R9B_PuGDOwj_KjLC_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5319EA0BDC;
	Thu, 18 Jun 2020 01:24:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACAF55D9D3;
	Thu, 18 Jun 2020 01:24:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52A5E833C6;
	Thu, 18 Jun 2020 01:24:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I1Oinj000489 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 21:24:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1EE2E2157F25; Thu, 18 Jun 2020 01:24:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A6BC2157F23
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 01:24:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E163811E77
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 01:24:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-148-X6yUEM76NG2MQHLqz4BJHA-1;
	Wed, 17 Jun 2020 21:24:38 -0400
X-MC-Unique: X6yUEM76NG2MQHLqz4BJHA-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 82A4F20776;
	Thu, 18 Jun 2020 01:24:36 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 17 Jun 2020 21:21:13 -0400
Message-Id: <20200618012218.607130-107-sashal@kernel.org>
In-Reply-To: <20200618012218.607130-1-sashal@kernel.org>
References: <20200618012218.607130-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05I1Oinj000489
X-loop: dm-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH AUTOSEL 4.19 107/172] dm zoned: return NULL if
	dmz_get_zone_for_reclaim() fails to find a zone
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Hannes Reinecke <hare@suse.de>

[ Upstream commit 489dc0f06a5837f87482c0ce61d830d24e17082e ]

The only case where dmz_get_zone_for_reclaim() cannot return a zone is
if the respective lists are empty. So we should just return a simple
NULL value here as we really don't have an error code which would make
sense.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/md/dm-zoned-metadata.c | 4 ++--
 drivers/md/dm-zoned-reclaim.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 53eb21343b11..5c2bbdf67f25 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1580,7 +1580,7 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd)
 			return dzone;
 	}
 
-	return ERR_PTR(-EBUSY);
+	return NULL;
 }
 
 /*
@@ -1600,7 +1600,7 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
 			return zone;
 	}
 
-	return ERR_PTR(-EBUSY);
+	return NULL;
 }
 
 /*
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 84ac671acd2e..879848aad97a 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -348,8 +348,8 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 
 	/* Get a data zone */
 	dzone = dmz_get_zone_for_reclaim(zmd);
-	if (IS_ERR(dzone))
-		return PTR_ERR(dzone);
+	if (!dzone)
+		return -EBUSY;
 
 	start = jiffies;
 
-- 
2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

