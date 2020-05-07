Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 725DB1C8C9C
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 15:40:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588858837;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ecXFaek0yMdVEziKOiPUr66AF5qtMkF3jGfK6W6ywVA=;
	b=ckY7BBVnMjzELQuRRl1mVxW0IMPzHmXb+pw2L/+U492cM6KNVKO71U6a57WEMTvXTTTcw0
	/zuV5MQlBN50XDxkEZuYgPi0g7q8A5meb7uRO6N1eo5cyw/4IHQryz3NhzliDUNXa6N1sZ
	uRmbk2wp/xLNPv1mqSr5wxg7lWkVqBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-qY4RNkeeMzqgpqdMkeQiWw-1; Thu, 07 May 2020 09:40:35 -0400
X-MC-Unique: qY4RNkeeMzqgpqdMkeQiWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F63ABFC6;
	Thu,  7 May 2020 13:40:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31DE310013BD;
	Thu,  7 May 2020 13:40:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B624B4E585;
	Thu,  7 May 2020 13:40:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0477u9pe023977 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 03:56:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB11C2157F25; Thu,  7 May 2020 07:56:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E73412166B27
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C54D187277E
	for <dm-devel@redhat.com>; Thu,  7 May 2020 07:56:08 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-303-o4IZcaakPgaKKTCoixrrAw-1; Thu, 07 May 2020 03:56:06 -0400
X-MC-Unique: o4IZcaakPgaKKTCoixrrAw-1
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 7689DCDF2CE26A1BADFD;
	Thu,  7 May 2020 15:55:58 +0800 (CST)
Received: from DESKTOP-C3MD9UG.china.huawei.com (10.166.215.55) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 7 May 2020 15:55:52 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	"Sergey Senozhatsky" <sergey.senozhatsky.work@gmail.com>, Matthew Wilcox
	<willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, Coly Li
	<colyli@suse.de>, Kent Overstreet <kent.overstreet@gmail.com>, "Alasdair
	Kergon" <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, linux-block
	<linux-block@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	linux-mm <linux-mm@kvack.org>, dm-devel <dm-devel@redhat.com>, Song Liu
	<song@kernel.org>, linux-raid <linux-raid@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>
Date: Thu, 7 May 2020 15:50:59 +0800
Message-ID: <20200507075100.1779-10-thunder.leizhen@huawei.com>
In-Reply-To: <20200507075100.1779-1-thunder.leizhen@huawei.com>
References: <20200507075100.1779-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0477u9pe023977
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 07 May 2020 09:40:06 -0400
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [dm-devel] [PATCH v2 09/10] md: use existing definition
	RESYNC_SECTORS
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

"RESYNC_BLOCK_SIZE/512" is equal to "RESYNC_BLOCK_SIZE >> 9", replace it
with RESYNC_SECTORS.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/md/raid10.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index 948afe720fca..ac4273f804e8 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -4483,8 +4483,8 @@ static sector_t reshape_request(struct mddev *mddev, sector_t sector_nr,
 		last = conf->reshape_progress - 1;
 		sector_nr = last & ~(sector_t)(conf->geo.chunk_mask
 					       & conf->prev.chunk_mask);
-		if (sector_nr + RESYNC_BLOCK_SIZE/512 < last)
-			sector_nr = last + 1 - RESYNC_BLOCK_SIZE/512;
+		if (sector_nr + RESYNC_SECTORS < last)
+			sector_nr = last + 1 - RESYNC_SECTORS;
 	} else {
 		/* 'next' is after the last device address that we
 		 * might write to for this chunk in the new layout
@@ -4506,8 +4506,8 @@ static sector_t reshape_request(struct mddev *mddev, sector_t sector_nr,
 		last  = sector_nr | (conf->geo.chunk_mask
 				     & conf->prev.chunk_mask);
 
-		if (sector_nr + RESYNC_BLOCK_SIZE/512 <= last)
-			last = sector_nr + RESYNC_BLOCK_SIZE/512 - 1;
+		if (sector_nr + RESYNC_SECTORS <= last)
+			last = sector_nr + RESYNC_SECTORS - 1;
 	}
 
 	if (need_flush ||
-- 
2.26.0.106.g9fadedd



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

