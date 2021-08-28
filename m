Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D40A23FA457
	for <lists+dm-devel@lfdr.de>; Sat, 28 Aug 2021 09:35:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-q6ZjcBjbPhat2OeEHK6b8w-1; Sat, 28 Aug 2021 03:35:11 -0400
X-MC-Unique: q6ZjcBjbPhat2OeEHK6b8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA0C21853027;
	Sat, 28 Aug 2021 07:35:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FE095D9FC;
	Sat, 28 Aug 2021 07:35:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0FF91181A0F1;
	Sat, 28 Aug 2021 07:35:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17S7Yu86008617 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 28 Aug 2021 03:34:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 072812022EC7; Sat, 28 Aug 2021 07:34:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0310B2022EC6
	for <dm-devel@redhat.com>; Sat, 28 Aug 2021 07:34:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73CA7101A52C
	for <dm-devel@redhat.com>; Sat, 28 Aug 2021 07:34:53 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-572-_bxfNA4yMTeTUMF3unMbLw-1; Sat, 28 Aug 2021 03:34:51 -0400
X-MC-Unique: _bxfNA4yMTeTUMF3unMbLw-1
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
	Linux)) id 1mJsp1-00FNRa-6I; Sat, 28 Aug 2021 07:32:22 +0000
Date: Sat, 28 Aug 2021 08:32:11 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <YSnme1mfHS/HCguW@infradead.org>
References: <20210823202930.137278-1-mcgrof@kernel.org>
	<20210823202930.137278-7-mcgrof@kernel.org>
	<YSSN+eac2aCFXTAA@infradead.org>
	<YSkyHINtV/djFEej@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <YSkyHINtV/djFEej@bombadil.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: ulf.hansson@linaro.org, snitzer@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	agk@redhat.com, beanhuo@micron.com, ming.lei@redhat.com,
	sagi@grimberg.me, linux-scsi@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>, jejb@linux.ibm.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 27, 2021 at 11:42:36AM -0700, Luis Chamberlain wrote:
> > >  	if (area_type == MMC_BLK_DATA_AREA_MAIN)
> > >  		dev_set_drvdata(&card->dev, md);
> > > -	device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> > > +	ret = device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> > > +	if (ret)
> > > +		goto out;
> > 
> > This needs to do a blk_cleanup_queue and also te kfree of md.
> 
> If mmc_blk_alloc_parts() fails mmc_blk_remove_req() is called which
> does both for us?

Yes, but only for the main gendisk, and those parts already added to
the list which happens after device_add_disk succeeded.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

