Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 89A861D9DFE
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 19:37:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589909846;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Yz0TAS5jv13uU3ORx69o3HyeKuRd3vaK/lGBWR+ftHs=;
	b=iEJKL44nLLjugrw6DXtRiZkApPHaaEw2ZXRq71Us/pMA1rzbE02UHSOmcNkm+OjLqfch3c
	mWLgc0I+EN6KfJQSGHsx9MJggMDoI3gN4To5bj7JFgfzKAFmYf8IJ6/sbOB79AzMj3AVNh
	JZiRfvesUcHSU7yy/Cdn7FE4mRKmYHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-hLbx9MDpNN2RlZOrHiZMig-1; Tue, 19 May 2020 13:37:23 -0400
X-MC-Unique: hLbx9MDpNN2RlZOrHiZMig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EE1018FF667;
	Tue, 19 May 2020 17:37:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEB59797F5;
	Tue, 19 May 2020 17:37:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88ADF1809542;
	Tue, 19 May 2020 17:37:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JHb6lG013902 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 13:37:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B6F41025EBD; Tue, 19 May 2020 17:37:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3F4610027A6;
	Tue, 19 May 2020 17:36:56 +0000 (UTC)
Date: Tue, 19 May 2020 13:36:56 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200519173655.GA30916@redhat.com>
References: <20200519081424.103318-1-hare@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200519081424.103318-1-hare@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCHv2 0/6] dm-zoned: improve cache performance
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, May 19 2020 at  4:14am -0400,
Hannes Reinecke <hare@suse.de> wrote:

> Hi all,
> 
> here's an update to dm-zoned to separate out cache zones.
> In the update to metadata version 2 the regular drive was split
> in emulated zones, which were handled just like 'normal' random
> write zones.
> This causes a performance drop once these emulated zones have
> been mapped, as typicall the random zones from the zoned drive
> will perform noticeably slower than those from the regular drive.
> (After all, that was kinda the idea of using a regular disk in
> the first place ...)
> 
> So in this patchset I've introduced a separate 'cache' zone type,
> allowing us to differentiate between emulated and real zones.
> With that we can switch the allocation mode to use only cache
> zones, and use random zones similar to sequential write zones.
> That avoids the performance issue noted above.
> 
> I've also found that the sequential write zones perform noticeably
> better on writes (which is all we're caching anyway), so I've
> added another patch switching the allocation routine from preferring
> sequential write zones for reclaim.
> 
> This patchset also contains some minor fixes like remving an unused
> variable etc.
> 
> As usual, comments and reviews are welcome.
> 
> Changes to v1:
> - Include reviews from Damien

I'll take a look at this series now, but I'm still waiting for formal
Reviewed-by: or Acked-by: from Damien before I'll stage for 5.8 --
current development window is coming to a close though.

> - Introduce allocation flags
> - Terminate reclaim on contention
> - Rework original patch series
> 
> Hannes Reinecke (6):
>   dm-zoned: return NULL if dmz_get_zone_for_reclaim() fails to find a zone
>   dm-zoned: separate random and cache zones
>   dm-zoned: reclaim random zones when idle
>   dm-zoned: start reclaim with sequential zones
>   dm-zoned: terminate reclaim on congestion
>   dm-zoned: remove unused variable in dmz_do_reclaim()

FYI I folded the last 6/6 patch back into the original commit that
introduced the unused variable (via rebase).

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

