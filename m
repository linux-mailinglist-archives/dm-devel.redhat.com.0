Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D384A25B170
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 18:20:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599063642;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P3WPObtBfnT7h0h2An2mcB28xP9zJKk60abslsvFh0A=;
	b=W8Nc+YHrUAh4OXDyiAiFYapgpekUVs41BMHV2gvA3PXbSlIxvbSUXOWzKOcJjBL4eHNIaD
	rJ45u0gaMjRNUerW1KS6geexcxVqOL0rsIrsoHRZXLfz0Gu+9JRDXVa4yIB7/kzcWvby+P
	R+nhH5gWO6syTh/T5Z3RnNOsphwaczY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-tgKYWjGWPq2XqVnKhP0sOw-1; Wed, 02 Sep 2020 12:20:39 -0400
X-MC-Unique: tgKYWjGWPq2XqVnKhP0sOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62DCF801AE0;
	Wed,  2 Sep 2020 16:20:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A2287EEB9;
	Wed,  2 Sep 2020 16:20:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 611B679DAA;
	Wed,  2 Sep 2020 16:20:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 082GKBZs003684 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 12:20:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D587B7E313; Wed,  2 Sep 2020 16:20:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F8C77E306;
	Wed,  2 Sep 2020 16:20:08 +0000 (UTC)
Date: Wed, 2 Sep 2020 12:20:07 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200902162007.GB5513@redhat.com>
References: <20200726150333.305527-1-hch@lst.de>
	<20200726150333.305527-7-hch@lst.de>
	<20200826220737.GA25613@redhat.com> <20200902151144.GA1738@lst.de>
MIME-Version: 1.0
In-Reply-To: <20200902151144.GA1738@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 02 2020 at 11:11am -0400,
Christoph Hellwig <hch@lst.de> wrote:

> On Wed, Aug 26, 2020 at 06:07:38PM -0400, Mike Snitzer wrote:
> > On Sun, Jul 26 2020 at 11:03am -0400,
> > Christoph Hellwig <hch@lst.de> wrote:
> > 
> > > Drivers shouldn't really mess with the readahead size, as that is a VM
> > > concept.  Instead set it based on the optimal I/O size by lifting the
> > > algorithm from the md driver when registering the disk.  Also set
> > > bdi->io_pages there as well by applying the same scheme based on
> > > max_sectors.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  block/blk-settings.c         |  5 ++---
> > >  block/blk-sysfs.c            |  1 -
> > >  block/genhd.c                | 13 +++++++++++--
> > >  drivers/block/aoe/aoeblk.c   |  2 --
> > >  drivers/block/drbd/drbd_nl.c | 12 +-----------
> > >  drivers/md/bcache/super.c    |  4 ----
> > >  drivers/md/dm-table.c        |  3 ---
> > >  drivers/md/raid0.c           | 16 ----------------
> > >  drivers/md/raid10.c          | 24 +-----------------------
> > >  drivers/md/raid5.c           | 13 +------------
> > >  10 files changed, 16 insertions(+), 77 deletions(-)
> > 
> > 
> > In general these changes need a solid audit relative to stacking
> > drivers.  That is, the limits stacking methods (blk_stack_limits)
> > vs lower level allocation methods (__device_add_disk).
> > 
> > You optimized for lowlevel __device_add_disk establishing the bdi's
> > ra_pages and io_pages.  That is at the beginning of disk allocation,
> > well before any build up of stacking driver's queue_io_opt() -- which
> > was previously done in disk_stack_limits or driver specific methods
> > (e.g. dm_table_set_restrictions) that are called _after_ all the limits
> > stacking occurs.
> > 
> > By inverting the setting of the bdi's ra_pages and io_pages to be done
> > so early in __device_add_disk it'll break properly setting these values
> > for at least DM afaict.
> 
> ra_pages never got inherited by stacking drivers, check it by modifying
> it on an underlying device and then creating a trivial dm or md one.

Sure, not saying that it did.  But if the goal is to set ra_pages based
on io_opt then to do that correctly on stacking drivers it must be done
in terms of limits stacking right?  Or at least done at a location that
is after the limits stacking has occurred?  So should DM just open-code
setting ra_pages like it did for io_pages?

Because setting ra_pages in __device_add_disk() is way too early for DM
-- given it uses device_add_disk_no_queue_reg via add_disk_no_queue_reg
at DM device creation (before stacking all underlying devices' limits).

> And I think that is a good thing - in general we shouldn't really mess
> with this thing from drivers if we can avoid it.  I've kept the legacy
> aoe and md parity raid cases, out of which the first looks pretty weird
> and the md one at least remotely sensible.

I don't want drivers, like DM, to have to worry about these.  So I agree
with that goal ;)

> ->io_pages is still inherited in disk_stack_limits, just like before
> so no change either.

I'm missing where, but I only looked closer at this 06/14 patch.
In it I see io_pages is no longer adjusted in disk_stack_limits().

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

