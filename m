Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5057A22E723
	for <lists+dm-devel@lfdr.de>; Mon, 27 Jul 2020 09:59:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-zTOHaiU7Pbe8Hy3zWRz1-w-1; Mon, 27 Jul 2020 03:59:08 -0400
X-MC-Unique: zTOHaiU7Pbe8Hy3zWRz1-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1A911DE2;
	Mon, 27 Jul 2020 07:58:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8137F60F96;
	Mon, 27 Jul 2020 07:58:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F054E4EDB7;
	Mon, 27 Jul 2020 07:58:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06R7wUpW008521 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 03:58:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 467691000DB3; Mon, 27 Jul 2020 07:58:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 421B91000DB2
	for <dm-devel@redhat.com>; Mon, 27 Jul 2020 07:58:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D9A68007C9
	for <dm-devel@redhat.com>; Mon, 27 Jul 2020 07:58:28 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-28-IWNr3NkNPa23KbdSU0AQbw-1;
	Mon, 27 Jul 2020 03:58:25 -0400
X-MC-Unique: IWNr3NkNPa23KbdSU0AQbw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 630C468B05; Mon, 27 Jul 2020 09:58:22 +0200 (CEST)
Date: Mon, 27 Jul 2020 09:58:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Minchan Kim <minchan@kernel.org>
Message-ID: <20200727075822.GA5355@lst.de>
References: <20200726150333.305527-1-hch@lst.de>
	<20200726150333.305527-11-hch@lst.de>
	<20200726190639.GA560221@google.com>
MIME-Version: 1.0
In-Reply-To: <20200726190639.GA560221@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	cgroups@vger.kernel.org, drbd-dev@tron.linbit.com,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH 10/14] bdi: remove BDI_CAP_SYNCHRONOUS_IO
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sun, Jul 26, 2020 at 12:06:39PM -0700, Minchan Kim wrote:
> > @@ -528,8 +530,7 @@ static ssize_t backing_dev_store(struct device *dev,
> >  	 * freely but in fact, IO is going on so finally could cause
> >  	 * use-after-free when the IO is really done.
> >  	 */
> > -	zram->disk->queue->backing_dev_info->capabilities &=
> > -			~BDI_CAP_SYNCHRONOUS_IO;
> > +	zram->disk->fops = &zram_wb_devops;
> >  	up_write(&zram->init_lock);
> 
> For zram, regardless of BDI_CAP_SYNCHRONOUS_IO, it have used rw_page
> every time on read/write path. This one with next patch will make zram
> use bio instead of rw_page when it's declared !BDI_CAP_SYNCHRONOUS_IO,
> which introduce regression for performance.

It really should not matter, as the overhead of setting up a bio
is minimal.  It also is only used in the legacy mpage buffered I/O
code outside of the swap code, which has so many performance issues on
its own that even if this made a difference it wouldn't matter.

If you want magic treatment for your zram swap code you really need
to integrate it with the swap code instead of burding the block layer
with all this mess.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

