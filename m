Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 20A3414AA86
	for <lists+dm-devel@lfdr.de>; Mon, 27 Jan 2020 20:33:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580153580;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0u2qL6YSE0CSDv48tA4OFbSu5IH9FRVye+S4T4N8T1Y=;
	b=LHMnfSEXip35l5/lQQMbOMuHadF0hbJyMECl75Y6kGkLNJXCwonyPbX0hKDDN84yC3PoTJ
	Jhm6O6cp0BPV9zLpUocZ3GurMEoQKM8IJSnTcIv2sdayGzjoITBjYvaHmZmKuy8/XPb5Zu
	wXrTvjg+pL1w+xYX0tMYb7jUQbdvuRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-9xdGW-cpN3KYUQZUBi4_OA-1; Mon, 27 Jan 2020 14:32:58 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C3DA8017CC;
	Mon, 27 Jan 2020 19:32:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C56C8E617;
	Mon, 27 Jan 2020 19:32:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4AC818089C8;
	Mon, 27 Jan 2020 19:32:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00RJWTge016365 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 Jan 2020 14:32:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 43F105D9CD; Mon, 27 Jan 2020 19:32:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E9C35D9CA;
	Mon, 27 Jan 2020 19:32:26 +0000 (UTC)
Date: Mon, 27 Jan 2020 14:32:25 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200127193225.GA5065@redhat.com>
References: <20200123091713.12623-1-stefan.bader@canonical.com>
	<20200123091713.12623-2-stefan.bader@canonical.com>
	<20200123103541.GA28102@redhat.com>
	<20200123172816.GA31063@redhat.com>
	<81055166-37fb-ad65-6a53-11c22c626ab1@kernel.dk>
MIME-Version: 1.0
In-Reply-To: <81055166-37fb-ad65-6a53-11c22c626ab1@kernel.dk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: linux-kernel@vger.kernel.org, Stefan Bader <stefan.bader@canonical.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Tyler Hicks <tyler.hicks@canonical.com>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/1] blk/core: Gracefully handle unset
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 9xdGW-cpN3KYUQZUBi4_OA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jan 23 2020 at  1:52pm -0500,
Jens Axboe <axboe@kernel.dk> wrote:

> On 1/23/20 10:28 AM, Mike Snitzer wrote:
> > On Thu, Jan 23 2020 at  5:35am -0500,
> > Mike Snitzer <snitzer@redhat.com> wrote:
> > 
> >> On Thu, Jan 23 2020 at  4:17am -0500,
> >> Stefan Bader <stefan.bader@canonical.com> wrote:
> >>
> >>> When device-mapper adapted for multi-queue functionality, they
> >>> also re-organized the way the make-request function was set.
> >>> Before, this happened when the device-mapper logical device was
> >>> created. Now it is done once the mapping table gets loaded the
> >>> first time (this also decides whether the block device is request
> >>> or bio based).
> >>>
> >>> However in generic_make_request(), the request function gets used
> >>> without further checks and this happens if one tries to mount such
> >>> a partially set up device.
> >>>
> >>> This can easily be reproduced with the following steps:
> >>>  - dmsetup create -n test
> >>>  - mount /dev/dm-<#> /mnt
> >>>
> >>> This maybe is something which also should be fixed up in device-
> >>> mapper.
> >>
> >> I'll look closer at other options.
> >>
> >>> But given there is already a check for an unset queue
> >>> pointer and potentially there could be other drivers which do or
> >>> might do the same, it sounds like a good move to add another check
> >>> to generic_make_request_checks() and to bail out if the request
> >>> function has not been set, yet.
> >>>
> >>> BugLink: https://bugs.launchpad.net/bugs/1860231
> >>
> >> >From that bug;
> >> "The currently proposed fix introduces no chance of stability
> >> regressions. There is a chance of a very small performance regression
> >> since an additional pointer comparison is performed on each block layer
> >> request but this is unlikely to be noticeable."
> >>
> >> This captures my immediate concern: slowing down everyone for this DM
> >> edge-case isn't desirable.
> > 
> > SO I had a look and there isn't anything easier than adding the proposed
> > NULL check in generic_make_request_checks().  Given the many
> > conditionals in that  function.. what's one more? ;)
> > 
> > I looked at marking the queue frozen to prevent IO via
> > blk_queue_enter()'s existing cheeck -- but that quickly felt like an
> > abuse, especially in that there isn't a queue unfreeze for bio-based.
> > 
> > Jens, I'll defer to you to judge this patch further.  If you're OK with
> > it: cool.  If not, I'm open to suggestions for how to proceed.  
> > 
> 
> It does kinda suck... The generic_make_request_checks() is a mess, and
> this doesn't make it any better. Any reason why we can't solve this
> two step setup in a clean fashion instead of patching around it like
> this? Feels like a pretty bad hack, tbh.

I just staged the following DM fix:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.6&id=28a101d6b344f5a38d482a686d18b1205bc92333

From: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 27 Jan 2020 14:07:23 -0500
Subject: [PATCH] dm: fix potential for q->make_request_fn NULL pointer

Move blk_queue_make_request() to dm.c:alloc_dev() so that
q->make_request_fn is never NULL during the lifetime of a DM device
(even one that is created without a DM table).

Otherwise generic_make_request() will crash simply by doing:
  dmsetup create -n test
  mount /dev/dm-N /mnt

While at it, move ->congested_data initialization out of
dm.c:alloc_dev() and into the bio-based specific init method.

Reported-by: Stefan Bader <stefan.bader@canonical.com>
BugLink: https://bugs.launchpad.net/bugs/1860231
Fixes: ff36ab34583a ("dm: remove request-based logic from make_request_fn wrapper")
Depends-on: c12c9a3c3860c ("dm: various cleanups to md->queue initialization code")
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index e8f9661a10a1..b89f07ee2eff 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1859,6 +1859,7 @@ static void dm_init_normal_md_queue(struct mapped_device *md)
 	/*
 	 * Initialize aspects of queue that aren't relevant for blk-mq
 	 */
+	md->queue->backing_dev_info->congested_data = md;
 	md->queue->backing_dev_info->congested_fn = dm_any_congested;
 }
 
@@ -1949,7 +1950,12 @@ static struct mapped_device *alloc_dev(int minor)
 	if (!md->queue)
 		goto bad;
 	md->queue->queuedata = md;
-	md->queue->backing_dev_info->congested_data = md;
+	/*
+	 * default to bio-based required ->make_request_fn until DM
+	 * table is loaded and md->type established. If request-based
+	 * table is loaded: blk-mq will override accordingly.
+	 */
+	blk_queue_make_request(md->queue, dm_make_request);
 
 	md->disk = alloc_disk_node(1, md->numa_node_id);
 	if (!md->disk)
@@ -2264,7 +2270,6 @@ int dm_setup_md_queue(struct mapped_device *md, struct dm_table *t)
 	case DM_TYPE_DAX_BIO_BASED:
 	case DM_TYPE_NVME_BIO_BASED:
 		dm_init_normal_md_queue(md);
-		blk_queue_make_request(md->queue, dm_make_request);
 		break;
 	case DM_TYPE_NONE:
 		WARN_ON_ONCE(true);
-- 
2.21.GIT

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

