Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A91C333F026
	for <lists+dm-devel@lfdr.de>; Wed, 17 Mar 2021 13:23:17 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-PWXqWNECNFWnlxaYSeQRrg-1; Wed, 17 Mar 2021 08:23:14 -0400
X-MC-Unique: PWXqWNECNFWnlxaYSeQRrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 103B6100B708;
	Wed, 17 Mar 2021 12:23:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCA2339A66;
	Wed, 17 Mar 2021 12:23:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C2814BB7C;
	Wed, 17 Mar 2021 12:22:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12HCMcFk002406 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Mar 2021 08:22:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 68E572024CD7; Wed, 17 Mar 2021 12:22:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 631612024CD5
	for <dm-devel@redhat.com>; Wed, 17 Mar 2021 12:22:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 617B9811E7F
	for <dm-devel@redhat.com>; Wed, 17 Mar 2021 12:22:35 +0000 (UTC)
Received: from mx2.veeam.com (mx2.veeam.com [64.129.123.6]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-549-zM1Ztg1jPsiFbbqU9c8SKw-1;
	Wed, 17 Mar 2021 08:22:31 -0400
X-MC-Unique: zM1Ztg1jPsiFbbqU9c8SKw-1
Received: from mail.veeam.com (prgmbx01.amust.local [172.24.0.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx2.veeam.com (Postfix) with ESMTPS id 1633F41351;
	Wed, 17 Mar 2021 08:22:27 -0400 (EDT)
Received: from veeam.com (172.24.14.5) by prgmbx01.amust.local (172.24.0.171)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.721.2;
	Wed, 17 Mar 2021 13:22:24 +0100
Date: Wed, 17 Mar 2021 15:22:17 +0300
From: Sergei Shtepa <sergei.shtepa@veeam.com>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20210317122217.GA31781@veeam.com>
References: <1615563895-28565-1-git-send-email-sergei.shtepa@veeam.com>
	<1615563895-28565-3-git-send-email-sergei.shtepa@veeam.com>
	<YFBnypYemiR08A/c@T590> <20210316163544.GA31272@veeam.com>
	<YFFxdz84esfiTvNk@T590>
MIME-Version: 1.0
In-Reply-To: <YFFxdz84esfiTvNk@T590>
X-Originating-IP: [172.24.14.5]
X-ClientProxiedBy: prgmbx02.amust.local (172.24.0.172) To prgmbx01.amust.local
	(172.24.0.171)
X-EsetResult: clean, is OK
X-EsetId: 37303A29D2A50B586D7465
X-Veeam-MMEX: True
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	Pavel Tide <Pavel.TIde@veeam.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v7 2/3] block: add bdev_interposer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The 03/17/2021 06:03, Ming Lei wrote:
> On Tue, Mar 16, 2021 at 07:35:44PM +0300, Sergei Shtepa wrote:
> > The 03/16/2021 11:09, Ming Lei wrote:
> > > On Fri, Mar 12, 2021 at 06:44:54PM +0300, Sergei Shtepa wrote:
> > > > bdev_interposer allows to redirect bio requests to another devices.
> > > > 
> > > > Signed-off-by: Sergei Shtepa <sergei.shtepa@veeam.com>
> > > > ---
> > > >  block/bio.c               |  2 ++
> > > >  block/blk-core.c          | 57 +++++++++++++++++++++++++++++++++++++++
> > > >  block/genhd.c             | 54 +++++++++++++++++++++++++++++++++++++
> > > >  include/linux/blk_types.h |  3 +++
> > > >  include/linux/blkdev.h    |  9 +++++++
> > > >  5 files changed, 125 insertions(+)
> > > > 
> > > > diff --git a/block/bio.c b/block/bio.c
> > > > index a1c4d2900c7a..0bfbf06475ee 100644
> > > > --- a/block/bio.c
> > > > +++ b/block/bio.c
> > > > @@ -640,6 +640,8 @@ void __bio_clone_fast(struct bio *bio, struct bio *bio_src)
> > > >  		bio_set_flag(bio, BIO_THROTTLED);
> > > >  	if (bio_flagged(bio_src, BIO_REMAPPED))
> > > >  		bio_set_flag(bio, BIO_REMAPPED);
> > > > +	if (bio_flagged(bio_src, BIO_INTERPOSED))
> > > > +		bio_set_flag(bio, BIO_INTERPOSED);
> > > >  	bio->bi_opf = bio_src->bi_opf;
> > > >  	bio->bi_ioprio = bio_src->bi_ioprio;
> > > >  	bio->bi_write_hint = bio_src->bi_write_hint;
> > > > diff --git a/block/blk-core.c b/block/blk-core.c
> > > > index fc60ff208497..da1abc4c27a9 100644
> > > > --- a/block/blk-core.c
> > > > +++ b/block/blk-core.c
> > > > @@ -1018,6 +1018,55 @@ static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
> > > >  	return ret;
> > > >  }
> > > >  
> > > > +static noinline blk_qc_t submit_bio_interposed(struct bio *bio)
> > > > +{
> > > > +	blk_qc_t ret = BLK_QC_T_NONE;
> > > > +	struct bio_list bio_list[2] = { };
> > > > +	struct gendisk *orig_disk;
> > > > +
> > > > +	if (current->bio_list) {
> > > > +		bio_list_add(&current->bio_list[0], bio);
> > > > +		return BLK_QC_T_NONE;
> > > > +	}
> > > > +
> > > > +	orig_disk = bio->bi_bdev->bd_disk;
> > > > +	if (unlikely(bio_queue_enter(bio)))
> > > > +		return BLK_QC_T_NONE;
> > > > +
> > > > +	current->bio_list = bio_list;
> > > > +
> > > > +	do {
> > > > +		struct block_device *interposer = bio->bi_bdev->bd_interposer;
> > > > +
> > > > +		if (unlikely(!interposer)) {
> > > > +			/* interposer was removed */
> > > > +			bio_list_add(&current->bio_list[0], bio);
> > > > +			break;
> > > > +		}
> > > > +		/* assign bio to interposer device */
> > > > +		bio_set_dev(bio, interposer);
> > > > +		bio_set_flag(bio, BIO_INTERPOSED);
> > > > +
> > > > +		if (!submit_bio_checks(bio))
> > > > +			break;
> > > > +		/*
> > > > +		 * Because the current->bio_list is initialized,
> > > > +		 * the submit_bio callback will always return BLK_QC_T_NONE.
> > > > +		 */
> > > > +		interposer->bd_disk->fops->submit_bio(bio);
> > > 
> > > Given original request queue may become live when calling attach() and
> > > detach(), see below comment. bdev_interposer_detach() may be run
> > > when running ->submit_bio(), meantime the interposer device is
> > > gone during the period, then kernel oops.
> > 
> > I think that since the bio_queue_enter() function was called,
> > q->q_usage_counter will not allow the critical code in the attach/detach
> > functions to be executed, which is located between the blk_freeze_queue
> > and blk_unfreeze_queue calls.
> > Please correct me if I'm wrong.
> > 
> > > 
> > > > +	} while (false);
> > > > +
> > > > +	current->bio_list = NULL;
> > > > +
> > > > +	blk_queue_exit(orig_disk->queue);
> > > > +
> > > > +	/* Resubmit remaining bios */
> > > > +	while ((bio = bio_list_pop(&bio_list[0])))
> > > > +		ret = submit_bio_noacct(bio);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > >  /**
> > > >   * submit_bio_noacct - re-submit a bio to the block device layer for I/O
> > > >   * @bio:  The bio describing the location in memory and on the device.
> > > > @@ -1029,6 +1078,14 @@ static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
> > > >   */
> > > >  blk_qc_t submit_bio_noacct(struct bio *bio)
> > > >  {
> > > > +	/*
> > > > +	 * Checking the BIO_INTERPOSED flag is necessary so that the bio
> > > > +	 * created by the bdev_interposer do not get to it for processing.
> > > > +	 */
> > > > +	if (bdev_has_interposer(bio->bi_bdev) &&
> > > > +	    !bio_flagged(bio, BIO_INTERPOSED))
> > > > +		return submit_bio_interposed(bio);
> > > > +
> > > >  	if (!submit_bio_checks(bio))
> > > >  		return BLK_QC_T_NONE;
> > > >  
> > > > diff --git a/block/genhd.c b/block/genhd.c
> > > > index c55e8f0fced1..c840ecffea68 100644
> > > > --- a/block/genhd.c
> > > > +++ b/block/genhd.c
> > > > @@ -30,6 +30,11 @@
> > > >  static struct kobject *block_depr;
> > > >  
> > > >  DECLARE_RWSEM(bdev_lookup_sem);
> > > > +/*
> > > > + * Prevents different block-layer interposers from attaching or detaching
> > > > + * to the block device at the same time.
> > > > + */
> > > > +static DEFINE_MUTEX(bdev_interposer_attach_lock);
> > > >  
> > > >  /* for extended dynamic devt allocation, currently only one major is used */
> > > >  #define NR_EXT_DEVT		(1 << MINORBITS)
> > > > @@ -1940,3 +1945,52 @@ static void disk_release_events(struct gendisk *disk)
> > > >  	WARN_ON_ONCE(disk->ev && disk->ev->block != 1);
> > > >  	kfree(disk->ev);
> > > >  }
> > > > +
> > > > +int bdev_interposer_attach(struct block_device *original,
> > > > +			   struct block_device *interposer)
> > > > +{
> > > > +	int ret = 0;
> > > > +
> > > > +	if (WARN_ON(((!original) || (!interposer))))
> > > > +		return -EINVAL;
> > > > +	/*
> > > > +	 * interposer should be simple, no a multi-queue device
> > > > +	 */
> > > > +	if (!interposer->bd_disk->fops->submit_bio)
> > > > +		return -EINVAL;
> > > > +
> > > > +	if (WARN_ON(!blk_mq_is_queue_frozen(original->bd_disk->queue)))
> > > > +		return -EPERM;
> > > 
> > > The original request queue may become live now...
> > 
> > Yes.
> > I will remove the blk_mq_is_queue_frozen() function and use a different
> > approach.
> 
> Looks what attach and detach needs is that queue is kept as frozen state
> instead of being froze simply at the beginning of the two functions, so
> you can simply call freeze/unfreeze inside the two functions.
> 
> But what if 'original' isn't a MQ queue?  queue usage counter is just
> grabed when calling ->submit_bio(), and queue freeze doesn't guarantee there
> isn't any io activity, is that a problem for bdev_interposer use case?
> 
> -- 
> Ming
> 

It makes sense to add freeze_bdev/thaw_bdev. This will be useful.
For the main file systems, the freeze functions are defined 
sb->s_op->freeze_super() or sb - >s_op->freeze_fs()
(btrfs, ext2, ext4, f2fs, jfs, nilfs2, reiserfs, xfs).
If the file system is frozen, then no new requests should be received.

But if the file system does not support freeze or the disk is used without
a file system, as for some databases, freeze_bdev seems useless to me.
In this case, we will need to stop working with the disk from user-space,
for example, to freeze the database itself.

I can add dm_suspend() before bdev_interposer_detach(). This will ensure that
all intercepted requests have been processed. Applying dm_suspend() before
bdev_interposer_attach() is pointless. The attachment is made when the target
is created, and at this time the target is not ready to work yet.
There shouldn't be any bio requests, I suppose. In addition,
sb->s_op->freeze_fs() for the interposer will not be called, because the file
system is not mounted for the interposer device. It should not be able to
be mounted. To do this, I will add an exclusive opening of the interposer
device.

I'll add freeze_bdev() for the original device and dm_suspend() for the
interposer to the DM code. For normal operation of bdev_interposer,
it is enough to transfer blk_mq_freeze_queue and blk_mq_quiesce_queue to
bdev_interposer_attach/bdev_interposer_detach.
The lock on the counter q->q_usage_counter is enough to not catch NULL in
bd_interposer.

Do you think this is enough?
I think there are no other ways to stop the block device queue.

-- 
Sergei Shtepa
Veeam Software developer.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

