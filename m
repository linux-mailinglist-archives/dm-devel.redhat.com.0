Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7C22BA55E
	for <lists+dm-devel@lfdr.de>; Fri, 20 Nov 2020 10:02:14 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277--Qow2P7_Na6_OlUSBYNARg-1; Fri, 20 Nov 2020 04:02:11 -0500
X-MC-Unique: -Qow2P7_Na6_OlUSBYNARg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A46CB187653A;
	Fri, 20 Nov 2020 09:02:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 536F25D6BA;
	Fri, 20 Nov 2020 09:02:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58F354BB7B;
	Fri, 20 Nov 2020 09:02:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AK91tQO018670 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 04:01:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A66272166B2C; Fri, 20 Nov 2020 09:01:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A188A2166B2B
	for <dm-devel@redhat.com>; Fri, 20 Nov 2020 09:01:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D533103B802
	for <dm-devel@redhat.com>; Fri, 20 Nov 2020 09:01:50 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-487-vMGHz0cLN6SfSoFQteU9dw-1;
	Fri, 20 Nov 2020 04:01:45 -0500
X-MC-Unique: vMGHz0cLN6SfSoFQteU9dw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4C98067373; Fri, 20 Nov 2020 10:01:42 +0100 (CET)
Date: Fri, 20 Nov 2020 10:01:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20201120090142.GC21715@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
	<20201118084800.2339180-14-hch@lst.de>
	<20201119103253.GV1981@quack2.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20201119103253.GV1981@quack2.suse.cz>
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Richard Weinberger <richard@nod.at>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org,
	linux-mm@kvack.org, Jan Kara <jack@suse.com>,
	Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 13/20] block: remove ->bd_contains
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 19, 2020 at 11:32:53AM +0100, Jan Kara wrote:
> > @@ -1521,7 +1510,7 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, void *holder,
> >  		if (bdev->bd_bdi == &noop_backing_dev_info)
> >  			bdev->bd_bdi = bdi_get(disk->queue->backing_dev_info);
> >  	} else {
> > -		if (bdev->bd_contains == bdev) {
> > +		if (!bdev->bd_partno) {
> 
> This should be !bdev_is_partition(bdev) for consistency, right?

Yes.  Same for the same check further up for the !bdev->bd_openers
case.

> > +#define bdev_whole(_bdev) \
> > +	((_bdev)->bd_disk->part0.bdev)
> > +
> >  #define bdev_kobj(_bdev) \
> >  	(&part_to_dev((_bdev)->bd_part)->kobj)
> 
> I'd somewhat prefer if these helpers could actually be inline functions and
> not macros. I guess they are macros because hd_struct isn't in blk_types.h.
> But if we moved helpers to blkdev.h, we'd have all definitions we need...
> Is that a problem for some users?

As you pointed out the reason these are macros is that the obvious
placement doesn't work.  My plan was to look into cleaning up the block
headers, which are a complete mess between blk_types.h, bio.h, blkdev.h
and genhd.h after I'm done making sense of the data structures, so for
now I didn't want to move too much around.  Hopefully we'll be able to
convert these helpers to inlines once I'm done.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

