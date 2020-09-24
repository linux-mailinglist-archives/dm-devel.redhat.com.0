Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5BD277746
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 18:56:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600966603;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Xf40kjYbHBoXGiN37CX84qE6Bk5QWqEfXc2MQieQv1E=;
	b=R5/2Bc7zUmTAbTBNdGfZFqVtvTj6GJxB+I80pBUqTvA3MRubBVvPxKZoNmH9pS86lhVKIt
	l3ful1QOiAt3llF8ju/Pu/Ne4wcyABM7kh8rjNR7K5Syol6FMwLjRD3gbaDFxdTzH+RmJx
	OUqsbl98If1ujUSWmmh1F8lJ37mFDCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-7cI8DC1oOyyVNWJOlvR47Q-1; Thu, 24 Sep 2020 12:56:40 -0400
X-MC-Unique: 7cI8DC1oOyyVNWJOlvR47Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E65C010BBEE2;
	Thu, 24 Sep 2020 16:56:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 164F89CBA;
	Thu, 24 Sep 2020 16:56:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0364C1826D2B;
	Thu, 24 Sep 2020 16:56:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OGuLwV020472 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 12:56:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C00C5C1D7; Thu, 24 Sep 2020 16:56:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD09F5C1C7;
	Thu, 24 Sep 2020 16:56:17 +0000 (UTC)
Date: Thu, 24 Sep 2020 12:56:17 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200924165616.GA14650@redhat.com>
References: <alpine.LRH.2.02.2009241225310.22728@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2009241225310.22728@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] dm-raid: stack limits instead of overwriting them.
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 24 2020 at 12:26pm -0400,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> This patch fixes a warning WARN_ON_ONCE(!q->limits.discard_granularity).
> The reason is that the function raid_io_hints overwrote
> limits->discard_granularity with zero. We need to properly stack the
> limits instead of overwriting them.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org
> 
> ---
>  drivers/md/dm-raid.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Index: linux-2.6/drivers/md/dm-raid.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-raid.c	2020-09-24 18:16:45.000000000 +0200
> +++ linux-2.6/drivers/md/dm-raid.c	2020-09-24 18:16:45.000000000 +0200
> @@ -3734,8 +3734,8 @@ static void raid_io_hints(struct dm_targ
>  	 * RAID0/4/5/6 don't and process large discard bios properly.
>  	 */
>  	if (rs_is_raid1(rs) || rs_is_raid10(rs)) {
> -		limits->discard_granularity = chunk_size_bytes;
> -		limits->max_discard_sectors = rs->md.chunk_sectors;
> +		limits->discard_granularity = max(limits->discard_granularity, chunk_size_bytes);
> +		limits->max_discard_sectors = min_not_zero(limits->max_discard_sectors, (unsigned)rs->md.chunk_sectors);
>  	}
>  }
>  

OK, but how is it that chunk_size_bytes is 0?  Oh, raid1 doesn't have a
chunksize does it!?

Relative to MD raid0 and raid10: they don't have dm-stripe like
optimization to handle large discards.  So stacking up larger discard
limits (that span multiple chunks) is a non-starter right?

Like dm-raid.c, raid10.c does explicitly set max_discard_sectors to
mddev->chunk_sectors.  But it (mistakenly IMHO) just accepts stackd up
discard_granularity.

Looking at raid1.c I see MD is just stacking up the limits without
modification.  Maybe dm-raid.c shouldn't be changing these limits at all
for raid1 (just use what was already stacked)?

WAIT... Could it be that raid_io_hints _really_ meant to special case
raid0 and raid10 -- due to their striping/splitting requirements!?
So, not raid1 but raid0?

E.g.:

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 56b723d012ac..6dca932d6f1d 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -3730,10 +3730,10 @@ static void raid_io_hints(struct dm_target *ti,
struct queue_limits *limits)
        blk_limits_io_opt(limits, chunk_size_bytes *
	mddev_data_stripes(rs));

        /*
-        * RAID1 and RAID10 personalities require bio splitting,
-        * RAID0/4/5/6 don't and process large discard bios properly.
+        * RAID0 and RAID10 personalities require bio splitting,
+        * RAID1/4/5/6 don't and process large discard bios properly.
         */
-       if (rs_is_raid1(rs) || rs_is_raid10(rs)) {
+       if (rs_is_raid0(rs) || rs_is_raid10(rs)) {
                limits->discard_granularity = chunk_size_bytes;
                limits->max_discard_sectors = rs->md.chunk_sectors;
        }

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

