Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 422002641C6
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 11:28:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-wDf2EdLfPWuPd_I4NsBOzw-1; Thu, 10 Sep 2020 05:28:40 -0400
X-MC-Unique: wDf2EdLfPWuPd_I4NsBOzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E4A71882FB6;
	Thu, 10 Sep 2020 09:28:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CCC71002D5C;
	Thu, 10 Sep 2020 09:28:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A882B922E0;
	Thu, 10 Sep 2020 09:28:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08A9SPU6015384 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 05:28:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B715E20110CE; Thu, 10 Sep 2020 09:28:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B308C2028DC0
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 09:28:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55343101AA42
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 09:28:23 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-530-t7z8uhFIMxyqb2cspi9j9Q-1;
	Thu, 10 Sep 2020 05:28:17 -0400
X-MC-Unique: t7z8uhFIMxyqb2cspi9j9Q-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id C27726736F; Thu, 10 Sep 2020 11:28:13 +0200 (CEST)
Date: Thu, 10 Sep 2020 11:28:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200910092813.GA27229@lst.de>
References: <20200726150333.305527-1-hch@lst.de>
	<20200726150333.305527-7-hch@lst.de>
	<20200826220737.GA25613@redhat.com> <20200902151144.GA1738@lst.de>
	<20200902162007.GB5513@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200902162007.GB5513@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	martin.petersen@oracle.com, Hans de Goede <hdegoede@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Minchan Kim <minchan@kernel.org>, drbd-dev@tron.linbit.com,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 02, 2020 at 12:20:07PM -0400, Mike Snitzer wrote:
> On Wed, Sep 02 2020 at 11:11am -0400,
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > On Wed, Aug 26, 2020 at 06:07:38PM -0400, Mike Snitzer wrote:
> > > On Sun, Jul 26 2020 at 11:03am -0400,
> > > Christoph Hellwig <hch@lst.de> wrote:
> > > 
> > > > Drivers shouldn't really mess with the readahead size, as that is a VM
> > > > concept.  Instead set it based on the optimal I/O size by lifting the
> > > > algorithm from the md driver when registering the disk.  Also set
> > > > bdi->io_pages there as well by applying the same scheme based on
> > > > max_sectors.
> > > > 
> > > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > > ---
> > > >  block/blk-settings.c         |  5 ++---
> > > >  block/blk-sysfs.c            |  1 -
> > > >  block/genhd.c                | 13 +++++++++++--
> > > >  drivers/block/aoe/aoeblk.c   |  2 --
> > > >  drivers/block/drbd/drbd_nl.c | 12 +-----------
> > > >  drivers/md/bcache/super.c    |  4 ----
> > > >  drivers/md/dm-table.c        |  3 ---
> > > >  drivers/md/raid0.c           | 16 ----------------
> > > >  drivers/md/raid10.c          | 24 +-----------------------
> > > >  drivers/md/raid5.c           | 13 +------------
> > > >  10 files changed, 16 insertions(+), 77 deletions(-)
> > > 
> > > 
> > > In general these changes need a solid audit relative to stacking
> > > drivers.  That is, the limits stacking methods (blk_stack_limits)
> > > vs lower level allocation methods (__device_add_disk).
> > > 
> > > You optimized for lowlevel __device_add_disk establishing the bdi's
> > > ra_pages and io_pages.  That is at the beginning of disk allocation,
> > > well before any build up of stacking driver's queue_io_opt() -- which
> > > was previously done in disk_stack_limits or driver specific methods
> > > (e.g. dm_table_set_restrictions) that are called _after_ all the limits
> > > stacking occurs.
> > > 
> > > By inverting the setting of the bdi's ra_pages and io_pages to be done
> > > so early in __device_add_disk it'll break properly setting these values
> > > for at least DM afaict.
> > 
> > ra_pages never got inherited by stacking drivers, check it by modifying
> > it on an underlying device and then creating a trivial dm or md one.
> 
> Sure, not saying that it did.  But if the goal is to set ra_pages based
> on io_opt then to do that correctly on stacking drivers it must be done
> in terms of limits stacking right?  Or at least done at a location that
> is after the limits stacking has occurred?  So should DM just open-code
> setting ra_pages like it did for io_pages?
> 
> Because setting ra_pages in __device_add_disk() is way too early for DM
> -- given it uses device_add_disk_no_queue_reg via add_disk_no_queue_reg
> at DM device creation (before stacking all underlying devices' limits).

I'll move it to blk_register_queue, which should work just fine.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

