Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 75E8A3F4510
	for <lists+dm-devel@lfdr.de>; Mon, 23 Aug 2021 08:40:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-A9pcxsc8NpWL2E3WTz_woQ-1; Mon, 23 Aug 2021 02:40:29 -0400
X-MC-Unique: A9pcxsc8NpWL2E3WTz_woQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE6B8802C89;
	Mon, 23 Aug 2021 06:40:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B116118432;
	Mon, 23 Aug 2021 06:40:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 449C2181A0F8;
	Mon, 23 Aug 2021 06:40:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17IFet1q017684 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 18 Aug 2021 11:40:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0B3221677EC; Wed, 18 Aug 2021 15:40:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59BB221677F1
	for <dm-devel@redhat.com>; Wed, 18 Aug 2021 15:40:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C3C9800182
	for <dm-devel@redhat.com>; Wed, 18 Aug 2021 15:40:48 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-576-QLKSGvn1Mx-FmuiIEhHdYA-1; Wed, 18 Aug 2021 11:40:44 -0400
X-MC-Unique: QLKSGvn1Mx-FmuiIEhHdYA-1
Received: by mail-lf1-f54.google.com with SMTP id x27so5560575lfu.5;
	Wed, 18 Aug 2021 08:40:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AtAhgc/cdtdzOpUDiq7xYnKI2s3eNwZmdV1LdaG9ySo=;
	b=o6hDRYLMPJymMVaS6SYLj9ziswhnCtZwREaLTpD5laHHj2tVLAbVH2dpbYCelBatrf
	+P/1APvz0GDoMPE7W5bD4HF6TPe6x0tre4NSzY9PrIXV+OVEiQvrOhCPlV0QyX4kR02f
	PG7gEe0/dlyW/xVPm6Ak8/i3LVuPCJJILCtbyX20q1Hc3i/nZ3gM72YeCBRTjcYETrk/
	JmoG5zDWQqwtfcDCARUElfINlkinu72IGTlzYiI7Bo09/Yt5x9M/RIUlLxk1Pbq5mfX4
	MRM3diKG9bkXcBimpdujpWmi8iR7WA1//MTnB6Ap3oIBNPfYX8y/kf0rFeE7zarFwHuH
	RYjg==
X-Gm-Message-State: AOAM533k1YJ/nLhwLxuPri0R2Ww9KJkDNYIwOZbxOEuXg/DVPlz2tJlr
	IPuwIKJSiPeElSGeNDEBJh57fRSy00hO5F2m6WE=
X-Google-Smtp-Source: ABdhPJxdbKKZ7HzWf73HynFAAtUBdYY23NO4eYcF1dkerR0DWdHpzlIlPrMdLWA5PYdjRCSguNfZNXVeUUh1TMNdro0=
X-Received: by 2002:a05:6512:1283:: with SMTP id
	u3mr7005906lfs.390.1629301242041; 
	Wed, 18 Aug 2021 08:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210817101741epcas5p174ca0a539587da6a67b9f58cd13f2bad@epcas5p1.samsung.com>
	<20210817101423.12367-1-selvakuma.s1@samsung.com>
	<20210817233758.GB12597@magnolia>
In-Reply-To: <20210817233758.GB12597@magnolia>
From: Nitesh Shetty <nitheshshetty@gmail.com>
Date: Wed, 18 Aug 2021 21:10:29 +0530
Message-ID: <CAOSviJ0qbkg9WPtmxuvf6HAgQ9sBYWVRGisGRgwed77uK86byg@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Aug 2021 02:39:55 -0400
Cc: snitzer@redhat.com, linux-nvme@lists.infradead.org, dm-devel@redhat.com,
	hch@lst.de, agk@redhat.com, bvanassche@acm.org,
	linux-scsi@vger.kernel.org, willy@infradead.org,
	nj.shetty@samsung.com, kch@kernel.org,
	SelvaKumar S <selvakuma.s1@samsung.com>, selvajove@gmail.com,
	linux-block@vger.kernel.org, mpatocka@redhat.com,
	javier.gonz@samsung.com, kbusch@kernel.org, axboe@kernel.dk,
	damien.lemoal@wdc.com, joshi.k@samsung.com,
	martin.petersen@oracle.com, linux-api@vger.kernel.org,
	johannes.thumshirn@wdc.com, linux-fsdevel@vger.kernel.org,
	joshiiitr@gmail.com, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH 0/7] add simple copy support
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 18, 2021 at 5:07 AM Darrick J. Wong <djwong@kernel.org> wrote:
>
> On Tue, Aug 17, 2021 at 03:44:16PM +0530, SelvaKumar S wrote:
> > This started out as an attempt to support NVMe Simple Copy Command (SCC),
> > and evolved during the RFC review process.
> >
> > The patchset, at this point, contains -
> > 1. SCC support in NVMe driver
> > 2. Block-layer infra for copy-offload operation
> > 3. ioctl interface to user-space
> > 4. copy-emulation infra in the block-layer
> > 5. copy-offload plumbing to dm-kcopyd (thus creating couple of in-kernel
> >       users such as dm-clone)
> >
> >
> > The SCC specification, i.e. TP4065a can be found in following link
> >
> > https://nvmexpress.org/wp-content/uploads/NVM-Express-1.4-Ratified-TPs.zip
> >
> > Simple copy is a copy offloading feature and can be used to copy multiple
> > contiguous ranges (source_ranges) of LBA's to a single destination LBA
> > within the device, reducing traffic between host and device.
> >
> > We define a block ioctl for copy and copy payload format similar to
> > discard. For device supporting native simple copy, we attach the control
> > information as payload to the bio and submit to the device. Copy emulation
> > is implemented incase underlaying device does not support copy offload or
> > based on sysfs choice. Copy emulation is done by reading each source range
> > into buffer and writing it to the destination.
>
> Seems useful.  Would you mind adapting the loop driver to call
> copy_file_range (for files) so that anyone interested in making a
> filesystem use this capability (cough) can write fstests?

We are planning to look into copy_file_range plumbing after settling
on the current series,
 which already became heavyweight for the first drop.

Nitesh Shetty
>
> --D
>
> > At present this implementation does not support copy offload for stacked/dm
> > devices, rather copy operation is completed through emulation.
> >
> > One of the in-kernel use case for copy-offload is implemented by this
> > patchset. dm-kcopyd infra has been changed to leverage the copy-offload if
> > it is natively available. Other future use-cases could be F2FS GC, BTRFS
> > relocation/balance and copy_file_range.
> >
> > Following limits are added to queue limits and are exposed via sysfs to
> > userspace, which user can use to form a payload.
> >
> >  - copy_offload:
> >       configurable, can be used set emulation or copy offload
> >               0 to disable copy offload,
> >               1 to enable copy offloading support. Offload can be only
> >                       enabled, if underlaying device supports offload
> >
> >  - max_copy_sectors:
> >       total copy length supported by copy offload feature in device.
> >       0 indicates copy offload is not supported.
> >
> >  - max_copy_nr_ranges:
> >       maximum number of source range entries supported by copy offload
> >                       feature in device
> >
> >  - max_copy_range_sectors:
> >       maximum copy length per source range entry
> >
> > *blkdev_issue_copy* takes source bdev, no of sources, array of source
> > ranges (in sectors), destination bdev and destination offset(in sectors).
> > If both source and destination block devices are same and queue parameter
> > copy_offload is 1, then copy is done through native copy offloading.
> > Copy emulation is used in otherwise.
> >
> > Changes from  RFC v5
> >
> > 1. Handle copy larger than maximum copy limits
> > 2. Create copy context and submit copy offload asynchronously
> > 3. Remove BLKDEV_COPY_NOEMULATION opt-in option of copy offload and
> > check for copy support before submission from dm and other layers
> > 4. Allocate maximum possible allocatable buffer for copy emulation
> > rather failing very large copy offload.
> > 5. Fix copy_offload sysfs to be either have 0 or 1
> >
> > Changes from RFC v4
> >
> > 1. Extend dm-kcopyd to leverage copy-offload, while copying within the
> > same device. The other approach was to have copy-emulation by moving
> > dm-kcopyd to block layer. But it also required moving core dm-io infra,
> > causing a massive churn across multiple dm-targets.
> > 2. Remove export in bio_map_kern()
> > 3. Change copy_offload sysfs to accept 0 or else
> > 4. Rename copy support flag to QUEUE_FLAG_SIMPLE_COPY
> > 5. Rename payload entries, add source bdev field to be used while
> > partition remapping, remove copy_size
> > 6. Change the blkdev_issue_copy() interface to accept destination and
> > source values in sector rather in bytes
> > 7. Add payload to bio using bio_map_kern() for copy_offload case
> > 8. Add check to return error if one of the source range length is 0
> > 9. Add BLKDEV_COPY_NOEMULATION flag to allow user to not try copy
> > emulation incase of copy offload is not supported. Caller can his use
> > his existing copying logic to complete the io.
> > 10. Bug fix copy checks and reduce size of rcu_lock()
> >
> > Changes from RFC v3
> >
> > 1. gfp_flag fixes.
> > 2. Export bio_map_kern() and use it to allocate and add pages to bio.
> > 3. Move copy offload, reading to buf, writing from buf to separate functions
> > 4. Send read bio of copy offload by chaining them and submit asynchronously
> > 5. Add gendisk->part0 and part->bd_start_sect changes to blk_check_copy().
> > 6. Move single source range limit check to blk_check_copy()
> > 7. Rename __blkdev_issue_copy() to blkdev_issue_copy and remove old helper.
> > 8. Change blkdev_issue_copy() interface generic to accepts destination bdev
> >         to support XCOPY as well.
> > 9. Add invalidate_kernel_vmap_range() after reading data for vmalloc'ed memory.
> > 10. Fix buf allocoation logic to allocate buffer for the total size of copy.
> > 11. Reword patch commit description.
> >
> > Changes from RFC v2
> >
> > 1. Add emulation support for devices not supporting copy.
> > 2. Add *copy_offload* sysfs entry to enable and disable copy_offload
> >         in devices supporting simple copy.
> > 3. Remove simple copy support for stacked devices.
> >
> > Changes from RFC v1:
> >
> > 1. Fix memory leak in __blkdev_issue_copy
> > 2. Unmark blk_check_copy inline
> > 3. Fix line break in blk_check_copy_eod
> > 4. Remove p checks and made code more readable
> > 5. Don't use bio_set_op_attrs and remove op and set
> >    bi_opf directly
> > 6. Use struct_size to calculate total_size
> > 7. Fix partition remap of copy destination
> > 8. Remove mcl,mssrl,msrc from nvme_ns
> > 9. Initialize copy queue limits to 0 in nvme_config_copy
> > 10. Remove return in QUEUE_FLAG_COPY check
> > 11. Remove unused OCFS
> >
> >
> > Nitesh Shetty (4):
> >   block: Introduce queue limits for copy-offload support
> >   block: copy offload support infrastructure
> >   block: Introduce a new ioctl for simple copy
> >   block: add emulation for simple copy
> >
> > SelvaKumar S (3):
> >   block: make bio_map_kern() non static
> >   nvme: add simple copy support
> >   dm kcopyd: add simple copy offload support
> >
> >  block/blk-core.c          |  84 ++++++++-
> >  block/blk-lib.c           | 352 ++++++++++++++++++++++++++++++++++++++
> >  block/blk-map.c           |   2 +-
> >  block/blk-settings.c      |   4 +
> >  block/blk-sysfs.c         |  51 ++++++
> >  block/blk-zoned.c         |   1 +
> >  block/bounce.c            |   1 +
> >  block/ioctl.c             |  33 ++++
> >  drivers/md/dm-kcopyd.c    |  56 +++++-
> >  drivers/nvme/host/core.c  |  83 +++++++++
> >  drivers/nvme/host/trace.c |  19 ++
> >  include/linux/bio.h       |   1 +
> >  include/linux/blk_types.h |  20 +++
> >  include/linux/blkdev.h    |  21 +++
> >  include/linux/nvme.h      |  43 ++++-
> >  include/uapi/linux/fs.h   |  20 +++
> >  16 files changed, 775 insertions(+), 16 deletions(-)
> >
> > --
> > 2.25.1
> >

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

