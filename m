Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4732638E172
	for <lists+dm-devel@lfdr.de>; Mon, 24 May 2021 09:21:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-hUzYyi1KN6yFR7ly2rCtcA-1; Mon, 24 May 2021 03:21:08 -0400
X-MC-Unique: hUzYyi1KN6yFR7ly2rCtcA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AC50180FD72;
	Mon, 24 May 2021 07:20:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43BF75F9B0;
	Mon, 24 May 2021 07:20:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB3971801029;
	Mon, 24 May 2021 07:20:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14O7KNxF011390 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 May 2021 03:20:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCDBA2157FA4; Mon, 24 May 2021 07:20:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8B312157FA3
	for <dm-devel@redhat.com>; Mon, 24 May 2021 07:20:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3827E83395E
	for <dm-devel@redhat.com>; Mon, 24 May 2021 07:20:21 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-459-JS4TfxtlOJCUshspfVaR3A-1;
	Mon, 24 May 2021 03:20:18 -0400
X-MC-Unique: JS4TfxtlOJCUshspfVaR3A-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id A686B67373; Mon, 24 May 2021 09:20:13 +0200 (CEST)
Date: Mon, 24 May 2021 09:20:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <20210524072013.GA23890@lst.de>
References: <20210521055116.1053587-1-hch@lst.de>
	<20210521055116.1053587-2-hch@lst.de>
	<20210521171646.GA25017@42.do-not-panic.com>
MIME-Version: 1.0
In-Reply-To: <20210521171646.GA25017@42.do-not-panic.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: nvdimm@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	Mike Snitzer <snitzer@redhat.com>, linux-m68k@vger.kernel.org,
	linux-nvme@lists.infradead.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, Joshua Morris <josh.h.morris@us.ibm.com>,
	linux-s390@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Vishal Verma <vishal.l.verma@intel.com>, Christoph Hellwig <hch@lst.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Matias Bjorling <mb@lightnvm.io>, Nitin Gupta <ngupta@vflare.org>,
	Vasily Gorbik <gor@linux.ibm.com>, linux-xtensa@linux-xtensa.org,
	Alex Dubov <oakad@yahoo.com>, Heiko Carstens <hca@linux.ibm.com>,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, linux-block@vger.kernel.org,
	drbd-dev@tron.linbit.com, Philip Kelleher <pjk1939@linux.ibm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jens Axboe <axboe@kernel.dk>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, linux-mmc@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Jim Paris <jim@jtan.com>, Minchan Kim <minchan@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [dm-devel] [PATCH 01/26] block: refactor device number setup in
 __device_add_disk
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 21, 2021 at 05:16:46PM +0000, Luis Chamberlain wrote:
> > -	/* in consecutive minor range? */
> > -	if (bdev->bd_partno < disk->minors) {
> > -		*devt = MKDEV(disk->major, disk->first_minor + bdev->bd_partno);
> > -		return 0;
> > -	}
> > -
> 
> It is not obviously clear to me, why this was part of add_disk()
> path, and ...
> 
> > diff --git a/block/partitions/core.c b/block/partitions/core.c
> > index dc60ecf46fe6..504297bdc8bf 100644
> > --- a/block/partitions/core.c
> > +++ b/block/partitions/core.c
> > @@ -379,9 +380,15 @@ static struct block_device *add_partition(struct gendisk *disk, int partno,
> >  	pdev->type = &part_type;
> >  	pdev->parent = ddev;
> >  
> > -	err = blk_alloc_devt(bdev, &devt);
> > -	if (err)
> > -		goto out_put;
> > +	/* in consecutive minor range? */
> > +	if (bdev->bd_partno < disk->minors) {
> > +		devt = MKDEV(disk->major, disk->first_minor + bdev->bd_partno);
> > +	} else {
> > +		err = blk_alloc_ext_minor();
> > +		if (err < 0)
> > +			goto out_put;
> > +		devt = MKDEV(BLOCK_EXT_MAJOR, err);
> > +	}
> >  	pdev->devt = devt;
> >  
> >  	/* delay uevent until 'holders' subdir is created */
> 
> ... and why we only add this here now.

For the genhd minors == 0 (aka GENHD_FL_EXT_DEVT) implies having to
allocate a dynamic dev_t, so it can be folded into another conditional.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

