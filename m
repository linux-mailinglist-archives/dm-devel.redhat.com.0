Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C28CA264AF2
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 19:19:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599758346;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ErUIB616jz8QmPDkh69V/GItF5eFLUMRhJww9Vu5ioU=;
	b=b4hc0P9rBfWf6C8VjH4XemBg9Pc7drugCcVYaTuys7IznvZL2C5DaMhMkDI6ACLMGKwA1q
	T4tFCFgig11MdCFi+BqCiaYFxfYfUOfeyzWtMMeO4bzTOClx6Z/O0psM2GN3Xy19Gvlfsm
	JvL2elSl+bUriZWIqCUyKlqA/W4R5nc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-708wcGFONni-Ejv0yPCJDA-1; Thu, 10 Sep 2020 13:19:03 -0400
X-MC-Unique: 708wcGFONni-Ejv0yPCJDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7616C1084CA8;
	Thu, 10 Sep 2020 17:18:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47CE0925DD;
	Thu, 10 Sep 2020 17:18:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7824D183D022;
	Thu, 10 Sep 2020 17:18:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AHFjI4010515 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 13:15:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D63A060C07; Thu, 10 Sep 2020 17:15:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 061BB60BFA;
	Thu, 10 Sep 2020 17:15:42 +0000 (UTC)
Date: Thu, 10 Sep 2020 13:15:41 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200910171541.GB21919@redhat.com>
References: <20200726150333.305527-1-hch@lst.de>
	<20200726150333.305527-7-hch@lst.de>
	<20200826220737.GA25613@redhat.com> <20200902151144.GA1738@lst.de>
	<20200902162007.GB5513@redhat.com> <20200910092813.GA27229@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200910092813.GA27229@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	martin.petersen@oracle.com, Hans de Goede <hdegoede@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Minchan Kim <minchan@kernel.org>, drbd-dev@tron.linbit.com,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [dm-devel] [PATCH 06/14] block: lift setting the readahead size
 into the block layer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Sep 10 2020 at  5:28am -0400,
Christoph Hellwig <hch@lst.de> wrote:

> On Wed, Sep 02, 2020 at 12:20:07PM -0400, Mike Snitzer wrote:
> > On Wed, Sep 02 2020 at 11:11am -0400,
> > Christoph Hellwig <hch@lst.de> wrote:
> > 
> > > On Wed, Aug 26, 2020 at 06:07:38PM -0400, Mike Snitzer wrote:
> > > > On Sun, Jul 26 2020 at 11:03am -0400,
> > > > Christoph Hellwig <hch@lst.de> wrote:
> > > > 
> > > > > Drivers shouldn't really mess with the readahead size, as that is a VM
> > > > > concept.  Instead set it based on the optimal I/O size by lifting the
> > > > > algorithm from the md driver when registering the disk.  Also set
> > > > > bdi->io_pages there as well by applying the same scheme based on
> > > > > max_sectors.
> > > > > 
> > > > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > > > ---
> > > > >  block/blk-settings.c         |  5 ++---
> > > > >  block/blk-sysfs.c            |  1 -
> > > > >  block/genhd.c                | 13 +++++++++++--
> > > > >  drivers/block/aoe/aoeblk.c   |  2 --
> > > > >  drivers/block/drbd/drbd_nl.c | 12 +-----------
> > > > >  drivers/md/bcache/super.c    |  4 ----
> > > > >  drivers/md/dm-table.c        |  3 ---
> > > > >  drivers/md/raid0.c           | 16 ----------------
> > > > >  drivers/md/raid10.c          | 24 +-----------------------
> > > > >  drivers/md/raid5.c           | 13 +------------
> > > > >  10 files changed, 16 insertions(+), 77 deletions(-)
> > > > 
> > > > 
> > > > In general these changes need a solid audit relative to stacking
> > > > drivers.  That is, the limits stacking methods (blk_stack_limits)
> > > > vs lower level allocation methods (__device_add_disk).
> > > > 
> > > > You optimized for lowlevel __device_add_disk establishing the bdi's
> > > > ra_pages and io_pages.  That is at the beginning of disk allocation,
> > > > well before any build up of stacking driver's queue_io_opt() -- which
> > > > was previously done in disk_stack_limits or driver specific methods
> > > > (e.g. dm_table_set_restrictions) that are called _after_ all the limits
> > > > stacking occurs.
> > > > 
> > > > By inverting the setting of the bdi's ra_pages and io_pages to be done
> > > > so early in __device_add_disk it'll break properly setting these values
> > > > for at least DM afaict.
> > > 
> > > ra_pages never got inherited by stacking drivers, check it by modifying
> > > it on an underlying device and then creating a trivial dm or md one.
> > 
> > Sure, not saying that it did.  But if the goal is to set ra_pages based
> > on io_opt then to do that correctly on stacking drivers it must be done
> > in terms of limits stacking right?  Or at least done at a location that
> > is after the limits stacking has occurred?  So should DM just open-code
> > setting ra_pages like it did for io_pages?
> > 
> > Because setting ra_pages in __device_add_disk() is way too early for DM
> > -- given it uses device_add_disk_no_queue_reg via add_disk_no_queue_reg
> > at DM device creation (before stacking all underlying devices' limits).
> 
> I'll move it to blk_register_queue, which should work just fine.

That'll work for initial DM table load as part of DM device creation
(dm_setup_md_queue).  But it won't account for DM table reloads that
might change underlying devices on a live DM device (done using
__bind).

Both dm_setup_md_queue() and __bind() call dm_table_set_restrictions()
to set/update queue_limits.  It feels like __bind() will need to call a
new block helper to set/update parts of queue_limits (e.g. ra_pages and
io_pages).

Any chance you're open to factoring out that block function as an
exported symbol for use by blk_register_queue() and code like DM's
__bind()?

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

