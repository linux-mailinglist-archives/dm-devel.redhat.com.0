Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F34E7207309
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 14:15:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593000941;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XB3SdfpSVodgGrrxlqUCi5dMqX1nlH8SqJCIkeQYS/0=;
	b=LfYieeRxb5vI8tvrIZOC3qDgfDUSzxD0QU4aqdXPor7R4YhD6VZbT8n8LOqhXW8V6uJTsu
	4b79QrFjK62NBS74QZPw6juG+rpHnHwUq3Df/uuNiPWkAquP7KyQubUTHRDGNnKHOoXLlk
	t/e3DjdYHn/faa3NZncGDNyI4COeZFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-4bRGw0gSPcKBk_XzOKON1Q-1; Wed, 24 Jun 2020 08:15:36 -0400
X-MC-Unique: 4bRGw0gSPcKBk_XzOKON1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86EEF805EE1;
	Wed, 24 Jun 2020 12:15:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56E375D9E7;
	Wed, 24 Jun 2020 12:15:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4F7B97019;
	Wed, 24 Jun 2020 12:15:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05NF7tVs017520 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Jun 2020 11:07:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7582410D1791; Tue, 23 Jun 2020 15:07:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70D4510D178A
	for <dm-devel@redhat.com>; Tue, 23 Jun 2020 15:07:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2637101A526
	for <dm-devel@redhat.com>; Tue, 23 Jun 2020 15:07:52 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-9-6Pe75pRyPyevkOGczSr9rA-1; Tue, 23 Jun 2020 11:07:48 -0400
X-MC-Unique: 6Pe75pRyPyevkOGczSr9rA-1
Received: by mail-lj1-f194.google.com with SMTP id y11so23845777ljm.9
	for <dm-devel@redhat.com>; Tue, 23 Jun 2020 08:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fOJ4r5eRLu7pYwZ7nb72+ethCqIdEc1b6ZQTMBOmtl0=;
	b=MsmxQxDYi5VZYSkveX1/SqNhHKHruFBjniD8GMmNJ3Wd33Oxn348lCGENN4TAJXgVO
	IW4efDKZDKPU7++JbTAyp63HaM7bcT9NiQdPFOF6exmold4SnVmvCdz1j6YL6CZ8Yp9B
	vhp/RKQqse3FB2u8FpsgmFIOJ4kaWcHcby44DSZPEKS5rED0ergLWY1wx2hfMfy3zUg/
	n/FO5ReDkvSUfQkKgFzFi8w+TB7tV2Q/oHkG2kaJ3OI6fV3wM4jHxs/nAl27k8EJfqC1
	J1nSXcmh09bj2yA3rK/+43JV2wiwoZdkmcSKP7lvkbA0bBki7MIrsidVVkre4UWGc0rq
	2sDw==
X-Gm-Message-State: AOAM532SMOqT7rpNxTwLuTOZKO49kZvAwmh8ibsBOLQDOaSYZ6UQx/M7
	VWVZyMSTLAWYIm93O02y0k89+LtfSzTlkWh2ihIFDlJG
X-Google-Smtp-Source: ABdhPJwP9Jyaji8sBzfy2og0disuJ5Wf14im88KFBUmSXjgOfg7NRJaAK3RiZHjiAOpGyDUbhCfzYCZ6/QlxbQoR3ng=
X-Received: by 2002:a05:651c:2d0:: with SMTP id
	f16mr10958567ljo.387.1592924866020; 
	Tue, 23 Jun 2020 08:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
	<CY4PR04MB3751F148CCFAAC99A7F05CF7E7970@CY4PR04MB3751.namprd04.prod.outlook.com>
	<20200623150118.GA19657@redhat.com>
In-Reply-To: <20200623150118.GA19657@redhat.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 23 Jun 2020 16:07:33 +0100
Message-ID: <CALrw=nHNJTX3kzv2Q=dc6hYr=d8S2=gT0VHkWigS1pmwr9ps5Q@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>, Damien Le Moal <Damien.LeMoal@wdc.com>
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 24 Jun 2020 08:15:13 -0400
Cc: "kernel-team@cloudflare.com" <kernel-team@cloudflare.com>,
	"dm-crypt@saout.de" <dm-crypt@saout.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH 0/1] dm-crypt excessive overhead
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

Do you think it may be better to break it in two flags: one for read
path and one for write? So, depending on the needs and workflow these
could be enabled independently?

Regards,
Ignat

On Tue, Jun 23, 2020 at 4:01 PM Mike Snitzer <snitzer@redhat.com> wrote:
>
> On Sun, Jun 21 2020 at  8:45pm -0400,
> Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>
> > On 2020/06/20 1:56, Mike Snitzer wrote:
> > > On Fri, Jun 19 2020 at 12:41pm -0400,
> > > Ignat Korchagin <ignat@cloudflare.com> wrote:
> > >
> > >> This is a follow up from the long-forgotten [1], but with some more convincing
> > >> evidence. Consider the following script:
> > >>
> > >> #!/bin/bash -e
> > >>
> > >> # create 4G ramdisk
> > >> sudo modprobe brd rd_nr=1 rd_size=4194304
> > >>
> > >> # create a dm-crypt device with NULL cipher on top of /dev/ram0
> > >> echo '0 8388608 crypt capi:ecb(cipher_null) - 0 /dev/ram0 0' | sudo dmsetup create eram0
> > >>
> > >> # create a dm-crypt device with NULL cipher and custom force_inline flag
> > >> echo '0 8388608 crypt capi:ecb(cipher_null) - 0 /dev/ram0 0 1 force_inline' | sudo dmsetup create inline-eram0
> > >>
> > >> # read all data from /dev/ram0
> > >> sudo dd if=/dev/ram0 bs=4k iflag=direct | sha256sum
> > >>
> > >> # read the same data from /dev/mapper/eram0
> > >> sudo dd if=/dev/mapper/eram0 bs=4k iflag=direct | sha256sum
> > >>
> > >> # read the same data from /dev/mapper/inline-eram0
> > >> sudo dd if=/dev/mapper/inline-eram0 bs=4k iflag=direct | sha256sum
> > >>
> > >> This script creates a ramdisk (to eliminate hardware bias in the benchmark) and
> > >> two dm-crypt instances on top. Both dm-crypt instances use the NULL cipher
> > >> to eliminate potentially expensive crypto bias (the NULL cipher just uses memcpy
> > >> for "encyption"). The first instance is the current dm-crypt implementation from
> > >> 5.8-rc1, the second is the dm-crypt instance with a custom new flag enabled from
> > >> the patch attached to this thread. On my VM (Debian in VirtualBox with 4 cores
> > >> on 2.8 GHz Quad-Core Intel Core i7) I get the following output (formatted for
> > >> better readability):
> > >>
> > >> # plain ram0
> > >> 1048576+0 records in
> > >> 1048576+0 records out
> > >> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 21.2305 s, 202 MB/s
> > >> 8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -
> > >>
> > >> # eram0 (current dm-crypt)
> > >> 1048576+0 records in
> > >> 1048576+0 records out
> > >> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 53.2212 s, 80.7 MB/s
> > >> 8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -
> > >>
> > >> # inline-eram0 (patched dm-crypt)
> > >> 1048576+0 records in
> > >> 1048576+0 records out
> > >> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 21.3472 s, 201 MB/s
> > >> 8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -
> > >>
> > >> As we can see, current dm-crypt implementation creates a significant IO
> > >> performance overhead (at least on small IO block sizes) for both latency and
> > >> throughput. We suspect offloading IO request processing into workqueues and
> > >> async threads is more harmful these days with the modern fast storage. I also
> > >> did some digging into the dm-crypt git history and much of this async processing
> > >> is not needed anymore, because the reasons it was added are mostly gone from the
> > >> kernel. More details can be found in [2] (see "Git archeology" section).
> > >>
> > >> We have been running the attached patch on different hardware generations in
> > >> more than 200 datacentres on both SATA SSDs and NVME SSDs and so far were very
> > >> happy with the performance benefits.
> > >>
> > >> [1]: https://www.spinics.net/lists/dm-crypt/msg07516.html
> > >> [2]: https://blog.cloudflare.com/speeding-up-linux-disk-encryption/
> > >>
> > >> Ignat Korchagin (1):
> > >>   Add DM_CRYPT_FORCE_INLINE flag to dm-crypt target
> > >>
> > >>  drivers/md/dm-crypt.c | 55 +++++++++++++++++++++++++++++++++----------
> > >>  1 file changed, 43 insertions(+), 12 deletions(-)
> > >>
> > >> --
> > >> 2.20.1
> > >>
> > >
> > > Hi,
> > >
> > > I saw [2] and have been expecting something from cloudflare ever since.
> > > Nice to see this submission.
> > >
> > > There is useful context in your 0th patch header.  I'll likely merge
> > > parts of this patch header with the more terse 1/1 header (reality is
> > > there only needed to be a single patch submission).
> > >
> > > Will review and stage accordingly if all looks fine to me.  Mikulas,
> > > please have a look too.
> >
> > Very timely: I was about to send a couple of patches to add zoned block device
> > support to dm-crypt :)
> >
> > I used [1] work as a base to have all _write_ requests be processed inline in
> > the submitter context so that the submission order is preserved, avoiding the
> > potential reordering of sequential writes that the normal workqueue based
> > processing can generate. This inline processing is done only for writes. Reads
> > are unaffected.
> >
> > To do this, I added a "inline_io" flag to struct convert_context which is
> > initialized in crypt_io_init() based on the BIO op.
> > kcryptd_crypt_write_io_submit() then uses this flag to call directly
> > generic_make_request() if inline_io is true.
> >
> > This simplifies things compared to [1] since reads can still be processed as is,
> > so there are no issued with irq context and no need for a tasklet.
> >
> > Should I send these patches as RFC to see what can be merged ? Or I can wait for
> > these patches and rebase on top.
>
> It'd be ideal for this inline capability to address both Ignat's and
> your needs.  Given Ignat's changes _should_ enable yours (and Ignat
> clarified that having reads inline is actually important) then I think it
> best if you review Ignat's patch closely, rebase on it and test that it
> meets your needs.
>
> I'll wait for you to do this work so that I can get your feedback on
> whether Ignat's changes look good for you too.  We have some time before
> the 5.9 merge window opens, lets just keep the communication going and
> make sure what we send upstream addresses everyone's needs and concerns.
>
> Thanks,
> Mike
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

