Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 76F33321265
	for <lists+dm-devel@lfdr.de>; Mon, 22 Feb 2021 09:54:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-6oSze905N9yQkoOB_HctRw-1; Mon, 22 Feb 2021 03:54:33 -0500
X-MC-Unique: 6oSze905N9yQkoOB_HctRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A818107ACED;
	Mon, 22 Feb 2021 08:54:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D77935D9CC;
	Mon, 22 Feb 2021 08:54:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9006858075;
	Mon, 22 Feb 2021 08:54:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11M70Hpf017020 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 22 Feb 2021 02:00:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 62F92112D425; Mon, 22 Feb 2021 07:00:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E960112D421
	for <dm-devel@redhat.com>; Mon, 22 Feb 2021 07:00:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D8E0100AFE0
	for <dm-devel@redhat.com>; Mon, 22 Feb 2021 07:00:14 +0000 (UTC)
Received: from eu-shark1.inbox.eu (eu-shark1.inbox.eu [195.216.236.81])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-299-4JMq4niLNuOSh0ouFhe4cg-1; Mon, 22 Feb 2021 02:00:09 -0500
X-MC-Unique: 4JMq4niLNuOSh0ouFhe4cg-1
Received: from eu-shark1.inbox.eu (localhost [127.0.0.1])
	by eu-shark1-out.inbox.eu (Postfix) with ESMTP id B93736C00691;
	Mon, 22 Feb 2021 08:52:59 +0200 (EET)
Received: from localhost (localhost [127.0.0.1])
	by eu-shark1-in.inbox.eu (Postfix) with ESMTP id A5BED6C00661;
	Mon, 22 Feb 2021 08:52:59 +0200 (EET)
Received: from eu-shark1.inbox.eu ([127.0.0.1])
	by localhost (eu-shark1.inbox.eu [127.0.0.1]) (spamfilter, port 35)
	with ESMTP id bUrlneumwWrc; Mon, 22 Feb 2021 08:52:59 +0200 (EET)
Received: from mail.inbox.eu (eu-pop1 [127.0.0.1])
	by eu-shark1-in.inbox.eu (Postfix) with ESMTP id 01BEE6C00606;
	Mon, 22 Feb 2021 08:52:59 +0200 (EET)
Received: from nas (unknown [45.87.95.231])
	(Authenticated sender: l@damenly.su)
	by mail.inbox.eu (Postfix) with ESMTPA id 8C41F1BE00B1;
	Mon, 22 Feb 2021 08:52:50 +0200 (EET)
References: <CGME20210219124555epcas5p1334e7c4d64ada5dc4a2ca0feb48c1d44@epcas5p1.samsung.com>
	<20210219124517.79359-1-selvakuma.s1@samsung.com>
User-agent: mu4e 1.4.13; emacs 27.1
From: Su Yue <l@damenly.su>
To: SelvaKumar S <selvakuma.s1@samsung.com>
In-reply-to: <20210219124517.79359-1-selvakuma.s1@samsung.com>
Message-ID: <lfbgr3ur.fsf@damenly.su>
Date: Mon, 22 Feb 2021 14:52:44 +0800
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: 6NpmlYxOGzysiV+lRWe8dgs2pzY6IuClpKemo25U5hvmSE6Jek0TWBeplGloT3+5og==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 22 Feb 2021 03:49:50 -0500
Cc: axboe@kernel.dk, damien.lemoal@wdc.com, kch@kernel.org, sagi@grimberg.me,
	snitzer@redhat.com, selvajove@gmail.com,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	nj.shetty@samsung.com, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	joshi.k@samsung.com, javier.gonz@samsung.com, kbusch@kernel.org,
	joshiiitr@gmail.com, hch@lst.de
Subject: Re: [dm-devel] [RFC PATCH v5 0/4] add simple copy support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On Fri 19 Feb 2021 at 20:45, SelvaKumar S 
<selvakuma.s1@samsung.com> wrote:

> This patchset tries to add support for TP4065a ("Simple Copy 
> Command"),
> v2020.05.04 ("Ratified")
>
> The Specification can be found in following link.
> https://nvmexpress.org/wp-content/uploads/NVM-Express-1.4-Ratified-TPs-1.zip
>

404 not found.
Should it be
https://nvmexpress.org/wp-content/uploads/NVM-Express-1.4-Ratified-TPs.zip
?

> Simple copy command is a copy offloading operation and is  used 
> to copy
> multiple contiguous ranges (source_ranges) of LBA's to a single 
> destination
> LBA within the device reducing traffic between host and device.
>
> This implementation doesn't add native copy offload support for 
> stacked
> devices rather copy offload is done through emulation. Possible 
> use
> cases are F2FS gc and BTRFS relocation/balance.
>
> *blkdev_issue_copy* takes source bdev, no of sources, array of 
> source
> ranges (in sectors), destination bdev and destination offset(in 
> sectors).
> If both source and destination block devices are same and 
> copy_offload = 1,
> then copy is done through native copy offloading. Copy emulation 
> is used
> in other cases.
>
> As SCSI XCOPY can take two different block devices and no of 
> source range is
> equal to 1, this interface can be extended in future to support 
> SCSI XCOPY.
>
> For devices supporting native simple copy, attach the control 
> information
> as payload to the bio and submit to the device. For devices 
> without native
> copy support, copy emulation is done by reading each source 
> range into memory
> and writing it to the destination. Caller can choose not to try
> emulation if copy offload is not supported by setting
> BLKDEV_COPY_NOEMULATION flag.
>
> Following limits are added to queue limits and are exposed in 
> sysfs
> to userspace
> 	- *copy_offload* controls copy_offload. set 0 to disable copy
> 		offload, 1 to enable native copy offloading support.
> 	- *max_copy_sectors* limits the sum of all source_range length
> 	- *max_copy_nr_ranges* limits the number of source ranges
> 	- *max_copy_range_sectors* limit the maximum number of sectors
> 		that can constitute a single source range.
>
> 	max_copy_sectors = 0 indicates the device doesn't support copy
> offloading.
>
> 	*copy offload* sysfs entry is configurable and can be used 
> toggle
> between emulation and native support depending upon the usecase.
>
> Changes from v4
>
> 1. Extend dm-kcopyd to leverage copy-offload, while copying 
> within the
> same device. The other approach was to have copy-emulation by 
> moving
> dm-kcopyd to block layer. But it also required moving core dm-io 
> infra,
> causing a massive churn across multiple dm-targets.
>
> 2. Remove export in bio_map_kern()
> 3. Change copy_offload sysfs to accept 0 or else
> 4. Rename copy support flag to QUEUE_FLAG_SIMPLE_COPY
> 5. Rename payload entries, add source bdev field to be used 
> while
> partition remapping, remove copy_size
> 6. Change the blkdev_issue_copy() interface to accept 
> destination and
> source values in sector rather in bytes
> 7. Add payload to bio using bio_map_kern() for copy_offload case
> 8. Add check to return error if one of the source range length 
> is 0
> 9. Add BLKDEV_COPY_NOEMULATION flag to allow user to not try 
> copy
> emulation incase of copy offload is not supported. Caller can 
> his use
> his existing copying logic to complete the io.
> 10. Bug fix copy checks and reduce size of rcu_lock()
>
> Planned for next:
> - adding blktests
> - handling larger (than device limits) copy
> - decide on ioctl interface (man-page etc.)
>
> Changes from v3
>
> 1. gfp_flag fixes.
> 2. Export bio_map_kern() and use it to allocate and add pages to 
> bio.
> 3. Move copy offload, reading to buf, writing from buf to 
> separate functions.
> 4. Send read bio of copy offload by chaining them and submit 
> asynchronously.
> 5. Add gendisk->part0 and part->bd_start_sect changes to 
> blk_check_copy().
> 6. Move single source range limit check to blk_check_copy()
> 7. Rename __blkdev_issue_copy() to blkdev_issue_copy and remove 
> old helper.
> 8. Change blkdev_issue_copy() interface generic to accepts 
> destination bdev
> 	to support XCOPY as well.
> 9. Add invalidate_kernel_vmap_range() after reading data for 
> vmalloc'ed memory.
> 10. Fix buf allocoation logic to allocate buffer for the total 
> size of copy.
> 11. Reword patch commit description.
>
> Changes from v2
>
> 1. Add emulation support for devices not supporting copy.
> 2. Add *copy_offload* sysfs entry to enable and disable 
> copy_offload
> 	in devices supporting simple copy.
> 3. Remove simple copy support for stacked devices.
>
> Changes from v1:
>
> 1. Fix memory leak in __blkdev_issue_copy
> 2. Unmark blk_check_copy inline
> 3. Fix line break in blk_check_copy_eod
> 4. Remove p checks and made code more readable
> 5. Don't use bio_set_op_attrs and remove op and set
>    bi_opf directly
> 6. Use struct_size to calculate total_size
> 7. Fix partition remap of copy destination
> 8. Remove mcl,mssrl,msrc from nvme_ns
> 9. Initialize copy queue limits to 0 in nvme_config_copy
> 10. Remove return in QUEUE_FLAG_COPY check
> 11. Remove unused OCFS
>
> SelvaKumar S (4):
>   block: make bio_map_kern() non static
>   block: add simple copy support
>   nvme: add simple copy support
>   dm kcopyd: add simple copy offload support
>
>  block/blk-core.c          | 102 +++++++++++++++--
>  block/blk-lib.c           | 223 
>  ++++++++++++++++++++++++++++++++++++++
>  block/blk-map.c           |   2 +-
>  block/blk-merge.c         |   2 +
>  block/blk-settings.c      |  10 ++
>  block/blk-sysfs.c         |  47 ++++++++
>  block/blk-zoned.c         |   1 +
>  block/bounce.c            |   1 +
>  block/ioctl.c             |  33 ++++++
>  drivers/md/dm-kcopyd.c    |  49 ++++++++-
>  drivers/nvme/host/core.c  |  87 +++++++++++++++
>  include/linux/bio.h       |   1 +
>  include/linux/blk_types.h |  14 +++
>  include/linux/blkdev.h    |  17 +++
>  include/linux/nvme.h      |  43 +++++++-
>  include/uapi/linux/fs.h   |  13 +++
>  16 files changed, 627 insertions(+), 18 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

