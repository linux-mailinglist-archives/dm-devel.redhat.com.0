Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 299554A8BE7
	for <lists+dm-devel@lfdr.de>; Thu,  3 Feb 2022 19:50:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643914247;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DGQtjlXGxphxoQiNKm0rsLuK3tiOVGJq0hDUkycO5oI=;
	b=UshyAA6WDwyN875HiBMxECsYESmw9OoZqwM+U2Of9foLoWrNHqec2g49G2cY/ya5vGaNR1
	VwkQhjrwbyWq2CPnOOtq90fLchvN9hz1cT0pZHFfInbEVPDkxPEk3PL2O+RpX/AC4sJpmJ
	bkdPK8zqkEGPVbzm/DkcwEXFFb2pzhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-EL8fii2SPbesSNLhP6AyMg-1; Thu, 03 Feb 2022 13:50:45 -0500
X-MC-Unique: EL8fii2SPbesSNLhP6AyMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D91A83DD26;
	Thu,  3 Feb 2022 18:50:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB4704CED9;
	Thu,  3 Feb 2022 18:50:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C5BE4BB7B;
	Thu,  3 Feb 2022 18:50:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 213Io7GQ003831 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Feb 2022 13:50:07 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 53C614CEDB; Thu,  3 Feb 2022 18:50:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CCAB78A2D;
	Thu,  3 Feb 2022 18:50:07 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 213Io6kR004427; Thu, 3 Feb 2022 13:50:06 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 213Io6eX004423; Thu, 3 Feb 2022 13:50:06 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 3 Feb 2022 13:50:06 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <efd2e976-4d2d-178e-890d-9bde1a89c47f@acm.org>
Message-ID: <alpine.LRH.2.02.2202031310530.28604@file01.intranet.prod.int.rdu2.redhat.com>
References: <f0e19ae4-b37a-e9a3-2be7-a5afb334a5c3@nvidia.com>
	<20220201102122.4okwj2gipjbvuyux@mpHalley-2>
	<alpine.LRH.2.02.2202011327350.22481@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2202011331570.22481@file01.intranet.prod.int.rdu2.redhat.com>
	<efd2e976-4d2d-178e-890d-9bde1a89c47f@acm.org>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Subject: Re: [dm-devel] [RFC PATCH 1/3] block: add copy offload support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Tue, 1 Feb 2022, Bart Van Assche wrote:

> On 2/1/22 10:32, Mikulas Patocka wrote:
> >   /**
> > + * blk_queue_max_copy_sectors - set maximum copy offload sectors for the
> > queue
> > + * @q:  the request queue for the device
> > + * @size:  the maximum copy offload sectors
> > + */
> > +void blk_queue_max_copy_sectors(struct request_queue *q, unsigned int size)
> > +{
> > +	q->limits.max_copy_sectors = size;
> > +}
> > +EXPORT_SYMBOL_GPL(blk_queue_max_copy_sectors);
> 
> Please either change the unit of 'size' into bytes or change its type into
> sector_t.

blk_queue_chunk_sectors, blk_queue_max_discard_sectors, 
blk_queue_max_write_same_sectors, blk_queue_max_write_zeroes_sectors, 
blk_queue_max_zone_append_sectors also have the unit of sectors and the 
argument is "unsigned int". Should blk_queue_max_copy_sectors be 
different?

> > +extern int blkdev_issue_copy(struct block_device *bdev1, sector_t sector1,
> > +		      struct block_device *bdev2, sector_t sector2,
> > +		      sector_t nr_sects, sector_t *copied, gfp_t gfp_mask);
> > +
> 
> Only supporting copying between contiguous LBA ranges seems restrictive to me.
> I expect garbage collection by filesystems for UFS devices to perform better
> if multiple LBA ranges are submitted as a single SCSI XCOPY command.

NVMe has a possibility to copy multiple source ranges into one destination 
range. But I think that leveraging this capability would just make the 
code excessively complex.

> A general comment about the approach: encoding the LBA range information in a
> bio payload is not compatible with bio splitting. How can the dm driver
> implement copy offloading without the ability to split copy offload bio's?

I don't expect the copy bios to be split.

One possibility is to just return -EOPNOTSUPP and fall back to explicit 
copy if the bio crosses dm target boundary (that's what my previous patch 
for SCSI XCOPY did).

Another possibility is to return the split boundary in the token and retry 
both bios will smaller length. But this approach would prevent us from 
submitting the REQ_OP_COPY_WRITE_TOKEN bios asynchronously.

I'm not sure which of these two approaches is better.

> > +int blkdev_issue_copy(struct block_device *bdev1, sector_t sector1,
> > +		      struct block_device *bdev2, sector_t sector2,
> > +		      sector_t nr_sects, sector_t *copied, gfp_t gfp_mask)
> > +{
> > +	struct page *token;
> > +	sector_t m;
> > +	int r = 0;
> > +	struct completion comp;
> 
> Consider using DECLARE_COMPLETION_ONSTACK() instead of a separate declaration
> and init_completion() call.

OK.

> Thanks,
> 
> Bart.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

