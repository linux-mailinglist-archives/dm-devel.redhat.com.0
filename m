Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 05B4F1CFB4B
	for <lists+dm-devel@lfdr.de>; Tue, 12 May 2020 18:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589302181;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Wr7WIthKNt1TUTD1SAeu3erOa1dq8SP574DH5b3KA7E=;
	b=MAJZojYNh7GRTaBjdIpQANiIJRHuLBBrTvnRLsingoyzYXjXi4eKQbZBTV8h+0USPuCh1/
	sS4oSRO5YuynMNwLIeHaZOPEQR/JfUkaG/QkwbnxlkKiDsZ9+EqISARMqyLAsAqAp26mYq
	cxPNk2gcv/ZBJOyjuL8ICTmvOvAU9HI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-ZbuiVjWSPjGHCGXJj2pXeg-1; Tue, 12 May 2020 12:49:39 -0400
X-MC-Unique: ZbuiVjWSPjGHCGXJj2pXeg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D29E880B725;
	Tue, 12 May 2020 16:49:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42C961D4;
	Tue, 12 May 2020 16:49:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F8B24CAA0;
	Tue, 12 May 2020 16:49:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04CGn5UW031306 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 12 May 2020 12:49:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3FAC638F; Tue, 12 May 2020 16:49:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A291196AE;
	Tue, 12 May 2020 16:49:02 +0000 (UTC)
Date: Tue, 12 May 2020 12:49:01 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200512164900.GA13898@redhat.com>
References: <20200508090332.40716-1-hare@suse.de>
	<BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<1e68571f-0205-93c8-e535-a472c1a7b5d8@suse.de>
MIME-Version: 1.0
In-Reply-To: <1e68571f-0205-93c8-e535-a472c1a7b5d8@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCHv5 00/14] dm-zoned: metadata version 2
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

On Mon, May 11 2020 at  2:31am -0400,
Hannes Reinecke <hare@suse.de> wrote:

> On 5/11/20 4:46 AM, Damien Le Moal wrote:
> >On 2020/05/08 18:03, Hannes Reinecke wrote:
> >>Hi all,
> >>
> >>this patchset adds a new metadata version 2 for dm-zoned, which brings the
> >>following improvements:
> >>
> >>- UUIDs and labels: Adding three more fields to the metadata containing
> >>   the dm-zoned device UUID and label, and the device UUID. This allows
> >>   for an unique identification of the devices, so that several dm-zoned
> >>   sets can coexist and have a persistent identification.
> >>- Extend random zones by an additional regular disk device: A regular
> >>   block device can be added together with the zoned block device, providing
> >>   additional (emulated) random write zones. With this it's possible to
> >>   handle sequential zones only devices; also there will be a speed-up if
> >>   the regular block device resides on a fast medium. The regular block device
> >>   is placed logically in front of the zoned block device, so that metadata
> >>   and mapping tables reside on the regular block device, not the zoned device.
> >>- Tertiary superblock support: In addition to the two existing sets of metadata
> >>   another, tertiary, superblock is written to the first block of the zoned
> >>   block device. This superblock is for identification only; the generation
> >>   number is set to '0' and the block itself it never updated. The addition
> >>   metadate like bitmap tables etc are not copied.
> >>
> >>To handle this, some changes to the original handling are introduced:
> >>- Zones are now equidistant. Originally, runt zones were ignored, and
> >>   not counted when sizing the mapping tables. With the dual device setup
> >>   runt zones might occur at the end of the regular block device, making
> >>   direct translation between zone number and sector/block number complex.
> >>   For metadata version 2 all zones are considered to be of the same size,
> >>   and runt zones are simply marked as 'offline' to have them ignored when
> >>   allocating a new zone.
> >>- The block number in the superblock is now the global number, and refers to
> >>   the location of the superblock relative to the resulting device-mapper
> >>   device. Which means that the tertiary superblock contains absolute block
> >>   addresses, which needs to be translated to the relative device addresses
> >>   to find the referenced block.
> >>
> >>There is an accompanying patchset for dm-zoned-tools for writing and checking
> >>this new metadata.
> >>
> >>As usual, comments and reviews are welcome.
> >
> >I gave this series a good round of testing. See the attached picture for the
> >results. The test is this:
> >1) Setup dm-zoned
> >2) Format and mount with mkfs.ext4 -E packed_meta_blocks=1 /dev/mapper/xxx
> >3) Create file random in size between 1 and 4MB and measure user seen throughput
> >over 100 files.
> >3) Run that for 2 hours
> >
> >I ran this over a 15TB SMR drive single drive setup, and on the same drive + a
> >500GB m.2 ssd added.
> >
> >For the single drive case, the usual 3 phases can be seen: start writing at
> >about 110MB/s, everything going to conventional zones (note conv zones are in
> >the middle of the disk, hence the low-ish throughput). Then after about 400s,
> >reclaim kicks in and the throughput drops to 60-70 MB/s. As reclaim cannot keep
> >up under this heavy write workload, performance drops to 20-30MB/s after 800s.
> >All good, without any idle time for reclaim to do its job, this is all expected.
> >
> >For the dual drive case, things are more interesting:
> >1) The first phase is longer as overall, there is more conventional space (500G
> >ssd + 400G on SMR drive). So we see the SSD speed first (~425MB/s), then the
> >drive speed (100 MB/s), slightly lower than the single drive case toward the end
> >as reclaim triggers.
> >2) Some recovery back to ssd speed, then a long phase at half the speed of the
> >ssd as writes go to ssd and reclaim is running moving data out of the ssd onto
> >the disk.
> >3) Then a long phase at 25MB/s due to SMR disk reclaim.
> >4) back up to half the ssd speed.
> >
> >No crashes, no data corruption, all good. But is does look like we can improve
> >on performance further by preventing using the drive conventional zones as
> >"buffer" zones. If we let those be the final resting place of data, the SMR disk
> >only reclaim would not kick in and hurt performance as seen here. That I think
> >can all be done on top of this series though. Let's get this in first.
> >
> Thanks for the data! That indeed is very interesting; guess I'll do
> some tests here on my setup, too.
> (And hope it doesn't burn my NVDIMM ...)
> 
> But, guess what, I had the some thoughts; we should be treating the
> random zones more like sequential zones in a two-disk setup.
> So guess I'll be resurrecting the idea from my very first patch and
> implement 'cache' zones in addition to the existing 'random' and
> 'sequential' zones.
> But, as you said, that'll be a next series of patches.

FYI, I staged the series in linux-next (for 5.8) yesterday, see:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/log/?h=dm-5.8

So please base any follow-on fixes or advances on this baseline.

Thanks!
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

