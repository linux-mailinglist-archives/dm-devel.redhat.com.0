Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DD4DA3FBD88
	for <lists+dm-devel@lfdr.de>; Mon, 30 Aug 2021 22:43:22 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-BSxF6mH4M1WnxP7QFsFBWw-1; Mon, 30 Aug 2021 16:43:19 -0400
X-MC-Unique: BSxF6mH4M1WnxP7QFsFBWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80E94801B3C;
	Mon, 30 Aug 2021 20:43:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37F666091B;
	Mon, 30 Aug 2021 20:43:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BAD9A4BB7C;
	Mon, 30 Aug 2021 20:42:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17UKgjjB005015 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Aug 2021 16:42:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 690656D9EC; Mon, 30 Aug 2021 20:42:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6457E30BA4
	for <dm-devel@redhat.com>; Mon, 30 Aug 2021 20:42:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6686518A0164
	for <dm-devel@redhat.com>; Mon, 30 Aug 2021 20:42:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-559-sdKCRI9yONGhGUh0SapK7w-1; Mon, 30 Aug 2021 16:42:39 -0400
X-MC-Unique: sdKCRI9yONGhGUh0SapK7w-1
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mKo6Z-000Wv2-7h; Mon, 30 Aug 2021 20:42:07 +0000
Date: Mon, 30 Aug 2021 13:42:07 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YS1Cn6yMbpQGFOYe@bombadil.infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
	<20210823202930.137278-7-mcgrof@kernel.org>
	<YSSN+eac2aCFXTAA@infradead.org>
	<YSkyHINtV/djFEej@bombadil.infradead.org>
	<YSnme1mfHS/HCguW@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YSnme1mfHS/HCguW@infradead.org>
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
Cc: ulf.hansson@linaro.org, snitzer@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	agk@redhat.com, beanhuo@micron.com, ming.lei@redhat.com,
	sagi@grimberg.me, linux-scsi@vger.kernel.org, jejb@linux.ibm.com,
	josef@toxicpanda.com, nbd@other.debian.org,
	linux-block@vger.kernel.org, avri.altman@wdc.com,
	kbusch@kernel.org, swboyd@chromium.org, bvanassche@acm.org,
	axboe@kernel.dk, martin.petersen@oracle.com,
	linux-mmc@vger.kernel.org, adrian.hunter@intel.com
Subject: Re: [dm-devel] [PATCH 06/10] mmc/core/block: add error handling
 support for add_disk()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 28, 2021 at 08:32:11AM +0100, Christoph Hellwig wrote:
> On Fri, Aug 27, 2021 at 11:42:36AM -0700, Luis Chamberlain wrote:
> > > >  	if (area_type == MMC_BLK_DATA_AREA_MAIN)
> > > >  		dev_set_drvdata(&card->dev, md);
> > > > -	device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> > > > +	ret = device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> > > > +	if (ret)
> > > > +		goto out;
> > > 
> > > This needs to do a blk_cleanup_queue and also te kfree of md.
> > 
> > If mmc_blk_alloc_parts() fails mmc_blk_remove_req() is called which
> > does both for us?
> 
> Yes, but only for the main gendisk, and those parts already added to
> the list which happens after device_add_disk succeeded.

Ah yes I see that now. Will fix up. The tag also needs to be cleaned up.

  Luis

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

