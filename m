Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 20F9F1659C3
	for <lists+dm-devel@lfdr.de>; Thu, 20 Feb 2020 10:06:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582189591;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B118M9o/VFZVY+TY4Y6A9+Z47pI8ntyWf8FCKHK2B/4=;
	b=Ht1EBXZIqn9h3va2hRSTLqdofHtprFmEpumTPeDi+OCzYI5RmOKHLUUxe4bKDs+Muy+kGf
	yibEugYM1qRkzOEzkaVma91Iu1KN/N1vn5tv/JmHzpyu3IVQUeDWKeZ3n2wsgMJh4oOrkd
	29aoVqjwDbL6gcGIy6d51iAxLpQ2N8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-8Q45cZ6QNFODfA9VDMzXkA-1; Thu, 20 Feb 2020 04:06:28 -0500
X-MC-Unique: 8Q45cZ6QNFODfA9VDMzXkA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B47428018A1;
	Thu, 20 Feb 2020 09:06:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8027190784;
	Thu, 20 Feb 2020 09:06:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2DA28B2CC;
	Thu, 20 Feb 2020 09:06:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01D7tq3t018240 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 02:55:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DFAE017596; Thu, 13 Feb 2020 07:55:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB76F1C66C
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 07:55:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2132800299
	for <dm-devel@redhat.com>; Thu, 13 Feb 2020 07:55:49 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-124-lflPLRJANF2Df-ZyWxrs3w-1;
	Thu, 13 Feb 2020 02:55:46 -0500
Received: from [192.168.15.157] by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1j29Kw-0001bZ-Iv; Thu, 13 Feb 2020 10:55:02 +0300
To: axboe@kernel.dk
References: <158157930219.111879.12072477040351921368.stgit@localhost.localdomain>
From: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <e2b7cbab-d91f-fd7b-de6f-a671caa6f5eb@virtuozzo.com>
Date: Thu, 13 Feb 2020 10:55:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <158157930219.111879.12072477040351921368.stgit@localhost.localdomain>
Content-Language: en-US
X-MC-Unique: lflPLRJANF2Df-ZyWxrs3w-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01D7tq3t018240
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 20 Feb 2020 04:05:51 -0500
Cc: andrea.parri@amarulasolutions.com, snitzer@redhat.com, dhowells@redhat.com,
	song@kernel.org, dm-devel@redhat.com, adilger.kernel@dilger.ca,
	osandov@fb.com, agk@redhat.com, hare@suse.com,
	bvanassche@acm.org, darrick.wong@oracle.com, bob.liu@oracle.com,
	minwoo.im.dev@gmail.com, jthumshirn@suse.de, ajay.joshi@wdc.com,
	Chaitanya.Kulkarni@wdc.com, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dsterba@suse.com, sagi@grimberg.me,
	damien.lemoal@wdc.com, tytso@mit.edu, martin.petersen@oracle.com,
	linux-kernel@vger.kernel.org, tj@kernel.org, asml.silence@gmail.com
Subject: Re: [dm-devel] [PATCH v7 0/6] block: Introduce REQ_ALLOCATE flag
 for REQ_OP_WRITE_ZEROES
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

Hi, Jens,

could you please provide some comments on this? I sent v1 two months ago,
and it would be great to know your vision of the functionality and
the approach and whether it is going to go to block tree.

Thanks,
Kirill

On 13.02.2020 10:39, Kirill Tkhai wrote:
> (was "[PATCH block v2 0/3] block: Introduce REQ_NOZERO flag
>       for REQ_OP_WRITE_ZEROES operation";
>  was "[PATCH RFC 0/3] block,ext4: Introduce REQ_OP_ASSIGN_RANGE
>       to reflect extents allocation in block device internals")
> 
> v7: Two comments changed.
> 
> v6: req_op() cosmetic change.
> 
> v5: Kill dm|md patch, which disables REQ_ALLOCATE for these devices.
>     Disable REQ_ALLOCATE for all stacking devices instead of this.
> 
> v4: Correct argument for mddev_check_write_zeroes().
> 
> v3: Rename REQ_NOZERO to REQ_ALLOCATE.
>     Split helpers to separate patches.
>     Add a patch, disabling max_allocate_sectors inheritance for dm.
> 
> v2: Introduce new flag for REQ_OP_WRITE_ZEROES instead of
>     introduction a new operation as suggested by Martin K. Petersen.
>     Removed ext4-related patch to focus on block changes
>     for now.
> 
> Information about continuous extent placement may be useful
> for some block devices. Say, distributed network filesystems,
> which provide block device interface, may use this information
> for better blocks placement over the nodes in their cluster,
> and for better performance. Block devices, which map a file
> on another filesystem (loop), may request the same length extent
> on underlining filesystem for less fragmentation and for batching
> allocation requests. Also, hypervisors like QEMU may use this
> information for optimization of cluster allocations.
> 
> This patchset introduces REQ_ALLOCATE flag for REQ_OP_WRITE_ZEROES,
> which makes a block device to allocate blocks instead of actual
> blocks zeroing. This may be used for forwarding user's fallocate(0)
> requests into block device internals. E.g., in loop driver this
> will result in allocation extents in backing-file, so subsequent
> write won't fail by the reason of no available space. Distributed
> network filesystems will be able to assign specific servers for
> specific extents, so subsequent write will be more efficient.
> 
> Patches [1-3/6] are preparation on helper functions, patch [4/6]
> introduces REQ_ALLOCATE flag and implements all the logic,
> patch [5/6] adds one more helper, patch [6/6] adds loop
> as the first user of the flag.
> 
> Note, that here is only block-related patches, example of usage
> for ext4 with a performance numbers may be seen in [1].
> 
> [1] https://lore.kernel.org/linux-ext4/157599697369.12112.10138136904533871162.stgit@localhost.localdomain/T/#me5bdd5cc313e14de615d81bea214f355ae975db0
> ---
> 
> Kirill Tkhai (6):
>       block: Add @flags argument to bdev_write_zeroes_sectors()
>       block: Pass op_flags into blk_queue_get_max_sectors()
>       block: Introduce blk_queue_get_max_write_zeroes_sectors()
>       block: Add support for REQ_ALLOCATE flag
>       block: Add blk_queue_max_allocate_sectors()
>       loop: Add support for REQ_ALLOCATE
> 
> 
>  block/blk-core.c                    |    6 +++---
>  block/blk-lib.c                     |   17 ++++++++++-------
>  block/blk-merge.c                   |    9 ++++++---
>  block/blk-settings.c                |   17 +++++++++++++++++
>  drivers/block/loop.c                |   20 +++++++++++++-------
>  drivers/md/dm-kcopyd.c              |    2 +-
>  drivers/target/target_core_iblock.c |    4 ++--
>  fs/block_dev.c                      |    4 ++++
>  include/linux/blk_types.h           |    6 ++++++
>  include/linux/blkdev.h              |   34 ++++++++++++++++++++++++++--------
>  10 files changed, 88 insertions(+), 31 deletions(-)
> 
> --
> Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> Reviewed-by: Bob Liu <bob.liu@oracle.com>
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

