Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7A006146668
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jan 2020 12:13:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579778012;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vRMKghmYgaCRkwP/fahTvX+DD3bBikziMKjEAdnX3P0=;
	b=SpaRGR/H8G6+xJwtv9LLq06pfKK3Rhi+HkBJVdEBu2tAO6vtk0N2amgZDBtjnYWFCMJkF7
	zX6+WjRpe8zbXunvUU3tnQLn46b5QrcdpBxLMrEMWdp11SqoiXDKPqZITyA76tXhSXJJ0g
	2in0+PmS+AXuOMzlPRQVL37h4W+68Tk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-LTpzb2c0OPmjes1eCy72mA-1; Thu, 23 Jan 2020 06:13:30 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A26EDB68;
	Thu, 23 Jan 2020 11:13:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7141019C69;
	Thu, 23 Jan 2020 11:13:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7E358198C;
	Thu, 23 Jan 2020 11:13:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00N9XFad018070 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 04:33:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C7F752038B80; Thu, 23 Jan 2020 09:33:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C36802026D67
	for <dm-devel@redhat.com>; Thu, 23 Jan 2020 09:33:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 761231011E03
	for <dm-devel@redhat.com>; Thu, 23 Jan 2020 09:33:13 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-265-HjX5dXiQN422hYz_jW0jFw-1; Thu, 23 Jan 2020 04:33:08 -0500
Received: from [154.119.55.242] (helo=canonical.com)
	by youngberry.canonical.com with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <stefan.bader@canonical.com>)
	id 1iuYc5-00076Q-0F; Thu, 23 Jan 2020 09:17:21 +0000
From: Stefan Bader <stefan.bader@canonical.com>
To: linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	linux-block@vger.kernel.org
Date: Thu, 23 Jan 2020 11:17:13 +0200
Message-Id: <20200123091713.12623-2-stefan.bader@canonical.com>
In-Reply-To: <20200123091713.12623-1-stefan.bader@canonical.com>
References: <20200123091713.12623-1-stefan.bader@canonical.com>
X-MC-Unique: HjX5dXiQN422hYz_jW0jFw-1
X-MC-Unique: LTpzb2c0OPmjes1eCy72mA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00N9XFad018070
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 23 Jan 2020 06:13:07 -0500
Cc: Jens Axboe <axboe@kernel.dk>, Tyler Hicks <tyler.hicks@canonical.com>,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH 1/1] blk/core: Gracefully handle unset
	make_request_fn
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When device-mapper adapted for multi-queue functionality, they
also re-organized the way the make-request function was set.
Before, this happened when the device-mapper logical device was
created. Now it is done once the mapping table gets loaded the
first time (this also decides whether the block device is request
or bio based).

However in generic_make_request(), the request function gets used
without further checks and this happens if one tries to mount such
a partially set up device.

This can easily be reproduced with the following steps:
 - dmsetup create -n test
 - mount /dev/dm-<#> /mnt

This maybe is something which also should be fixed up in device-
mapper. But given there is already a check for an unset queue
pointer and potentially there could be other drivers which do or
might do the same, it sounds like a good move to add another check
to generic_make_request_checks() and to bail out if the request
function has not been set, yet.

BugLink: https://bugs.launchpad.net/bugs/1860231
Fixes: ff36ab34583a ("dm: remove request-based logic from make_request_fn wrapper")
Signed-off-by: Stefan Bader <stefan.bader@canonical.com>
---
 block/blk-core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/block/blk-core.c b/block/blk-core.c
index 1075aaff606d..adcd042edd2d 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -884,6 +884,13 @@ generic_make_request_checks(struct bio *bio)
 			bio_devname(bio, b), (long long)bio->bi_iter.bi_sector);
 		goto end_io;
 	}
+	if (unlikely(!q->make_request_fn)) {
+		printk(KERN_ERR
+		       "generic_make_request: Trying to access "
+		       "block-device without request function: %s\n",
+		       bio_devname(bio, b));
+		goto end_io;
+	}
 
 	/*
 	 * Non-mq queues do not honor REQ_NOWAIT, so complete a bio
-- 
2.17.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

