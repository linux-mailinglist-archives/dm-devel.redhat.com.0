Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3501700E4
	for <lists+dm-devel@lfdr.de>; Wed, 26 Feb 2020 15:15:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582726503;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kkDiHZIAWlvk3wbnS2iy47kFk/0QaGNSp0BVBYM9e7w=;
	b=UKfDe8WUoVNPqvakD980NQyZA07ybt73U1vQpnzXv2crruxpshW6jzyotygkG2EzDWvAdQ
	jq2P99EwPm7QEFpOK2d2Vjv/5pkm0xAdp3XMWpZO4/xO/Q2U+oQwO0o5oIdbVYE9dCS7xE
	bCM3qwTzbXaieiL0VvKkodrCGfpZR0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-grxi4ANCNjm60bOjyKRiJw-1; Wed, 26 Feb 2020 09:15:01 -0500
X-MC-Unique: grxi4ANCNjm60bOjyKRiJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 929D4801F9F;
	Wed, 26 Feb 2020 14:14:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 812EE100164D;
	Wed, 26 Feb 2020 14:14:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A08484473;
	Wed, 26 Feb 2020 14:14:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01QEEbo1009066 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Feb 2020 09:14:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 31354909FA; Wed, 26 Feb 2020 14:14:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C360390CD1;
	Wed, 26 Feb 2020 14:14:31 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 01QEEVDP016665; Wed, 26 Feb 2020 09:14:31 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 01QEEVfP016661; Wed, 26 Feb 2020 09:14:31 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 26 Feb 2020 09:14:31 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Lukas Straub <lukasstraub2@web.de>
In-Reply-To: <20200226092705.61b7dcf4@luklap>
Message-ID: <alpine.LRH.2.02.2002260906280.17883@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200220190445.2222af54@luklap>
	<alpine.LRH.2.02.2002251127070.1014@file01.intranet.prod.int.rdu2.redhat.com>
	<20200226092705.61b7dcf4@luklap>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel <dm-devel@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm-integrity: Prevent RMW for full tag area
 writes
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



On Wed, 26 Feb 2020, Lukas Straub wrote:

> > > -		data = dm_bufio_read(ic->bufio, *metadata_block, &b);
> > > -		if (IS_ERR(data))
> > > -			return PTR_ERR(data);
> > > +		/* Don't read tag area from disk if we're going to overwrite it completely */
> > > +		if (op == TAG_WRITE && *metadata_offset == 0 && total_size >= ic->metadata_run) {
> >
> > Hi
> >
> > This is incorrect logic because ic->metadata_run is in the units of
> > 512-byte sectors and total_size is in bytes.
> >
> > If I correct the bug and change it to "if (op == TAG_WRITE &&
> > *metadata_offset == 0 && total_size >= ic->metadata_run << SECTOR_SHIFT)",
> > then the benchmark doesn't show any performance advantage at all.
> 
> Uh oh, looking at it again i have mixed up sectors/bytes elsewhere too.
> Actually, could we rewrite this check like
>  total_size >= (1U << SECTOR_SHIFT << ic->log2_buffer_sectors)?
> this should work, right?
> So we only have to overwrite part of the tag area, as long as it's whole sectors.
> 
> > You would need much bigger bios to take advantage for this - for example,
> > if we have 4k block size and 64k metadata buffer size and 4-byte crc32,
> > there are 65536/4=16384 tags in one metadata buffer and we would need
> > 16384*4096=64MiB bio to completely overwrite the metadata buffer. Such big
> > bios are not realistic.
> 
> What prevents us from using a single sector as the tag area? (Which was 

Single sector writes perform badly on SSDs (and on disks with 4k physical 
sector size). We would need at least 4k.

There's another problem - using smaller metadata blocks will degrade read 
performance, because we would need to issue more requests to read the 
metadata.

> my assumption with this patch) Then we would have (with 512b sectors) 
> 512/4 = 128 tags = 64k bio, which is still below the optimal write size 

4096/4*4096 = 4MiB - it may be possible, but it's still large.

> of raid5/6. I just tried to accomplish this, but there seems to be 
> minimum limit of interleave_sectors.
> 
> Regards,
> Lukas Straub

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

