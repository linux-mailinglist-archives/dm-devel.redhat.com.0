Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A678C2C5B3D
	for <lists+dm-devel@lfdr.de>; Thu, 26 Nov 2020 19:01:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-243KPRUMNs-wzypNcmHzLg-1; Thu, 26 Nov 2020 13:01:17 -0500
X-MC-Unique: 243KPRUMNs-wzypNcmHzLg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFFF21E7DB;
	Thu, 26 Nov 2020 18:01:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72AE060855;
	Thu, 26 Nov 2020 18:01:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 65D53180954D;
	Thu, 26 Nov 2020 18:01:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AQI0uKP002651 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 26 Nov 2020 13:00:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC3A2112D408; Thu, 26 Nov 2020 18:00:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4DBD112D409
	for <dm-devel@redhat.com>; Thu, 26 Nov 2020 18:00:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63B771871CC4
	for <dm-devel@redhat.com>; Thu, 26 Nov 2020 18:00:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-126-7QXmkFNVP6u8yrMdNLdCRQ-1;
	Thu, 26 Nov 2020 13:00:51 -0500
X-MC-Unique: 7QXmkFNVP6u8yrMdNLdCRQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 52B7BABD2;
	Thu, 26 Nov 2020 18:00:49 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id BB5021E10D0; Thu, 26 Nov 2020 19:00:48 +0100 (CET)
Date: Thu, 26 Nov 2020 19:00:48 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201126180048.GA422@quack2.suse.cz>
References: <20201126130422.92945-1-hch@lst.de>
	<20201126130422.92945-37-hch@lst.de>
	<20201126173518.GV422@quack2.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20201126173518.GV422@quack2.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, linux-bcache@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 36/44] block: allocate struct hd_struct as
 part of struct bdev_inode
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

On Thu 26-11-20 18:35:18, Jan Kara wrote:
> On Thu 26-11-20 14:04:14, Christoph Hellwig wrote:
> > Allocate hd_struct together with struct block_device to pre-load
> > the lifetime rule changes in preparation of merging the two structures.
> > 
> > Note that part0 was previously embedded into struct gendisk, but is
> > a separate allocation now, and already points to the block_device instead
> > of the hd_struct.  The lifetime of struct gendisk is still controlled by
> > the struct device embedded in the part0 hd_struct.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Just one comment below. With that fixed feel free to add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> 
> > diff --git a/block/partitions/core.c b/block/partitions/core.c
> > index f397ec9922bd6e..9c7e6730fa6098 100644
> > --- a/block/partitions/core.c
> > +++ b/block/partitions/core.c
> > @@ -265,9 +265,9 @@ static const struct attribute_group *part_attr_groups[] = {
> >  static void part_release(struct device *dev)
> >  {
> >  	struct hd_struct *p = dev_to_part(dev);
> > +
> >  	blk_free_devt(dev->devt);
> > -	hd_free_part(p);
> > -	kfree(p);
> > +	bdput(p->bdev);
> >  }
> 
> I don't think hd_struct holds a reference to block_device, does it?
> bdev_alloc() now just assigns bdev->bd_part->bdev = bdev...

Now I understood this is probably correct - each partition (including
gendisk as 0 partition) holds the initial bdev reference and only when
corresponding kobject is getting destroyed we stop holding onto that
reference. Right?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

