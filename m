Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A2152205561
	for <lists+dm-devel@lfdr.de>; Tue, 23 Jun 2020 17:01:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592924514;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dxnOaeVoP4oWB7XYYs6v4CK5LEQVU8EmxeXffgIP2/I=;
	b=YudQyejrOWV1v1RNE7KTj3GTGG34yZfQpblNP4+J6SvDt/bdaTH8vj+R2U7aAkeABVVAKN
	o8TV0RV7YoP4paXo5bJEjLDrkzo9N0zSxSjU7CV8qOcPeggE6Jey1yeTy7WL4BMt1v8h9x
	2RY5fzoNWP3sR3Sb5vXDj606Z6ZaXkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-0tAno5tmNY-GNRcn-Cea1g-1; Tue, 23 Jun 2020 11:01:52 -0400
X-MC-Unique: 0tAno5tmNY-GNRcn-Cea1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C89378018AB;
	Tue, 23 Jun 2020 15:01:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B6625C3E7;
	Tue, 23 Jun 2020 15:01:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88D781809547;
	Tue, 23 Jun 2020 15:01:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05NF1PMx017040 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Jun 2020 11:01:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2913D6109F; Tue, 23 Jun 2020 15:01:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E395610FD;
	Tue, 23 Jun 2020 15:01:19 +0000 (UTC)
Date: Tue, 23 Jun 2020 11:01:18 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20200623150118.GA19657@redhat.com>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
	<CY4PR04MB3751F148CCFAAC99A7F05CF7E7970@CY4PR04MB3751.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CY4PR04MB3751F148CCFAAC99A7F05CF7E7970@CY4PR04MB3751.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: "kernel-team@cloudflare.com" <kernel-team@cloudflare.com>,
	"dm-crypt@saout.de" <dm-crypt@saout.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>, "agk@redhat.com" <agk@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sun, Jun 21 2020 at  8:45pm -0400,
Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

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
> 
> Should I send these patches as RFC to see what can be merged ? Or I can wait for
> these patches and rebase on top.

It'd be ideal for this inline capability to address both Ignat's and
your needs.  Given Ignat's changes _should_ enable yours (and Ignat
clarified that having reads inline is actually important) then I think it
best if you review Ignat's patch closely, rebase on it and test that it
meets your needs.

I'll wait for you to do this work so that I can get your feedback on
whether Ignat's changes look good for you too.  We have some time before
the 5.9 merge window opens, lets just keep the communication going and
make sure what we send upstream addresses everyone's needs and concerns.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

