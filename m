Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 723331AAAF0
	for <lists+dm-devel@lfdr.de>; Wed, 15 Apr 2020 16:54:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586962459;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Y/LdmKjnuhNSMg2wcmC04VUOXcE16uNBLnXRCLWZaRs=;
	b=hxg0fW5LewUenMVJX6IFEA4eJ4Xx6fPJhe7zth6LpX7ixMw8h+yUeY24l4n8vY103943vw
	WJXQdfEwS9tk2eYr7P7kHcBZD5baR405gk9l5ZNVqc+06Sh9LMSr2fe3yG8aoUKphsumXX
	x1m8Fqd6c0kebpjlSXR4sfDOnvXDXwE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-CZzi0vECPhibYmD48WMhPw-1; Wed, 15 Apr 2020 10:54:16 -0400
X-MC-Unique: CZzi0vECPhibYmD48WMhPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1316D8017F3;
	Wed, 15 Apr 2020 14:54:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6C965D9E2;
	Wed, 15 Apr 2020 14:54:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64F6E4E44C;
	Wed, 15 Apr 2020 14:54:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03FEs4J4007728 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 10:54:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1A9411265B0; Wed, 15 Apr 2020 14:54:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D293011A267;
	Wed, 15 Apr 2020 14:54:00 +0000 (UTC)
Date: Wed, 15 Apr 2020 10:53:59 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200415145359.GA30397@redhat.com>
References: <alpine.LRH.2.02.2004081459520.14853@file01.intranet.prod.int.rdu2.redhat.com>
	<20200414190515.GA25340@redhat.com>
	<alpine.LRH.2.02.2004150405330.3968@file01.intranet.prod.int.rdu2.redhat.com>
	<20200415130153.GB29959@redhat.com>
	<alpine.LRH.2.02.2004151044530.25321@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2004151044530.25321@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, David Teigland <teigland@redhat.com>
Subject: Re: [dm-devel] dm writecache: fix data corruption when reloading
	the target
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
Content-Disposition: inline

On Wed, Apr 15 2020 at 10:49am -0400,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> 
> 
> On Wed, 15 Apr 2020, Mike Snitzer wrote:
> 
> > > > > +		r = writecache_read_metadata(wc,
> > > > > +			min((sector_t)bdev_logical_block_size(wc->ssd_dev->bdev) >> SECTOR_SHIFT,
> > > > > +			    (sector_t)wc->metadata_sectors));
> > > > 
> > > > Can you explain why this is needed?  Why isn't wc->metadata_sectors
> > > > already compatible with wc->ssd_dev->bdev ?
> > > 
> > > bdev_logical_block_size is the minimum size accepted by the device. If we 
> > > used just bdev_logical_block_size(wc->ssd_dev->bdev), someone could (by 
> > > using extremely small device with large logical_block_size) trigger 
> > > writing out of the allocated memory.
> > 
> > OK...
> >  
> > > > Yet you just use wc->metadata_sectors in the new call to
> > > > writecache_read_metadata() in writecache_resume()...
> > > 
> > > This was my mistake. Change it to "region.count = n_sectors";
> > 
> > sure, that addresses one aspect.  But I'm also asking:
> > given what yoou said above about reading past end of smaller device, why
> > is it safe to do this in writecache_resume ?
> > 
> > r = writecache_read_metadata(wc, wc->metadata_sectors);
> > 
> > Shouldn't ctr do extra validation and then all calls to
> > writecache_read_metadata() use wc->metadata_sectors?  Which would remove
> > need to pass extra 'n_sectors' arg to writecache_read_metadata()?
> > 
> > Mike
> 
> wc->memory_map = vmalloc(n_metadata_blocks << wc->block_size_bits);
> ...
> wc->metadata_sectors = n_metadata_blocks << (wc->block_size_bits - SECTOR_SHIFT);
> 
> So we are always sure that we can read/write wc->metadata_sectors safely. 
> 
> The problem is - what if bdev_logical_block_size is larger than 
> wc->metadata_sectors? Then, we would overread past the end of allocated 
> memory. The device wouldn't work anyway in this case, so perhaps a better 
> solution would be to reject this as an error in the constructor.

Yes, please reject in ctr.  No point allowing writecache to limp along
only to fail IO later.

By failing accordingly in ctr that'll allow writecache_read_metadata()
to not need an n_sectors override.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

