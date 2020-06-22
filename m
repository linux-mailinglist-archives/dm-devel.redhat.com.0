Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D450020325D
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jun 2020 10:47:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592815664;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bKqXWRha47TGdDO0txDbRrRXdaeo6JsMLYItOIU4wzU=;
	b=OYwm5oyKRSSCtkbfO40p6VrZmazL8PK0UDJfhylsbmpggoWFgOquOe2TOo1Jhh7JRR5Lm+
	wx9wK83PTQUWxeHtOycTZGDeiZ44JhjnruTbj/oK6e53J9XCnI2fknnKv0KajGN1sh5kuz
	1nVcX6Oa/CeNxmf3PoPqQFKm9xInhns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-OTSgtl3MP5G3C2zIEHLCgw-1; Mon, 22 Jun 2020 04:47:42 -0400
X-MC-Unique: OTSgtl3MP5G3C2zIEHLCgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84578805724;
	Mon, 22 Jun 2020 08:47:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57E7110002BC;
	Mon, 22 Jun 2020 08:47:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12A6E1809554;
	Mon, 22 Jun 2020 08:47:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05M7tM04029111 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 22 Jun 2020 03:55:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1683A5AB7F; Mon, 22 Jun 2020 07:55:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11B1530BB0
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 07:55:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98564800294
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 07:55:19 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-428-7GAE-OmJPzi4Ue3DKWUKHw-1; Mon, 22 Jun 2020 03:55:17 -0400
X-MC-Unique: 7GAE-OmJPzi4Ue3DKWUKHw-1
Received: by mail-wr1-f66.google.com with SMTP id a6so13640907wrm.4
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 00:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fBfcbRhyaKPHpnPDFtJmNQKmojsvDKT6TheQQXt9J8o=;
	b=Ufsjw+QkM6EiWraWw0tBmHHYZEAa9IaxbqfbyPHXliAd/GU7rTaqu2vBgl1JBZTfSj
	WamuYN/yPIwTbP4zB/Ew6mQmsNHlig821AtNA/Q7Gw67j+bmYvc0u/8Hy0Agyu03tmp4
	/aNowZA8mEgLErVkndIQtyXKCMOPFEyLRwO+kyD2mk5R+V4mh7Zp9uvkf1sk9lWaguXR
	IcE2BYU4uqYUMlYv7hjt3UxHsaNJm9uJWt582IdZq6lPmTgnNviBqoUe1XBGSWudyjT7
	x3s5u9UhoEj/STLqf4VldRyrbPcNc6bNxfomk0vI2lFea8FDrn61onaKUeLxjiXX4X33
	NkqA==
X-Gm-Message-State: AOAM533cH3nR6rd5vizxtHfyjWri2SEfJPwLxh6g/8A7o+k55g8St1St
	HxX4T/UNm8hD8XrpP7y7kMw/7n2toXXsuV619N0ISA==
X-Google-Smtp-Source: ABdhPJzb10pCV/bZXscPOSvmToADrZtcrEMn2BzcwVIwO8GOzDWrQaPeQlsTT+CHQmU2Tpmrbn4hPj0CEs5uDrhBnRM=
X-Received: by 2002:adf:958a:: with SMTP id p10mr16673028wrp.323.1592812515841;
	Mon, 22 Jun 2020 00:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
	<CY4PR04MB3751F148CCFAAC99A7F05CF7E7970@CY4PR04MB3751.namprd04.prod.outlook.com>
In-Reply-To: <CY4PR04MB3751F148CCFAAC99A7F05CF7E7970@CY4PR04MB3751.namprd04.prod.outlook.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Mon, 22 Jun 2020 08:55:05 +0100
Message-ID: <CALrw=nFe2q5wn2LTA99yrFhZqGR9ehiqhEQqKFh44KmvTVF5gg@mail.gmail.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 22 Jun 2020 04:47:18 -0400
Cc: Mike Snitzer <snitzer@redhat.com>,
	"kernel-team@cloudflare.com" <kernel-team@cloudflare.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 22, 2020 at 1:45 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>
> On 2020/06/20 1:56, Mike Snitzer wrote:
> > On Fri, Jun 19 2020 at 12:41pm -0400,
> > Ignat Korchagin <ignat@cloudflare.com> wrote:
> >
> >> This is a follow up from the long-forgotten [1], but with some more convincing
> >> evidence. Consider the following script:
> >>
> >> #!/bin/bash -e
> >>
> >> # create 4G ramdisk
> >> sudo modprobe brd rd_nr=1 rd_size=4194304
> >>
> >> # create a dm-crypt device with NULL cipher on top of /dev/ram0
> >> echo '0 8388608 crypt capi:ecb(cipher_null) - 0 /dev/ram0 0' | sudo dmsetup create eram0
> >>
> >> # create a dm-crypt device with NULL cipher and custom force_inline flag
> >> echo '0 8388608 crypt capi:ecb(cipher_null) - 0 /dev/ram0 0 1 force_inline' | sudo dmsetup create inline-eram0
> >>
> >> # read all data from /dev/ram0
> >> sudo dd if=/dev/ram0 bs=4k iflag=direct | sha256sum
> >>
> >> # read the same data from /dev/mapper/eram0
> >> sudo dd if=/dev/mapper/eram0 bs=4k iflag=direct | sha256sum
> >>
> >> # read the same data from /dev/mapper/inline-eram0
> >> sudo dd if=/dev/mapper/inline-eram0 bs=4k iflag=direct | sha256sum
> >>
> >> This script creates a ramdisk (to eliminate hardware bias in the benchmark) and
> >> two dm-crypt instances on top. Both dm-crypt instances use the NULL cipher
> >> to eliminate potentially expensive crypto bias (the NULL cipher just uses memcpy
> >> for "encyption"). The first instance is the current dm-crypt implementation from
> >> 5.8-rc1, the second is the dm-crypt instance with a custom new flag enabled from
> >> the patch attached to this thread. On my VM (Debian in VirtualBox with 4 cores
> >> on 2.8 GHz Quad-Core Intel Core i7) I get the following output (formatted for
> >> better readability):
> >>
> >> # plain ram0
> >> 1048576+0 records in
> >> 1048576+0 records out
> >> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 21.2305 s, 202 MB/s
> >> 8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -
> >>
> >> # eram0 (current dm-crypt)
> >> 1048576+0 records in
> >> 1048576+0 records out
> >> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 53.2212 s, 80.7 MB/s
> >> 8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -
> >>
> >> # inline-eram0 (patched dm-crypt)
> >> 1048576+0 records in
> >> 1048576+0 records out
> >> 4294967296 bytes (4.3 GB, 4.0 GiB) copied, 21.3472 s, 201 MB/s
> >> 8479e43911dc45e89f934fe48d01297e16f51d17aa561d4d1c216b1ae0fcddca  -
> >>
> >> As we can see, current dm-crypt implementation creates a significant IO
> >> performance overhead (at least on small IO block sizes) for both latency and
> >> throughput. We suspect offloading IO request processing into workqueues and
> >> async threads is more harmful these days with the modern fast storage. I also
> >> did some digging into the dm-crypt git history and much of this async processing
> >> is not needed anymore, because the reasons it was added are mostly gone from the
> >> kernel. More details can be found in [2] (see "Git archeology" section).
> >>
> >> We have been running the attached patch on different hardware generations in
> >> more than 200 datacentres on both SATA SSDs and NVME SSDs and so far were very
> >> happy with the performance benefits.
> >>
> >> [1]: https://www.spinics.net/lists/dm-crypt/msg07516.html
> >> [2]: https://blog.cloudflare.com/speeding-up-linux-disk-encryption/
> >>
> >> Ignat Korchagin (1):
> >>   Add DM_CRYPT_FORCE_INLINE flag to dm-crypt target
> >>
> >>  drivers/md/dm-crypt.c | 55 +++++++++++++++++++++++++++++++++----------
> >>  1 file changed, 43 insertions(+), 12 deletions(-)
> >>
> >> --
> >> 2.20.1
> >>
> >
> > Hi,
> >
> > I saw [2] and have been expecting something from cloudflare ever since.
> > Nice to see this submission.
> >
> > There is useful context in your 0th patch header.  I'll likely merge
> > parts of this patch header with the more terse 1/1 header (reality is
> > there only needed to be a single patch submission).
> >
> > Will review and stage accordingly if all looks fine to me.  Mikulas,
> > please have a look too.
>
> Very timely: I was about to send a couple of patches to add zoned block device
> support to dm-crypt :)
>
> I used [1] work as a base to have all _write_ requests be processed inline in
> the submitter context so that the submission order is preserved, avoiding the
> potential reordering of sequential writes that the normal workqueue based
> processing can generate. This inline processing is done only for writes. Reads
> are unaffected.
>
> To do this, I added a "inline_io" flag to struct convert_context which is
> initialized in crypt_io_init() based on the BIO op.
> kcryptd_crypt_write_io_submit() then uses this flag to call directly
> generic_make_request() if inline_io is true.
>
> This simplifies things compared to [1] since reads can still be processed as is,
> so there are no issued with irq context and no need for a tasklet.

In one of our major IO workflows (CDN cache) using dm-crypt created
high and spiky p99 response times, which actually prompted this
investigation. So, of all the things we do prefer the read path to be
inlined even more than the write path.

> Should I send these patches as RFC to see what can be merged ? Or I can wait for
> these patches and rebase on top.
>
> >
> > Thanks,
> > Mike
> >
> > --
> > dm-devel mailing list
> > dm-devel@redhat.com
> > https://www.redhat.com/mailman/listinfo/dm-devel
> >
> >
>
>
> --
> Damien Le Moal
> Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

