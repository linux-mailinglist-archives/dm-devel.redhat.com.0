Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B9B08273DBC
	for <lists+dm-devel@lfdr.de>; Tue, 22 Sep 2020 10:50:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-e8l8mQ-MN5msH-OEdkOZwA-1; Tue, 22 Sep 2020 04:50:19 -0400
X-MC-Unique: e8l8mQ-MN5msH-OEdkOZwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43B131006705;
	Tue, 22 Sep 2020 08:50:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DA7A614F5;
	Tue, 22 Sep 2020 08:50:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 85C531826D2C;
	Tue, 22 Sep 2020 08:50:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08M8o1qf024842 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 22 Sep 2020 04:50:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA6DBB27AE; Tue, 22 Sep 2020 08:50:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B32B7B27A5
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 08:49:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52970185A78B
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 08:49:59 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-591-VAwvphavOoe5elOC_DshKA-1;
	Tue, 22 Sep 2020 04:49:56 -0400
X-MC-Unique: VAwvphavOoe5elOC_DshKA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 01CA2AF16;
	Tue, 22 Sep 2020 08:50:32 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id EA6C01E12E3; Tue, 22 Sep 2020 10:49:54 +0200 (CEST)
Date: Tue, 22 Sep 2020 10:49:54 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200922084954.GC16464@quack2.suse.cz>
References: <20200921080734.452759-1-hch@lst.de>
	<20200921080734.452759-6-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200921080734.452759-6-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Justin Sanders <justin@coraid.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>, cgroups@vger.kernel.org,
	linux-bcache@vger.kernel.org, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	drbd-dev@tron.linbit.com, linux-fsdevel@vger.kernel.org,
	David Sterba <dsterba@suse.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 05/13] bdi: initialize ->ra_pages and
 ->io_pages in bdi_init
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

On Mon 21-09-20 10:07:26, Christoph Hellwig wrote:
> Set up a readahead size by default, as very few users have a good
> reason to change it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: David Sterba <dsterba@suse.com> [btrfs]
> Acked-by: Richard Weinberger <richard@nod.at> [ubifs, mtd]

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

I'd just prefer if the changelog explicitely mentioned that this patch
results in enabling readahead for coda, ecryptfs, and orangefs... Just in
case someone bisects some issue down to this patch :).

								Honza

> ---
>  block/blk-core.c      | 2 --
>  drivers/mtd/mtdcore.c | 2 ++
>  fs/9p/vfs_super.c     | 6 ++++--
>  fs/afs/super.c        | 1 -
>  fs/btrfs/disk-io.c    | 1 -
>  fs/fuse/inode.c       | 1 -
>  fs/nfs/super.c        | 9 +--------
>  fs/ubifs/super.c      | 2 ++
>  fs/vboxsf/super.c     | 2 ++
>  mm/backing-dev.c      | 2 ++
>  10 files changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index ca3f0f00c9435f..865d39e5be2b28 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -538,8 +538,6 @@ struct request_queue *blk_alloc_queue(int node_id)
>  	if (!q->stats)
>  		goto fail_stats;
>  
> -	q->backing_dev_info->ra_pages = VM_READAHEAD_PAGES;
> -	q->backing_dev_info->io_pages = VM_READAHEAD_PAGES;
>  	q->backing_dev_info->capabilities = BDI_CAP_CGROUP_WRITEBACK;
>  	q->node = node_id;
>  
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 7d930569a7dfb7..b5e5d3140f578e 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -2196,6 +2196,8 @@ static struct backing_dev_info * __init mtd_bdi_init(char *name)
>  	bdi = bdi_alloc(NUMA_NO_NODE);
>  	if (!bdi)
>  		return ERR_PTR(-ENOMEM);
> +	bdi->ra_pages = 0;
> +	bdi->io_pages = 0;
>  
>  	/*
>  	 * We put '-0' suffix to the name to get the same name format as we
> diff --git a/fs/9p/vfs_super.c b/fs/9p/vfs_super.c
> index 74df32be4c6a52..e34fa20acf612e 100644
> --- a/fs/9p/vfs_super.c
> +++ b/fs/9p/vfs_super.c
> @@ -80,8 +80,10 @@ v9fs_fill_super(struct super_block *sb, struct v9fs_session_info *v9ses,
>  	if (ret)
>  		return ret;
>  
> -	if (v9ses->cache)
> -		sb->s_bdi->ra_pages = VM_READAHEAD_PAGES;
> +	if (!v9ses->cache) {
> +		sb->s_bdi->ra_pages = 0;
> +		sb->s_bdi->io_pages = 0;
> +	}
>  
>  	sb->s_flags |= SB_ACTIVE | SB_DIRSYNC;
>  	if (!v9ses->cache)
> diff --git a/fs/afs/super.c b/fs/afs/super.c
> index b552357b1d1379..3a40ee752c1e3f 100644
> --- a/fs/afs/super.c
> +++ b/fs/afs/super.c
> @@ -456,7 +456,6 @@ static int afs_fill_super(struct super_block *sb, struct afs_fs_context *ctx)
>  	ret = super_setup_bdi(sb);
>  	if (ret)
>  		return ret;
> -	sb->s_bdi->ra_pages	= VM_READAHEAD_PAGES;
>  
>  	/* allocate the root inode and dentry */
>  	if (as->dyn_root) {
> diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
> index f6bba7eb1fa171..047934cea25efa 100644
> --- a/fs/btrfs/disk-io.c
> +++ b/fs/btrfs/disk-io.c
> @@ -3092,7 +3092,6 @@ int __cold open_ctree(struct super_block *sb, struct btrfs_fs_devices *fs_device
>  	}
>  
>  	sb->s_bdi->capabilities |= BDI_CAP_CGROUP_WRITEBACK;
> -	sb->s_bdi->ra_pages = VM_READAHEAD_PAGES;
>  	sb->s_bdi->ra_pages *= btrfs_super_num_devices(disk_super);
>  	sb->s_bdi->ra_pages = max(sb->s_bdi->ra_pages, SZ_4M / PAGE_SIZE);
>  
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index bba747520e9b08..17b00670fb539e 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -1049,7 +1049,6 @@ static int fuse_bdi_init(struct fuse_conn *fc, struct super_block *sb)
>  	if (err)
>  		return err;
>  
> -	sb->s_bdi->ra_pages = VM_READAHEAD_PAGES;
>  	/* fuse does it's own writeback accounting */
>  	sb->s_bdi->capabilities = BDI_CAP_NO_ACCT_WB | BDI_CAP_STRICTLIMIT;
>  
> diff --git a/fs/nfs/super.c b/fs/nfs/super.c
> index 7a70287f21a2c1..f943e37853fa25 100644
> --- a/fs/nfs/super.c
> +++ b/fs/nfs/super.c
> @@ -1200,13 +1200,6 @@ static void nfs_get_cache_cookie(struct super_block *sb,
>  }
>  #endif
>  
> -static void nfs_set_readahead(struct backing_dev_info *bdi,
> -			      unsigned long iomax_pages)
> -{
> -	bdi->ra_pages = VM_READAHEAD_PAGES;
> -	bdi->io_pages = iomax_pages;
> -}
> -
>  int nfs_get_tree_common(struct fs_context *fc)
>  {
>  	struct nfs_fs_context *ctx = nfs_fc2context(fc);
> @@ -1251,7 +1244,7 @@ int nfs_get_tree_common(struct fs_context *fc)
>  					     MINOR(server->s_dev));
>  		if (error)
>  			goto error_splat_super;
> -		nfs_set_readahead(s->s_bdi, server->rpages);
> +		s->s_bdi->io_pages = server->rpages;
>  		server->super = s;
>  	}
>  
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index a2420c900275a8..fbddb2a1c03f5e 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -2177,6 +2177,8 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
>  				   c->vi.vol_id);
>  	if (err)
>  		goto out_close;
> +	sb->s_bdi->ra_pages = 0;
> +	sb->s_bdi->io_pages = 0;
>  
>  	sb->s_fs_info = c;
>  	sb->s_magic = UBIFS_SUPER_MAGIC;
> diff --git a/fs/vboxsf/super.c b/fs/vboxsf/super.c
> index 8fe03b4a0d2b03..8e3792177a8523 100644
> --- a/fs/vboxsf/super.c
> +++ b/fs/vboxsf/super.c
> @@ -167,6 +167,8 @@ static int vboxsf_fill_super(struct super_block *sb, struct fs_context *fc)
>  	err = super_setup_bdi_name(sb, "vboxsf-%d", sbi->bdi_id);
>  	if (err)
>  		goto fail_free;
> +	sb->s_bdi->ra_pages = 0;
> +	sb->s_bdi->io_pages = 0;
>  
>  	/* Turn source into a shfl_string and map the folder */
>  	size = strlen(fc->source) + 1;
> diff --git a/mm/backing-dev.c b/mm/backing-dev.c
> index 8e8b00627bb2d8..2dac3be6127127 100644
> --- a/mm/backing-dev.c
> +++ b/mm/backing-dev.c
> @@ -746,6 +746,8 @@ struct backing_dev_info *bdi_alloc(int node_id)
>  		kfree(bdi);
>  		return NULL;
>  	}
> +	bdi->ra_pages = VM_READAHEAD_PAGES;
> +	bdi->io_pages = VM_READAHEAD_PAGES;
>  	return bdi;
>  }
>  EXPORT_SYMBOL(bdi_alloc);
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

