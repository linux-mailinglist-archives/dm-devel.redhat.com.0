Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2D32626D7D1
	for <lists+dm-devel@lfdr.de>; Thu, 17 Sep 2020 11:37:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-IWpvR17UMvS3SDpQFshUOA-1; Thu, 17 Sep 2020 05:37:39 -0400
X-MC-Unique: IWpvR17UMvS3SDpQFshUOA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F80918CBC73;
	Thu, 17 Sep 2020 09:37:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1D4D74E33;
	Thu, 17 Sep 2020 09:37:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 18AC98C7CD;
	Thu, 17 Sep 2020 09:37:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08H9b7YE012313 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Sep 2020 05:37:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D71C311753E7; Thu, 17 Sep 2020 09:37:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D263C11753E6
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 09:37:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A34A1869B94
	for <dm-devel@redhat.com>; Thu, 17 Sep 2020 09:37:01 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-79-jmbnOUM6MkqS8C5ueGndiQ-1;
	Thu, 17 Sep 2020 05:36:57 -0400
X-MC-Unique: jmbnOUM6MkqS8C5ueGndiQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 87C08AC61;
	Thu, 17 Sep 2020 09:37:29 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 554E71E12E1; Thu, 17 Sep 2020 11:36:55 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:36:55 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200917093655.GG7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-8-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200910144833.742260-8-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, cgroups@vger.kernel.org,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-mm@kvack.org
Subject: Re: [dm-devel] [PATCH 07/12] bdi: remove BDI_CAP_CGROUP_WRITEBACK
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu 10-09-20 16:48:27, Christoph Hellwig wrote:
> Just checking SB_I_CGROUPWB for cgroup writeback support is enough.
> Either the file system allocates its own bdi (e.g. btrfs), in which case
> it is known to support cgroup writeback, or the bdi comes from the block
> layer, which always supports cgroup writeback.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Makes sense. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  block/blk-core.c            | 1 -
>  fs/btrfs/disk-io.c          | 1 -
>  include/linux/backing-dev.h | 8 +++-----
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 18c092f8d69175..d81ee511ec8b01 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -538,7 +538,6 @@ struct request_queue *blk_alloc_queue(int node_id)
>  	if (!q->stats)
>  		goto fail_stats;
>  
> -	q->backing_dev_info->capabilities = BDI_CAP_CGROUP_WRITEBACK;
>  	q->node = node_id;
>  
>  	atomic_set(&q->nr_active_requests_shared_sbitmap, 0);
> diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
> index 047934cea25efa..e24927bddd5829 100644
> --- a/fs/btrfs/disk-io.c
> +++ b/fs/btrfs/disk-io.c
> @@ -3091,7 +3091,6 @@ int __cold open_ctree(struct super_block *sb, struct btrfs_fs_devices *fs_device
>  		goto fail_sb_buffer;
>  	}
>  
> -	sb->s_bdi->capabilities |= BDI_CAP_CGROUP_WRITEBACK;
>  	sb->s_bdi->ra_pages *= btrfs_super_num_devices(disk_super);
>  	sb->s_bdi->ra_pages = max(sb->s_bdi->ra_pages, SZ_4M / PAGE_SIZE);
>  
> diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
> index 0b06b2d26c9aa3..52583b6f2ea05d 100644
> --- a/include/linux/backing-dev.h
> +++ b/include/linux/backing-dev.h
> @@ -123,7 +123,6 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
>   * BDI_CAP_NO_ACCT_WB:     Don't automatically account writeback pages
>   * BDI_CAP_STRICTLIMIT:    Keep number of dirty pages below bdi threshold.
>   *
> - * BDI_CAP_CGROUP_WRITEBACK: Supports cgroup-aware writeback.
>   * BDI_CAP_SYNCHRONOUS_IO: Device is so fast that asynchronous IO would be
>   *			   inefficient.
>   */
> @@ -233,9 +232,9 @@ int inode_congested(struct inode *inode, int cong_bits);
>   * inode_cgwb_enabled - test whether cgroup writeback is enabled on an inode
>   * @inode: inode of interest
>   *
> - * cgroup writeback requires support from both the bdi and filesystem.
> - * Also, both memcg and iocg have to be on the default hierarchy.  Test
> - * whether all conditions are met.
> + * Cgroup writeback requires support from the filesystem.  Also, both memcg and
> + * iocg have to be on the default hierarchy.  Test whether all conditions are
> + * met.
>   *
>   * Note that the test result may change dynamically on the same inode
>   * depending on how memcg and iocg are configured.
> @@ -247,7 +246,6 @@ static inline bool inode_cgwb_enabled(struct inode *inode)
>  	return cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
>  		cgroup_subsys_on_dfl(io_cgrp_subsys) &&
>  		bdi_cap_account_dirty(bdi) &&
> -		(bdi->capabilities & BDI_CAP_CGROUP_WRITEBACK) &&
>  		(inode->i_sb->s_iflags & SB_I_CGROUPWB);
>  }
>  
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

