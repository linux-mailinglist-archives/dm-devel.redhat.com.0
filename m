Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 614BA2685D5
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 09:27:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-wCNW9lETNqKFLV1KclzmCw-1; Mon, 14 Sep 2020 03:27:00 -0400
X-MC-Unique: wCNW9lETNqKFLV1KclzmCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C412C8030A4;
	Mon, 14 Sep 2020 07:26:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A293B7B7B0;
	Mon, 14 Sep 2020 07:26:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D69D1832FDE;
	Mon, 14 Sep 2020 07:26:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08E2hH92030512 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 13 Sep 2020 22:43:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EE56C1111422; Mon, 14 Sep 2020 02:43:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E969F1111420
	for <dm-devel@redhat.com>; Mon, 14 Sep 2020 02:43:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63E92800962
	for <dm-devel@redhat.com>; Mon, 14 Sep 2020 02:43:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-295-0UWBXU06O5yppppqhhicIg-1;
	Sun, 13 Sep 2020 22:43:09 -0400
X-MC-Unique: 0UWBXU06O5yppppqhhicIg-1
Received: from dhcp-10-100-145-180.wdl.wdc.com (unknown [199.255.45.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 11D58217BA;
	Mon, 14 Sep 2020 02:43:08 +0000 (UTC)
Date: Sun, 13 Sep 2020 19:43:06 -0700
From: Keith Busch <kbusch@kernel.org>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20200914024306.GA3657769@dhcp-10-100-145-180.wdl.wdc.com>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-4-snitzer@redhat.com>
	<20200912140630.GC210077@T590>
MIME-Version: 1.0
In-Reply-To: <20200912140630.GC210077@T590>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:23:33 -0400
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>,
	Vijayendra Suman <vijayendra.suman@oracle.com>
Subject: Re: [dm-devel] [PATCH 3/3] block: allow 'chunk_sectors' to be
	non-power-of-2
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
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Sep 12, 2020 at 10:06:30PM +0800, Ming Lei wrote:
> On Fri, Sep 11, 2020 at 05:53:38PM -0400, Mike Snitzer wrote:
> > It is possible for a block device to use a non power-of-2 for chunk
> > size which results in a full-stripe size that is also a non
> > power-of-2.
> > 
> > Update blk_queue_chunk_sectors() and blk_max_size_offset() to
> > accommodate drivers that need a non power-of-2 chunk_sectors.
> > 
> > Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> > ---
> >  block/blk-settings.c   | 10 ++++------
> >  include/linux/blkdev.h | 12 +++++++++---
> >  2 files changed, 13 insertions(+), 9 deletions(-)
> > 
> > diff --git a/block/blk-settings.c b/block/blk-settings.c
> > index b09642d5f15e..e40a162cc946 100644
> > --- a/block/blk-settings.c
> > +++ b/block/blk-settings.c
> > @@ -172,15 +172,13 @@ EXPORT_SYMBOL(blk_queue_max_hw_sectors);
> >   *
> >   * Description:
> >   *    If a driver doesn't want IOs to cross a given chunk size, it can set
> > - *    this limit and prevent merging across chunks. Note that the chunk size
> > - *    must currently be a power-of-2 in sectors. Also note that the block
> > - *    layer must accept a page worth of data at any offset. So if the
> > - *    crossing of chunks is a hard limitation in the driver, it must still be
> > - *    prepared to split single page bios.
> > + *    this limit and prevent merging across chunks. Note that the block layer
> > + *    must accept a page worth of data at any offset. So if the crossing of
> > + *    chunks is a hard limitation in the driver, it must still be prepared
> > + *    to split single page bios.
> >   **/
> >  void blk_queue_chunk_sectors(struct request_queue *q, unsigned int chunk_sectors)
> >  {
> > -	BUG_ON(!is_power_of_2(chunk_sectors));
> >  	q->limits.chunk_sectors = chunk_sectors;
> >  }
> >  EXPORT_SYMBOL(blk_queue_chunk_sectors);
> > diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> > index 453a3d735d66..e72bcce22143 100644
> > --- a/include/linux/blkdev.h
> > +++ b/include/linux/blkdev.h
> > @@ -1059,11 +1059,17 @@ static inline unsigned int blk_queue_get_max_sectors(struct request_queue *q,
> >  static inline unsigned int blk_max_size_offset(struct request_queue *q,
> >  					       sector_t offset)
> >  {
> > -	if (!q->limits.chunk_sectors)
> > +	unsigned int chunk_sectors = q->limits.chunk_sectors;
> > +
> > +	if (!chunk_sectors)
> >  		return q->limits.max_sectors;
> >  
> > -	return min(q->limits.max_sectors, (unsigned int)(q->limits.chunk_sectors -
> > -			(offset & (q->limits.chunk_sectors - 1))));
> > +	if (is_power_of_2(chunk_sectors))
> > +		chunk_sectors -= (offset & (chunk_sectors - 1));
> > +	else
> > +		chunk_sectors -= sector_div(offset, chunk_sectors);
> > +
> > +	return min(q->limits.max_sectors, chunk_sectors);
> >  }
> >  
> >  static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
> > -- 
> > 2.15.0
> > 
> 
> is_power_of_2() is cheap enough for fast path, so looks fine to support
> non-power-of-2 chunk sectors.
> 
> Maybe NVMe PCI can remove the power_of_2() limit too.

I'd need to see the justification for that. The boundary is just a
suggestion in NVMe. The majority of IO never crosses it so the
calculation is usually wasted CPU cycles. Crossing the boundary is going
to have to be very costly on the device side in order to justify the
host side per-IO overhead for a non-power-of-2 split. 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

