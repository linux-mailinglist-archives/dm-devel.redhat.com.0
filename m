Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0788D2C59AE
	for <lists+dm-devel@lfdr.de>; Thu, 26 Nov 2020 17:59:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-_f5y-hbYMiefi9TI8lyl1A-1; Thu, 26 Nov 2020 11:59:10 -0500
X-MC-Unique: _f5y-hbYMiefi9TI8lyl1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 465F98042B7;
	Thu, 26 Nov 2020 16:59:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 896C260855;
	Thu, 26 Nov 2020 16:59:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D252E180954D;
	Thu, 26 Nov 2020 16:59:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AQGwu4H027628 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 26 Nov 2020 11:58:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 97A3ACF62E; Thu, 26 Nov 2020 16:58:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92172B6B39
	for <dm-devel@redhat.com>; Thu, 26 Nov 2020 16:58:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35F40858284
	for <dm-devel@redhat.com>; Thu, 26 Nov 2020 16:58:54 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-149-KmJlBqCFPdiNkof2lu2MWg-1;
	Thu, 26 Nov 2020 11:58:51 -0500
X-MC-Unique: KmJlBqCFPdiNkof2lu2MWg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 28304ACE0;
	Thu, 26 Nov 2020 16:58:50 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id E46921E10D0; Thu, 26 Nov 2020 17:58:49 +0100 (CET)
Date: Thu, 26 Nov 2020 17:58:49 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201126165849.GR422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
	<20201126130422.92945-33-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201126130422.92945-33-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, linux-bcache@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 32/44] block: move the partition_meta_info to
 struct block_device
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu 26-11-20 14:04:10, Christoph Hellwig wrote:
> Move the partition_meta_info to struct block_device in preparation for
> killing struct hd_struct.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza


> ---
>  block/blk.h               |  1 -
>  block/genhd.c             |  3 ++-
>  block/partitions/core.c   | 18 +++++++-----------
>  fs/block_dev.c            |  1 +
>  include/linux/blk_types.h |  2 ++
>  include/linux/genhd.h     |  1 -
>  init/do_mounts.c          |  7 ++++---
>  7 files changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/block/blk.h b/block/blk.h
> index 3f801f6e86f8a1..0bd4b58bcbaf77 100644
> --- a/block/blk.h
> +++ b/block/blk.h
> @@ -381,7 +381,6 @@ static inline void hd_struct_put(struct hd_struct *part)
>  
>  static inline void hd_free_part(struct hd_struct *part)
>  {
> -	kfree(part->info);
>  	bdput(part->bdev);
>  	percpu_ref_exit(&part->ref);
>  }
> diff --git a/block/genhd.c b/block/genhd.c
> index 7bb45382658385..fe202a12eec096 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -1002,7 +1002,8 @@ void __init printk_all_partitions(void)
>  			       bdevt_str(part_devt(part), devt_buf),
>  			       bdev_nr_sectors(part->bdev) >> 1,
>  			       disk_name(disk, part->partno, name_buf),
> -			       part->info ? part->info->uuid : "");
> +			       part->bdev->bd_meta_info ?
> +					part->bdev->bd_meta_info->uuid : "");
>  			if (is_part0) {
>  				if (dev->parent && dev->parent->driver)
>  					printk(" driver: %s\n",
> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index 485777cea26bfa..224a22d82fb86f 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c
> @@ -275,8 +275,9 @@ static int part_uevent(struct device *dev, struct kobj_uevent_env *env)
>  	struct hd_struct *part = dev_to_part(dev);
>  
>  	add_uevent_var(env, "PARTN=%u", part->partno);
> -	if (part->info && part->info->volname[0])
> -		add_uevent_var(env, "PARTNAME=%s", part->info->volname);
> +	if (part->bdev->bd_meta_info && part->bdev->bd_meta_info->volname[0])
> +		add_uevent_var(env, "PARTNAME=%s",
> +			       part->bdev->bd_meta_info->volname);
>  	return 0;
>  }
>  
> @@ -422,13 +423,10 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
>  	p->policy = get_disk_ro(disk);
>  
>  	if (info) {
> -		struct partition_meta_info *pinfo;
> -
> -		pinfo = kzalloc_node(sizeof(*pinfo), GFP_KERNEL, disk->node_id);
> -		if (!pinfo)
> +		err = -ENOMEM;
> +		bdev->bd_meta_info = kmemdup(info, sizeof(*info), GFP_KERNEL);
> +		if (!bdev->bd_meta_info)
>  			goto out_bdput;
> -		memcpy(pinfo, info, sizeof(*info));
> -		p->info = pinfo;
>  	}
>  
>  	dname = dev_name(ddev);
> @@ -444,7 +442,7 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
>  
>  	err = blk_alloc_devt(p, &devt);
>  	if (err)
> -		goto out_free_info;
> +		goto out_bdput;
>  	pdev->devt = devt;
>  
>  	/* delay uevent until 'holders' subdir is created */
> @@ -481,8 +479,6 @@ static struct hd_struct *add_partition(struct gendisk *disk, int partno,
>  		kobject_uevent(&pdev->kobj, KOBJ_ADD);
>  	return p;
>  
> -out_free_info:
> -	kfree(p->info);
>  out_bdput:
>  	bdput(bdev);
>  out_free:
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index 11e6a9a255845d..62fae6a0e8aa56 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -785,6 +785,7 @@ static void bdev_free_inode(struct inode *inode)
>  	struct block_device *bdev = I_BDEV(inode);
>  
>  	free_percpu(bdev->bd_stats);
> +	kfree(bdev->bd_meta_info);
>  
>  	kmem_cache_free(bdev_cachep, BDEV_I(inode));
>  }
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index a690008f60cd92..2f8ede04e5a94c 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -49,6 +49,8 @@ struct block_device {
>  	/* Mutex for freeze */
>  	struct mutex		bd_fsfreeze_mutex;
>  	struct super_block	*bd_fsfreeze_sb;
> +
> +	struct partition_meta_info *bd_meta_info;
>  } __randomize_layout;
>  
>  #define bdev_whole(_bdev) \
> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
> index 50d27f5d38e2af..30d7076155b4d2 100644
> --- a/include/linux/genhd.h
> +++ b/include/linux/genhd.h
> @@ -57,7 +57,6 @@ struct hd_struct {
>  	struct device __dev;
>  	struct kobject *holder_dir;
>  	int policy, partno;
> -	struct partition_meta_info *info;
>  #ifdef CONFIG_FAIL_MAKE_REQUEST
>  	int make_it_fail;
>  #endif
> diff --git a/init/do_mounts.c b/init/do_mounts.c
> index 5879edf083b318..368ccb71850126 100644
> --- a/init/do_mounts.c
> +++ b/init/do_mounts.c
> @@ -79,8 +79,8 @@ static int match_dev_by_uuid(struct device *dev, const void *data)
>  	const struct uuidcmp *cmp = data;
>  	struct hd_struct *part = dev_to_part(dev);
>  
> -	if (!part->info ||
> -	    strncasecmp(cmp->uuid, part->info->uuid, cmp->len))
> +	if (!part->bdev->bd_meta_info ||
> +	    strncasecmp(cmp->uuid, part->bdev->bd_meta_info->uuid, cmp->len))
>  		return 0;
>  	return 1;
>  }
> @@ -169,7 +169,8 @@ static int match_dev_by_label(struct device *dev, const void *data)
>  	const char *label = data;
>  	struct hd_struct *part = dev_to_part(dev);
>  
> -	if (!part->info || strcmp(label, part->info->volname))
> +	if (!part->bdev->bd_meta_info ||
> +	    strcmp(label, part->bdev->bd_meta_info->volname))
>  		return 0;
>  	return 1;
>  }
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

