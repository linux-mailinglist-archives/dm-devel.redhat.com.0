Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4578D171AC9
	for <lists+dm-devel@lfdr.de>; Thu, 27 Feb 2020 14:57:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582811829;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tcYUQCn00zKuA+xNCK6n9s4PnyLR8Hs28MY9LkKufvo=;
	b=AoZROq9U7lEZKzGkcSRLi0WYVOTrA9wXYkqc0mpvF6BisQYRqsvgBW5DfbIct/kAn8Kbqy
	MH5kadFvRse0DXWEUs/uCvhJaYtSbO7OJzscojhM9gDPJ87vlr5niGKDwTV5SrKP4FIMKx
	SUZ5Jfhthllwfmfz5j2rMxyAXfboqFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-iCpDW-_yNIOuh1ovN8qHSA-1; Thu, 27 Feb 2020 08:57:07 -0500
X-MC-Unique: iCpDW-_yNIOuh1ovN8qHSA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A036519057A0;
	Thu, 27 Feb 2020 13:57:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8919787B08;
	Thu, 27 Feb 2020 13:57:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1928418089CD;
	Thu, 27 Feb 2020 13:56:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01RC8lNH026392 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Feb 2020 07:08:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3B0992028CD2; Thu, 27 Feb 2020 12:08:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 359782026D69
	for <dm-devel@redhat.com>; Thu, 27 Feb 2020 12:08:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4875101A55D
	for <dm-devel@redhat.com>; Thu, 27 Feb 2020 12:08:44 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-59-RkyvWwvfPIuVgiyhVsAcCA-1;
	Thu, 27 Feb 2020 07:08:40 -0500
X-MC-Unique: RkyvWwvfPIuVgiyhVsAcCA-1
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([88.130.61.170]) by smtp.web.de (mrweb101
	[213.165.67.124]) with ESMTPSA (Nemesis) id 0MZDKy-1iqs4w2uZ2-00Kuud;
	Thu, 27 Feb 2020 13:08:38 +0100
Date: Thu, 27 Feb 2020 13:08:37 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200227130837.2707a09e@luklap>
In-Reply-To: <alpine.LRH.2.02.2002260906280.17883@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200220190445.2222af54@luklap>
	<alpine.LRH.2.02.2002251127070.1014@file01.intranet.prod.int.rdu2.redhat.com>
	<20200226092705.61b7dcf4@luklap>
	<alpine.LRH.2.02.2002260906280.17883@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ozkZigUwfVKoE3DL7WFXu+YQcXXWnYtpD9IbAGYs7IJxt1ubQTN
	SHC9UU9XqrDAu1uRTltUZAZ2GrweD8ytp/CvcIanE4dasxZzRhj5YaJjShacXLqqVEIopcd
	kevxWcFum7FLWkiyfcu6kUpwPDGb/c0fNL5RItB4br4N+3h5ahWBGeXsyBJ5Ru7NNQtCeej
	o20t4k16Nvph+5fGalPWA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bGXnTMFBTCY=:wSGQorkeuJSsKeZcPAWTl7
	FnpjBU4+E8NXkRkj/o2rTtP06NQLCUitnDufM1UlYo1opugvHw4IWB+hnr64qQnohggxS8kKH
	ze7n6SMJ9vwCscOYs0gdPmic9ebvokGEFQD86qr9JFygUZFe0hdKlMrpVf+BY/pLToDKRQgIW
	kRnjbSVKOd1wyatz6p2V0m4HQ0Q5rH+PbXents6WF+F+O0us4qPdWvhPBVV0yvJrTt/2qK/Ye
	NBxuG7uO5hRVAdfa/c4l2YwUBkWGlk8EY1FZE23/NR5qfYnsCFE3VIIJgYAqpT/gPVn+3bCfI
	kx3sm1dSqrE85oT9TGgSWrs0Kt7KsOk9IQgfh5e0inlk5FWIhmpklriDvgLPw646ouxW8Iej7
	n9UYvXd5WEY+oma/Qd/IhW2USrkvgqNlgxLicTlcuxeMsSRDTLNoYlzrqmPwbwr8bZZ0TGusn
	WmrVmCzHtfqhZUeLz0eSXIoNrP5nZ03Q8/PcE9jfUy2UjGtUv2RgSjjN9jzASugpsDfrsLXNw
	PgP992fV2lL2u8eo99/RNyMgI/mvQPaFBhY7T2boaYDpr/9SG8AHYQ19mLiFHjoiWJtiWyeRy
	sj36aV5nvLMU1JqjOD5QU+BRzNtzQd3wBsxns9wYIeL4LDU6Xt0kGaNizYCERCzEPX6pkOAAb
	3hN+doYywnax4YSyc5TWBGcn9UfScjvsYMpICQ8zA0n0hoG0it4vbE7DbhI2fX9dSdjuF3SxG
	xXgKnaA4hjCs4SoG5Z/L809+FMDDSfo895qBOOVLdneWGfNmirlN1sXYWdShp4cy6qelSYQ4b
	4+c7D8ypSZ5iB4UcCNQH3lsBcxhbzEXFysUWyvDfqFqe+jPK6KF62N4SSo79Kg+CY/h40hhgm
	DROpepuBnsa+s2dQQ+EIj0LHpxg07VZlkmuguZfGP+X+DnkKYRxja45P7K7LA4Ch+GXfRrUtM
	04+7WOfUJiwcWFSYyvFPGFPcpX4S+al+5xAIAWcWPDKVIypYD7wh//7rLELPViFMaOLxAMzGU
	Wv9pdxESQAwOIKizRE+LWBkOAoTsHPnKbgtEcHjQlwTBG7PIW+yLKsser22Do2ZVE41OOtHyZ
	PVPyDNUGpElcTJ7wcipco8sMuOfUZ9Q51Ro3+mPFKBuuvPrncqy5L/H7YFUwjC5Nqy5EkqCxm
	b6c39aeUJr9o1yqBvcOq3uX85qKIcoCFLyE+xUq9Qo9IrzpC5e5ExF1gOpaDGI6q7LzdTTvu/
	wMeDurKN2svYmmxyP
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01RC8lNH026392
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:56:22 -0500
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 26 Feb 2020 09:14:31 -0500 (EST)
Mikulas Patocka <mpatocka@redhat.com> wrote:

> On Wed, 26 Feb 2020, Lukas Straub wrote:
>
> > > > -		data = dm_bufio_read(ic->bufio, *metadata_block, &b);
> > > > -		if (IS_ERR(data))
> > > > -			return PTR_ERR(data);
> > > > +		/* Don't read tag area from disk if we're going to overwrite it completely */
> > > > +		if (op == TAG_WRITE && *metadata_offset == 0 && total_size >= ic->metadata_run) {
> > >
> > > Hi
> > >
> > > This is incorrect logic because ic->metadata_run is in the units of
> > > 512-byte sectors and total_size is in bytes.
> > >
> > > If I correct the bug and change it to "if (op == TAG_WRITE &&
> > > *metadata_offset == 0 && total_size >= ic->metadata_run << SECTOR_SHIFT)",
> > > then the benchmark doesn't show any performance advantage at all.
> >
> > Uh oh, looking at it again i have mixed up sectors/bytes elsewhere too.
> > Actually, could we rewrite this check like
> >  total_size >= (1U << SECTOR_SHIFT << ic->log2_buffer_sectors)?
> > this should work, right?
> > So we only have to overwrite part of the tag area, as long as it's whole sectors.
> >
> > > You would need much bigger bios to take advantage for this - for example,
> > > if we have 4k block size and 64k metadata buffer size and 4-byte crc32,
> > > there are 65536/4=16384 tags in one metadata buffer and we would need
> > > 16384*4096=64MiB bio to completely overwrite the metadata buffer. Such big
> > > bios are not realistic.
> >
> > What prevents us from using a single sector as the tag area? (Which was
>
> Single sector writes perform badly on SSDs (and on disks with 4k physical
> sector size). We would need at least 4k.
People with SSDs can still use a large tag area.

> There's another problem - using smaller metadata blocks will degrade read
> performance, because we would need to issue more requests to read the
> metadata.
We can use prefetching, dm-bufio supports that.

> > my assumption with this patch) Then we would have (with 512b sectors)
> > 512/4 = 128 tags = 64k bio, which is still below the optimal write size
>
> 4096/4*4096 = 4MiB - it may be possible, but it's still large.

We don't have to fill whole sector with metadata, we can for example use just the first
512 bytes (giving 512/4*4096 = 512k writes).
The space overhead is negligible:
For 1T of data we have 1G of metadata if we fill the whole sector.
If we use just the first 512 bytes, we get 8G of metadata.

Regards,
Lukas Straub

> > of raid5/6. I just tried to accomplish this, but there seems to be
> > minimum limit of interleave_sectors.
> >
> > Regards,
> > Lukas Straub
>
> Mikulas
>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

