Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 23E2210683B
	for <lists+dm-devel@lfdr.de>; Fri, 22 Nov 2019 09:45:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574412318;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dSHp9X1CwgqWRun+SiEPmiD7EfvQiKmuycgZoaJNDeY=;
	b=QgcC7aY28GUaaBO5o2ufAVfq8/33ylnPLeNwY7do3lamiLSWnbtwbkPNKuKeCl0dLxGih2
	P/7AtmX1RMan0BcNBo1YVtyNdiiuRHcul7FOxppvQrCNpcTgMpO5TukGFEF84UaB4sgoS/
	sB6QySpNZ7+lx+pOtt6zrz1e3dwB2Oc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-WaDjubkGMI-rBzUiJKHwJQ-1; Fri, 22 Nov 2019 03:45:12 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49AFC800A02;
	Fri, 22 Nov 2019 08:45:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02EA560167;
	Fri, 22 Nov 2019 08:45:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF4014BB65;
	Fri, 22 Nov 2019 08:45:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAM5pBvf003906 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 Nov 2019 00:51:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CA50E2064005; Fri, 22 Nov 2019 05:51:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C66362064001
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 05:51:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C4DD101A55E
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 05:51:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-97-H-P9AxjKPWu4IHSWCA5OBg-1; 
	Fri, 22 Nov 2019 00:51:05 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 972DE2068F;
	Fri, 22 Nov 2019 05:51:03 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Fri, 22 Nov 2019 00:47:12 -0500
Message-Id: <20191122054911.1750-93-sashal@kernel.org>
In-Reply-To: <20191122054911.1750-1-sashal@kernel.org>
References: <20191122054911.1750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-MC-Unique: H-P9AxjKPWu4IHSWCA5OBg-1
X-MC-Unique: WaDjubkGMI-rBzUiJKHwJQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAM5pBvf003906
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 22 Nov 2019 03:43:26 -0500
Cc: Sasha Levin <sashal@kernel.org>, Heinz Mauelshagen <heinzm@redhat.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH AUTOSEL 4.19 100/219] dm raid: fix false -EBUSY
	when handling check/repair message
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Heinz Mauelshagen <heinzm@redhat.com>

[ Upstream commit 74694bcbdf7e28a5ad548cdda9ac56d30be00d13 ]

Sending a check/repair message infrequently leads to -EBUSY instead of
properly identifying an active resync.  This occurs because
raid_message() is testing recovery bits in a racy way.

Fix by calling decipher_sync_action() from raid_message() to properly
identify the idle state of the RAID device.

Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/md/dm-raid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index b78a8a4d061ca..416998523d455 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -3690,8 +3690,7 @@ static int raid_message(struct dm_target *ti, unsigne=
d int argc, char **argv,
 =09=09=09set_bit(MD_RECOVERY_INTR, &mddev->recovery);
 =09=09=09md_reap_sync_thread(mddev);
 =09=09}
-=09} else if (test_bit(MD_RECOVERY_RUNNING, &mddev->recovery) ||
-=09=09   test_bit(MD_RECOVERY_NEEDED, &mddev->recovery))
+=09} else if (decipher_sync_action(mddev, mddev->recovery) !=3D st_idle)
 =09=09return -EBUSY;
 =09else if (!strcasecmp(argv[0], "resync"))
 =09=09; /* MD_RECOVERY_NEEDED set below */
--=20
2.20.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

