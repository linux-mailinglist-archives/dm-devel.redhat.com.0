Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 605A3249A68
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 12:30:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-oYCPdw3JNKCaKgDykJ9DQw-1; Wed, 19 Aug 2020 06:30:40 -0400
X-MC-Unique: oYCPdw3JNKCaKgDykJ9DQw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B64D6186A567;
	Wed, 19 Aug 2020 10:30:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81DFE5C1D0;
	Wed, 19 Aug 2020 10:30:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 22FD6180B656;
	Wed, 19 Aug 2020 10:30:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JAU7aI028561 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 06:30:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B4C4201E6AC; Wed, 19 Aug 2020 10:30:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76C3A2022798
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 10:30:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E7989B4480
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 10:30:01 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-333-wjf_RN9COJqq27QiuPbAAg-1; Wed, 19 Aug 2020 06:29:59 -0400
X-MC-Unique: wjf_RN9COJqq27QiuPbAAg-1
Received: by mail-io1-f51.google.com with SMTP id a5so24080683ioa.13
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 03:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vr39J/XKbS/RoFBjsIyOW7Du+Qr/Po99fBfJzCHkCNU=;
	b=IeF2vjhlioRkx5Rt5P9SO74aVroWq/BwFp44UN5SgZrGLBhw6wwQ80Gs38oTal2uKm
	7pgNB/Sf5gnA/ICCGuzVxRD5I/VStHIoMxUutZGJk5y/sRcytfL8XlciQxGlYlFrB3aJ
	aVvt5QuBHIKC0G2DB7eUQ0JzAGOj+/mvK9EqmqCZSl/mJQ8n/LnpeI328hX006Ui25ZK
	7JfssYBkjswlXJUdlMEF37ZV/bpG6EKYYGOhtSuaWS0sUhugKeK+WxMduxweO3Ixt/Uu
	P/7CyJ13gueeSVSwgsZ266vwZeNrHzWxuM8V/i/6AfWgCIW11QqV+H2kREo499RobGej
	goag==
X-Gm-Message-State: AOAM531ullQ/y7/BfSoA4kEJtduxsjKp7XFAYDZ6vut3Dznw8vsWNfpk
	vWjZR8MtYa6YDTKTrHDSPQCrMPPnXspqkCWGrR81xw==
X-Google-Smtp-Source: ABdhPJx00LQ8IUogjD1/RwoIDu2nicW6xkRWNxK7DHfuMvDJvv6pgzgrYC0UaScXGRItUfxgJ01+1t08OVWMLIWTRvk=
X-Received: by 2002:a5d:9bd5:: with SMTP id d21mr19627269ion.68.1597832998232; 
	Wed, 19 Aug 2020 03:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200807160327.GA977@redhat.com>
	<CAHk-=wiC=g-0yZW6QrEXRH53bUVAwEFgYxd05qgOnDLJYdzzcA@mail.gmail.com>
	<20200807204015.GA2178@redhat.com>
	<CAMeeMh_=M3Z7bLPN3_SD+VxNbosZjXgC_H2mZq1eCeZG0kUx1w@mail.gmail.com>
	<CALrw=nHD81X4YCpuk-Pp9_FSFba6LZEVUwo-YkYh1nL9pEbzpA@mail.gmail.com>
	<CAHk-=wj95eQxPOEMHe8j3zmpZYHbv8kZ0nz8fUUCO6acENTs0w@mail.gmail.com>
	<CAMeeMh_4j9EyOB3evyHi536d8kocH3egPdGO_FZj+G5iZzkVrQ@mail.gmail.com>
	<CY4PR04MB37512740818400616FDB6892E75D0@CY4PR04MB3751.namprd04.prod.outlook.com>
In-Reply-To: <CY4PR04MB37512740818400616FDB6892E75D0@CY4PR04MB3751.namprd04.prod.outlook.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 19 Aug 2020 11:29:46 +0100
Message-ID: <CALrw=nEZa+H5W3VzsTrGWvQ=KqWXx5BnXsLxLFho6gpGB+Ny=w@mail.gmail.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, John Dorminy <jdorminy@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: JeongHyeon Lee <jhs2.lee@samsung.com>, Mike Snitzer <snitzer@redhat.com>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	yangerkun <yangerkun@huawei.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block <linux-block@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper changes for 5.9
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thank you John, Damien for extensive measurements. I don't have much
to add as my measurements are probably just a subset of Damien's and
repeat their results.

One interesting thing I noticed when experimenting with this: we
mostly talk about average throughput, but sometimes it is interesting
to see the instant values (measured over small time slices). For
example, for 4kb block size, qd=1, 50/50 randrw job for a dm-crypt
encrypted ramdisk with ecb(cipher_null) cipher I just continuously run
in the terminal, I can see the instant throughput having somewhat
bimodal distribution: it reliably jumps between ~120 MiB/s and ~80
MiB/s medians (the overall average throughput being ~100 MiB/s of
course). This is for dm-crypt with workqueues. If I disable the
workqueues the distribution of the instant throughput becomes
"normal".

Without looking into much detail I wonder if HT has some side-effects
on dm-crypt processing (I have it enabled), because it seems not all
"cores" are equal for dm-cypt even on the null cipher.

I might get my hands on an arm64 server soon and curious to see how
dm-crypt and workques will compare there.

Regards,
Ignat


On Wed, Aug 19, 2020 at 8:10 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>
> John,
>
> On 2020/08/19 13:25, John Dorminy wrote:
> > Your points are good. I don't know a good macrobenchmark at present,
> > but at least various latency numbers are easy to get out of fio.
> >
> > I ran a similar set of tests on an Optane 900P with results below.
> > 'clat' is, as fio reports, the completion latency, measured in usec.
> > 'configuration' is [block size], [iodepth], [jobs]; picked to be a
> > varied selection that obtained excellent throughput from the drive.
> > Table reports average, and 99th percentile, latency times as well as
> > throughput. It matches Ignat's report that large block sizes using the
> > new option can have worse latency and throughput on top-end drives,
> > although that result doesn't make any sense to me.
> >
> > Happy to run some more there or elsewhere if there are suggestions.
> >
> > devicetype    configuration    MB/s    clat mean    clat 99%
> > ------------------------------------------------------------------
> > nvme base        1m,32,4     2259    59280        67634
> > crypt default    1m,32,4     2267    59050       182000
> > crypt no_w_wq    1m,32,4     1758    73954.54     84411
> > nvme base       64k,1024,1   2273    29500.92     30540
> > crypt default   64k,1024,1   2167    29518.89     50594
> > crypt no_w_wq   64k,1024,1   2056    31090.23     31327
> > nvme base        4k,128,4    2159      924.57      1106
> > crypt default    4k,128,4    1256     1663.67      3294
> > crypt no_w_wq    4k,128,4    1703     1165.69      1319
>
> I have been doing a lot of testing recently on dm-crypt, mostly for zoned
> storage, that is with write workqueue disabled, but also with regular disks to
> have something to compare to and verify my results. I confirm that I see similar
> changes in throughput/latency in my tests: disabling workqueues improves
> throughput for small IO sizes thanks to the lower latency (removed context
> switch overhead), but the benefits of disabling the workqueues become dubious
> for large IO sizes, and deep queue depth. See the heat-map attached for more
> results (nullblk device used for these measurements with 1 job per CPU).
>
> I also pushed things further as my tests as I primarily focused on enterprise
> systems with a large number of storage devices being used with a single server.
> To flatten things out and avoid any performance limitations due to the storage
> devices, PCIe and/or HBA bus speed and memory bus speed, I ended up performing
> lots of tests using nullblk with different settings:
>
> 1) SSD like multiqueue setting without "none" scheduler, with irq_mode=0
> (immediate completion in submission context) and irq_mode=1 for softirq
> completion (different completion context than submission).
> 2) HDD like single queue with mq-deadline as the scheduler, and the different
> irq_mode settings.
>
> I also played with CPU assignments for the fio jobs and tried various things.
>
> My observations are as follows, in no particular order:
>
> 1) Maximum throughput clearly directly depends on the numbers of CPUs involved
> in the crypto work. The crypto acceleration is limited per core and so the
> number of issuer contexts (for writes) and or completion contexts (for reads)
> almost directly determine maximum performance with worqueue disabled. I measured
> about 1.4GB/s at best on my system with a single writer 128KB/QD=4.
>
> 2) For a multi drive setup with IO issuers limited to a small set of CPUs,
> performance does not scale with the number of disks as the crypto engine speed
> of the CPUs being used is the limiting factor: both write encryption and read
> decryption happen on that set of CPUs, regardless of the others CPUs load.
>
> 3) For single queue devices, write performance scales badly with the number of
> CPUs used for IO issuing: the one CPU that runs the device queue to dispatch
> commands end up doing a lot of crypto work for requests queued through other
> CPUs too.
>
> 4) On a very busy system with a very large number of disks and CPUs used for
> IOs, the total throughput I get is very close for all settings with workqueues
> enabled and disabled, about 50GB/s total on my dual socket Xeon system. There
> was a small advantage for the none scheduler/multiqueue setting that gave up to
> 56GB/s with workqueues on and 47GB/s with workqueues off. The single
> queue/mq-deadline case gave 51 GB/s and 48 GB/s with workqueues on/off.
>
> 5) For the tests with the large number of drives and CPUs, things got
> interesting with the average latency: I saw about the same average with
> workqueues on and off. But the p99 latency was about 3 times lower with
> workqueues off than workqueues on. When all CPUs are busy, reducing overhead by
> avoiding additional context switches clearly helps.
>
> 6) With an arguably more realistic workload of 66% read and 34 % writes (read
> size is 64KB/1MB with a 60%/40% ratio and write size is fixed at 1MB), I ended
> up with higher total throughput with workqueues disabled (44GB/s) vs enabled
> (38GB/s). Average write latency was also 30% lower with workqueues disabled
> without any significant change to the average read latency.
>
> From all these tests, I am currently considering that for a large system with
> lots of devices, disabling workqueues is a win, as long as IO issuers are not
> limited to a small set of CPUs.
>
> The benefits of disabling workqueues for a desktop like system or a server
> system with one (or very few) super fast drives are much less clear in my
> opinion. Average and p99 latency are generally better with workqueues off, but
> total throughput may significantly suffer if only a small number of IO contexts
> are involved, that is, a small number of CPUs participate in the crypto
> processing. Then crypto hardware speed dictates the results and using workqueues
> to get parallelism between more CPU cores can give better throughput.
>
> That said, I am thinking that from all this, we can extract some hints to
> automate decision for using workqueues or not:
> 1) Small IOs (e.g. 4K) would probably benefit from having workqueue disabled,
> especially for 4Kn storage devices as such request would be processed as a
> single block with a single crypto API call.
> 2) It may be good to process any BIO marked with REQ_HIPRI (polling BIO) without
> any workqueue, to reduce latency, as intended by the caller.
> 3) We may want to have read-ahead reads use workqueues, especially for single
> queue devices (HDDs) to avoid increasing latency for other reads completing
> together with these read-ahead requests.
>
> In the end, I am still scratching my head trying to figure out what the best
> default setup may be.
>
> Best regards.
>
>
> --
> Damien Le Moal
> Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

