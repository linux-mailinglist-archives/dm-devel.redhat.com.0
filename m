Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D737C3064F1
	for <lists+dm-devel@lfdr.de>; Wed, 27 Jan 2021 21:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611778852;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5R1f2Up06nUcnPPbWwWF/0Eg+f/oUIlbpuMdSAvfcyM=;
	b=RPd4mGsNClq79pLGVIAA2h2WCFsDYoSW6cddy6Ep17Jvt2etlOAEdlLzkcYXsiegX3e1TG
	X/j53UfjryzDjd0+xYOwq1Y/JGrSZb61oZRIm+KF3o38DnKW8LiEHHjFRAeltBY7ZXO5rT
	gIARcH+7C6ytGfGu3XgOLLvPOC5oq/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-blRkBW_yOlCMLzyLBY4OOA-1; Wed, 27 Jan 2021 15:20:48 -0500
X-MC-Unique: blRkBW_yOlCMLzyLBY4OOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A020C80A5C1;
	Wed, 27 Jan 2021 20:20:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F75F10023B6;
	Wed, 27 Jan 2021 20:20:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB9E61809C9F;
	Wed, 27 Jan 2021 20:20:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10RKGIAk006947 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 Jan 2021 15:16:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A2C9B5C1D0; Wed, 27 Jan 2021 20:16:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from pick.fieldses.org (ovpn-118-194.rdu2.redhat.com [10.10.118.194])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2206D5C1BB;
	Wed, 27 Jan 2021 20:16:14 +0000 (UTC)
Received: by pick.fieldses.org (Postfix, from userid 2815)
	id 7858F120467; Wed, 27 Jan 2021 15:16:13 -0500 (EST)
Date: Wed, 27 Jan 2021 15:16:13 -0500
From: "J. Bruce Fields" <bfields@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20210127201613.GB1339677@pick.fieldses.org>
References: <alpine.LRH.2.02.2101131540250.10680@file01.intranet.prod.int.rdu2.redhat.com>
	<20210113213746.GH9978@pick.fieldses.org>
	<20210113230849.GA42761@pick.fieldses.org>
	<20210114224239.GA63697@pick.fieldses.org>
	<20210115155840.GA95264@pick.fieldses.org>
	<20210115164016.GB95264@pick.fieldses.org>
	<alpine.LRH.2.02.2101151142550.30218@file01.intranet.prod.int.rdu2.redhat.com>
	<20210115204319.GC95264@pick.fieldses.org>
	<20210115224735.GD95264@pick.fieldses.org>
	<alpine.LRH.2.02.2101230917360.5678@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2101230917360.5678@file01.intranet.prod.int.rdu2.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>,
	dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm writecache: fix performance degradation
	in ssd mode
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sorry for the delay testing:

On Sat, Jan 23, 2021 at 09:19:56AM -0500, Mikulas Patocka wrote:
> On Fri, 15 Jan 2021, J. Bruce Fields wrote:
> 
> > Any recommendations?  I spent some time with blktrace/blkparse/btt and
> > can't make head or tails of them, I'm afraid.
> > 
> > --b.
> 
> Hi
> 
> Try this patch:

Looks good!

I applied this to Fedora's 5.10.7-200.fc33.x86_64 and timed an untar of
linux-5.9.tar.gz onto an NFS export of my dm-writecache setup and got
5m14s, where without the patch it took nearly 2 hours.

For comparison, the same untar took about 100 minutes to an export of
the backend hard drives, and 3m47s to an export of the caching device
(an Optane MEMPEK1W016GA).

I also looked again at a trace of an untar of the smaller nfs-utils
source, and saw that knfsd's vfs_sync_range()s were mainly returning in
a few hundred microseconds with the occasional latency of up to 3ms,
where before they frequently taking about 15ms.

(This is all nice because it means a $20 piece of hardware plus any old
hard drives can get me acceptable NFS server performance, whereas once
upon a time it would have required a drive array with battery-backed RAM
cache, or more recently an enterprise SSD with power loss protection).

Thanks for the persistence!  (In both senses.)

--b.

> From: Mikulas Patocka <mpatocka@redhat.com>
> 
> Fix a thinko in ssd_commit_superblock. region.count is in sectors, not
> bytes. This bug doesn't corrupt data, but it causes performance
> degradation.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Fixes: dc8a01ae1dbd ("dm writecache: optimize superblock write")
> Cc: stable@vger.kernel.org	# v5.7
> Reported-by: J. Bruce Fields <bfields@redhat.com>
> 
> ---
>  drivers/md/dm-writecache.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: linux-2.6/drivers/md/dm-writecache.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-writecache.c	2021-01-23 10:51:31.000000000 +0100
> +++ linux-2.6/drivers/md/dm-writecache.c	2021-01-23 15:16:53.000000000 +0100
> @@ -523,7 +523,7 @@ static void ssd_commit_superblock(struct
>  
>  	region.bdev = wc->ssd_dev->bdev;
>  	region.sector = 0;
> -	region.count = PAGE_SIZE;
> +	region.count = PAGE_SIZE >> SECTOR_SHIFT;
>  
>  	if (unlikely(region.sector + region.count > wc->metadata_sectors))
>  		region.count = wc->metadata_sectors - region.sector;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

