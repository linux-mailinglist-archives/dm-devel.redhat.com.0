Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC11207308
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 14:15:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593000940;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xBQmJMbk1RK2lv0YgvPWBhmpFZaCsJeBnY+e+p7p9AE=;
	b=By2ogNZ7l0oHgeQV2W0n8uF5XoJ/jlU9JKmYhwgOjD7UdAf+eRsKMqy8dUaX9WE2XlXB+6
	pTh7ozailxRrDhxg06RrIb3rkjQ6IFjfQ5sdpVM2cvXZYRWzf/KKeyyYbQvvLZ3GXvf01w
	yEig8knVSCVjvnZJSczmgEP0tZa5f/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-mpuCdQVPPzaLH7b0hMwwFw-1; Wed, 24 Jun 2020 08:15:37 -0400
X-MC-Unique: mpuCdQVPPzaLH7b0hMwwFw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28A08EC1A4;
	Wed, 24 Jun 2020 12:15:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0766C1DC;
	Wed, 24 Jun 2020 12:15:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEFCF104915;
	Wed, 24 Jun 2020 12:15:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O82vr2004236 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 04:02:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 720A710CD930; Wed, 24 Jun 2020 08:02:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DB0F10CD92E
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 08:02:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DDA018E05E1
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 08:02:55 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-131-5vljv5TkM8asuGXfshNKlQ-1; Wed, 24 Jun 2020 04:02:52 -0400
X-MC-Unique: 5vljv5TkM8asuGXfshNKlQ-1
Received: by mail-wr1-f66.google.com with SMTP id l10so1280680wrr.10
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 01:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9NQUfNYeK/TI+d0cUiXO3hjD9ZuHGvPoQ56932SRZ4c=;
	b=Vayxuze3gR9Q93zWZQHgMj9hrGESKc81DmK7FZKQT65vyecQUnoz1sUBYYQPS2/B96
	PZyeXrFWiT4Q4cB/IVbsV+6SpEgctaRMDL3d0sRsuEzmadCHJwdhLJ4I6K7PVdm3RTq6
	h8kZ7F+2Sgf558g1dYRg9wMGTKrY2QmmjJh1ErGSzt1L98Rv3dzo9bbqsv8zM6mIByJm
	4KGgkLTO+jHrK2beAoP5Ckj0iQBdqrHP21Lt0HiiXdAjXwVGZIfZ3z4OQ7tT6+cuDGaJ
	uHVoWVm++Mkck2Wj37VrlmtduVs4y9W7JFqLdWhxQckv0OhAyJhhOrkW2t22n0HQ05Pb
	ORRw==
X-Gm-Message-State: AOAM533f8NNEWJV82NR/++qsV+k90I6rnCjzPjZbVh0o6Yna0oc/IoOx
	SmzLvzWZgrtBr6IpQ4jUzb7zzjxiCtfDOwev1Q90fIPf
X-Google-Smtp-Source: ABdhPJyOj1ZrwSODv5DHAZf4d+kATxblkm9SFPKRHbdMtMGNJ/yg0W/1HtM3nlPOFm9njnEwtQpklHyS8De4vgCySIc=
X-Received: by 2002:a5d:4992:: with SMTP id r18mr3868698wrq.323.1592985771104; 
	Wed, 24 Jun 2020 01:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
	<CY4PR04MB3751F148CCFAAC99A7F05CF7E7970@CY4PR04MB3751.namprd04.prod.outlook.com>
	<20200623150118.GA19657@redhat.com>
	<CALrw=nHNJTX3kzv2Q=dc6hYr=d8S2=gT0VHkWigS1pmwr9ps5Q@mail.gmail.com>
	<20200623152235.GB19657@redhat.com>
	<CY4PR04MB3751EB316BFD5600AFAA6796E7950@CY4PR04MB3751.namprd04.prod.outlook.com>
	<20200624052209.GB23205@redhat.com>
In-Reply-To: <20200624052209.GB23205@redhat.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 24 Jun 2020 09:02:39 +0100
Message-ID: <CALrw=nE4Wf3mBqb9BvaEu32aSpAuuGsbKmPBReOHRze-0jyfkw@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>, Damien Le Moal <Damien.LeMoal@wdc.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 24, 2020 at 6:22 AM Mike Snitzer <snitzer@redhat.com> wrote:
>
> On Wed, Jun 24 2020 at 12:54am -0400,
> Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>
> > On 2020/06/24 0:23, Mike Snitzer wrote:
> > > On Tue, Jun 23 2020 at 11:07am -0400,
> > > Ignat Korchagin <ignat@cloudflare.com> wrote:
> > >
> > >> Do you think it may be better to break it in two flags: one for read
> > >> path and one for write? So, depending on the needs and workflow these
> > >> could be enabled independently?
> > >
> > > If there is a need to split, then sure.  But I think Damien had a hard
> > > requirement that writes had to be inlined but that reads didn't _need_
> > > to be for his dm-zoned usecase.  Damien may not yet have assessed the
> > > performance implications, of not have reads inlined, as much as you
> > > have.
> >
> > We did do performance testing :)
> > The results are mixed and performance differences between inline vs workqueues
> > depend on the workload (IO size, IO queue depth and number of drives being used
> > mostly). In many cases, inlining everything does really improve performance as
> > Ignat reported.
> >
> > In our testing, we used hard drives and so focused mostly on throughput rather
> > than command latency. The added workqueue context switch overhead and crypto
> > work latency compared to typical HDD IO times is small, and significant only if
> > the backend storage as short IO times.
> >
> > In the case of HDDs, especially for large IO sizes, inlining crypto work does
> > not shine as it prevents an efficient use of CPU resources. This is especially
> > true with reads on a large system with many drives connected to a single HBA:
> > the softirq context decryption work does not lend itself well to using other
> > CPUs that did not receive the HBA IRQ signaling command completions. The test
> > results clearly show much higher throughputs using dm-crypt as is.
> >
> > On the other hand, inlining crypto work significantly improves workloads of
> > small random IOs, even for a large number of disks: removing the overhead of
> > context switches allows faster completions, allowing sending more requests to
> > the drives more quickly, keeping them busy.
> >
> > For SMR, the inlining of write requests is *mandatory* to preserve the issuer
> > write sequence, but encryption work being done in the issuer context (writes to
> > SMR drives can only be O_DIRECT writes), efficient CPU resource usage can be
> > achieved by simply using multiple writer thread/processes, working on different
> > zones of different disks. This is a very reasonable model for SMR as writes into
> > a single zone have to be done under mutual exclusion to ensure sequentiality.
> >
> > For reads, SMR drives are essentially exactly the same as regular disks, so
> > as-is or inline are both OK. Based on our performance results, allowing the user
> > to have the choice of inlining or not reads based on the target workload would
> > be great.
> >
> > Of note is that zone append writes (emulated in SCSI, native with NVMe) are not
> > subject to the sequential write constraint, so they can also be executed either
> > inline or asynchronously.
> >
> > > So let's see how Damien's work goes and if he trully doesn't need/want
> > > reads to be inlined then 2 flags can be created.
> >
> > For SMR, I do not need inline reads, but I do want the user to have the
> > possibility of using this setup as that can provide better performance for some
> > workloads. I think that splitting the inline flag in 2 is exactly what we want:
> >
> > 1) For SMR, the write-inline flag can be automatically turned on when the target
> > device is created if the backend device used is a host-managed zoned drive (scsi
> > or NVMe ZNS). For reads, it would be the user choice, based on the target workload.
> > 2) For regular block devices, write-inline only, read-inline only or both would
> > be the user choice, to optimize for their target workload.
> >
> > With the split into 2 flags, my SMR support patch becomes very simple.
>
> OK, thanks for all the context.  Was a fun read ;)
>
> SO let's run with splitting into 2 flags.  Ignat would you be up to
> tweaking your patch to provide that and post a v2?
>
> An added bonus would be to consolidate your 0/1 and 1/1 patch headers,
> and add in the additional answers you provided in this thread to help
> others understand the patch (mainly some more detail about why tasklet
> is used).

Yes, will do

> Thanks,
> Mike
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

