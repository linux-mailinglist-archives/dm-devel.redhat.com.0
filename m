Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1264B1ED0BB
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jun 2020 15:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591190767;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ddfg6nl11d6GZL7FBY2q8Ifwj1EG9AQY89RjzX9UE6U=;
	b=XYcDwc2ZvXuNixCnK+CsPcR8boOd5SZikKz3+SR3HhFg2Sid8bmGeOsTCOUeh8bRQegO6V
	+dcJ31TK9FSMr5hqua6iDePWg0c5/uFe1KLtMZXHI2aWNcDzwTFMH4d6exglyp6uJuSzoB
	Ajf3dCy1OvNGS9VKRnGu1jMAnFU0VAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-_FCzawufPZGnACdxCJHr0g-1; Wed, 03 Jun 2020 09:26:03 -0400
X-MC-Unique: _FCzawufPZGnACdxCJHr0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C854884634D;
	Wed,  3 Jun 2020 13:25:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0F8410016E8;
	Wed,  3 Jun 2020 13:25:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61339ADA87;
	Wed,  3 Jun 2020 13:25:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 051CbP3l013383 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 08:37:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EA19C105AD7D; Mon,  1 Jun 2020 12:37:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4384106573D
	for <dm-devel@redhat.com>; Mon,  1 Jun 2020 12:37:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFA0C86C075
	for <dm-devel@redhat.com>; Mon,  1 Jun 2020 12:37:24 +0000 (UTC)
Received: from forwardcorp1p.mail.yandex.net (forwardcorp1p.mail.yandex.net
	[77.88.29.217]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-15-yVVZr9l7Ojm2kkxqcUU28Q-1; Mon, 01 Jun 2020 08:37:19 -0400
X-MC-Unique: yVVZr9l7Ojm2kkxqcUU28Q-1
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
	[IPv6:2a02:6b8:0:1a2d::301])
	by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 2D98F2E1537;
	Mon,  1 Jun 2020 15:37:15 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
	(myt5-70c90f7d6d7d.qloud-c.yandex.net
	[2a02:6b8:c12:3e2c:0:640:70c9:f7d])
	by mxbackcorp1o.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
	sin8Zu6uxy-bCx0121q; Mon, 01 Jun 2020 15:37:15 +0300
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
	[2a02:6b8:b080:6420::1:8])
	by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA
	id oflWdp3Iqs-bCW4OxOY; Mon, 01 Jun 2020 15:37:12 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-raid@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Mon, 01 Jun 2020 15:37:12 +0300
Message-ID: <159101503243.180989.945052901574296650.stgit@buzz>
In-Reply-To: <159101473169.180989.12175693728191972447.stgit@buzz>
References: <159101473169.180989.12175693728191972447.stgit@buzz>
User-Agent: StGit/0.22-39-gd257
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 03 Jun 2020 09:25:45 -0400
Cc: Christoph Hellwig <hch@infradead.org>
Subject: [dm-devel] [PATCH RFC 2/3] md/raid0: enable REQ_NOWAIT
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Set limits.nowait_requests = 1 before stacking limits.
Raid itself does not delay bio in raid0_make_request().

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
---
 drivers/md/raid0.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index 322386ff5d22..e34292b05488 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -406,6 +406,9 @@ static int raid0_run(struct mddev *mddev)
 		blk_queue_io_opt(mddev->queue,
 				 (mddev->chunk_sectors << 9) * mddev->raid_disks);
 
+		/* raid0_make_request() does not delay requests */
+		mddev->queue->limits.nowait_requests = 1;
+
 		rdev_for_each(rdev, mddev) {
 			disk_stack_limits(mddev->gendisk, rdev->bdev,
 					  rdev->data_offset << 9);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

