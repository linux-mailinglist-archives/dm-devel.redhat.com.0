Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 832643F9F1D
	for <lists+dm-devel@lfdr.de>; Fri, 27 Aug 2021 20:46:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-5BDMAcUkPXyNybpnSTa7DA-1; Fri, 27 Aug 2021 14:46:06 -0400
X-MC-Unique: 5BDMAcUkPXyNybpnSTa7DA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68E1E10557CD;
	Fri, 27 Aug 2021 18:46:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43BDB6C8F7;
	Fri, 27 Aug 2021 18:45:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BFC194BB7C;
	Fri, 27 Aug 2021 18:45:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17RIh4OZ015517 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Aug 2021 14:43:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7114C10BFD94; Fri, 27 Aug 2021 18:43:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D55A10BFD9A
	for <dm-devel@redhat.com>; Fri, 27 Aug 2021 18:43:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A72F3101A52C
	for <dm-devel@redhat.com>; Fri, 27 Aug 2021 18:43:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-312-BVAHXfOTPP2E09--HZrGeg-1; Fri, 27 Aug 2021 14:42:57 -0400
X-MC-Unique: BVAHXfOTPP2E09--HZrGeg-1
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mJgoG-00Cyj5-C3; Fri, 27 Aug 2021 18:42:36 +0000
Date: Fri, 27 Aug 2021 11:42:36 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YSkyHINtV/djFEej@bombadil.infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
	<20210823202930.137278-7-mcgrof@kernel.org>
	<YSSN+eac2aCFXTAA@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YSSN+eac2aCFXTAA@infradead.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 24, 2021 at 07:13:13AM +0100, Christoph Hellwig wrote:
> On Mon, Aug 23, 2021 at 01:29:26PM -0700, Luis Chamberlain wrote:
> > We never checked for errors on add_disk() as this function
> > returned void. Now that this is fixed, use the shiny new
> > error handling.
> > 
> > The caller cleanups the disk already so all we need to do
> > is just pass along the return value.
> > 
> > Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> > ---
> >  drivers/mmc/core/block.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> > index 4c11f171e56d..4f12c6d1e1b5 100644
> > --- a/drivers/mmc/core/block.c
> > +++ b/drivers/mmc/core/block.c
> > @@ -2432,7 +2432,9 @@ static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
> >  	/* used in ->open, must be set before add_disk: */
> >  	if (area_type == MMC_BLK_DATA_AREA_MAIN)
> >  		dev_set_drvdata(&card->dev, md);
> > -	device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> > +	ret = device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> > +	if (ret)
> > +		goto out;
> 
> This needs to do a blk_cleanup_queue and also te kfree of md.

If mmc_blk_alloc_parts() fails mmc_blk_remove_req() is called which
does both for us?

 Luis

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

