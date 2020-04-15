Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D82431AAA71
	for <lists+dm-devel@lfdr.de>; Wed, 15 Apr 2020 16:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586962225;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Rzup+fD9IOnH2gKSdv4cCyKpaLa4OeLOfVti5Iq//78=;
	b=XNwYacnJrNa4c9NanKYKo0VdmTt992aJhBMKdPucnz8cWLVPrPy6mj9cuFri59if0dyNVl
	0CnFSqOHa81cgHyCRWW/bdYp2SHfLCsjM4m+uxQoKOKdEuXm5ruigrDZWKkLY/Gsf6bvij
	8RmVNGN9ZIR37GxsiRGO5z/EhT9wFSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-_9PnO53gNbyloPRJOlpaZw-1; Wed, 15 Apr 2020 10:50:20 -0400
X-MC-Unique: _9PnO53gNbyloPRJOlpaZw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99F41800D5B;
	Wed, 15 Apr 2020 14:50:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A621D272A7;
	Wed, 15 Apr 2020 14:50:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B79818089CD;
	Wed, 15 Apr 2020 14:49:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03FEnk6o007476 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 10:49:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F1D5210027B1; Wed, 15 Apr 2020 14:49:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCB131036D11;
	Wed, 15 Apr 2020 14:49:32 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 03FEnV5Q009999; Wed, 15 Apr 2020 10:49:31 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 03FEnVY7009996; Wed, 15 Apr 2020 10:49:31 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 15 Apr 2020 10:49:31 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@redhat.com>
In-Reply-To: <20200415130153.GB29959@redhat.com>
Message-ID: <alpine.LRH.2.02.2004151044530.25321@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2004081459520.14853@file01.intranet.prod.int.rdu2.redhat.com>
	<20200414190515.GA25340@redhat.com>
	<alpine.LRH.2.02.2004150405330.3968@file01.intranet.prod.int.rdu2.redhat.com>
	<20200415130153.GB29959@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 15 Apr 2020, Mike Snitzer wrote:

> > > > +		r = writecache_read_metadata(wc,
> > > > +			min((sector_t)bdev_logical_block_size(wc->ssd_dev->bdev) >> SECTOR_SHIFT,
> > > > +			    (sector_t)wc->metadata_sectors));
> > > 
> > > Can you explain why this is needed?  Why isn't wc->metadata_sectors
> > > already compatible with wc->ssd_dev->bdev ?
> > 
> > bdev_logical_block_size is the minimum size accepted by the device. If we 
> > used just bdev_logical_block_size(wc->ssd_dev->bdev), someone could (by 
> > using extremely small device with large logical_block_size) trigger 
> > writing out of the allocated memory.
> 
> OK...
>  
> > > Yet you just use wc->metadata_sectors in the new call to
> > > writecache_read_metadata() in writecache_resume()...
> > 
> > This was my mistake. Change it to "region.count = n_sectors";
> 
> sure, that addresses one aspect.  But I'm also asking:
> given what yoou said above about reading past end of smaller device, why
> is it safe to do this in writecache_resume ?
> 
> r = writecache_read_metadata(wc, wc->metadata_sectors);
> 
> Shouldn't ctr do extra validation and then all calls to
> writecache_read_metadata() use wc->metadata_sectors?  Which would remove
> need to pass extra 'n_sectors' arg to writecache_read_metadata()?
> 
> Mike

wc->memory_map = vmalloc(n_metadata_blocks << wc->block_size_bits);
...
wc->metadata_sectors = n_metadata_blocks << (wc->block_size_bits - SECTOR_SHIFT);

So we are always sure that we can read/write wc->metadata_sectors safely. 

The problem is - what if bdev_logical_block_size is larger than 
wc->metadata_sectors? Then, we would overread past the end of allocated 
memory. The device wouldn't work anyway in this case, so perhaps a better 
solution would be to reject this as an error in the constructor.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

