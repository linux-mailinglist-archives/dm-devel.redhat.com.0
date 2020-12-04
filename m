Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A574F2CE58F
	for <lists+dm-devel@lfdr.de>; Fri,  4 Dec 2020 03:11:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607047896;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L6HE03qw3Owx3wJjb6bMity+k33R8/AMZgZLdpsfxEU=;
	b=HcBllXWbOlO8EFelvgK3bWTdoo9hiZGh+Ni5boEiurMv35voieUunKLSYHM8fNERsRQ/DM
	+t22fY5LjXfbVJyWq0Klv3JH3uVJd6M57ZY42H/F+B+QgSg8RjgVzH7fePo3jmxXkEHylU
	iIq6Md1u9hIyTzsO3iBUUNNRS3QTspc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-uZ96YlpnNbeWpzW7i9fyww-1; Thu, 03 Dec 2020 21:11:34 -0500
X-MC-Unique: uZ96YlpnNbeWpzW7i9fyww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BCF9107ACE3;
	Fri,  4 Dec 2020 02:11:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF011189A5;
	Fri,  4 Dec 2020 02:11:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B4D84A7C6;
	Fri,  4 Dec 2020 02:11:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B42BHK1002711 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 21:11:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C1A836085A; Fri,  4 Dec 2020 02:11:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDB4160854;
	Fri,  4 Dec 2020 02:11:09 +0000 (UTC)
Date: Thu, 3 Dec 2020 21:11:08 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>, hare@suse.de
Message-ID: <20201204021108.GB32150@redhat.com>
References: <20201130171805.77712-1-snitzer@redhat.com>
	<20201201160709.31748-1-snitzer@redhat.com>
	<20201203032608.GD540033@T590> <20201203143359.GA29261@redhat.com>
	<20201203162738.GA3404013@dhcp-10-100-145-180.wdc.com>
	<20201204014535.GC661914@T590>
MIME-Version: 1.0
In-Reply-To: <20201204014535.GC661914@T590>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, martin.petersen@oracle.com, jdorminy@redhat.com,
	bjohnsto@redhat.com, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Keith Busch <kbusch@kernel.org>
Subject: Re: [dm-devel] [PATCH v2] block: use gcd() to fix chunk_sectors
	limit stacking
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 03 2020 at  8:45pm -0500,
Ming Lei <ming.lei@redhat.com> wrote:

> On Thu, Dec 03, 2020 at 08:27:38AM -0800, Keith Busch wrote:
> > On Thu, Dec 03, 2020 at 09:33:59AM -0500, Mike Snitzer wrote:
> > > On Wed, Dec 02 2020 at 10:26pm -0500,
> > > Ming Lei <ming.lei@redhat.com> wrote:
> > > 
> > > > I understand it isn't related with correctness, because the underlying
> > > > queue can split by its own chunk_sectors limit further. So is the issue
> > > > too many further-splitting on queue with chunk_sectors 8? then CPU
> > > > utilization is increased? Or other issue?
> > > 
> > > No, this is all about correctness.
> > > 
> > > Seems you're confining the definition of the possible stacking so that
> > > the top-level device isn't allowed to have its own hard requirements on
> > > IO sizes it sends to its internal implementation.  Just because the
> > > underlying device can split further doesn't mean that the top-level
> > > virtual driver can service larger IO sizes (not if the chunk_sectors
> > > stacking throws away the hint the virtual driver provided because it
> > > used lcm_not_zero).
> > 
> > I may be missing something obvious here, but if the lower layers split
> > to their desired boundary already, why does this limit need to stack?
> > Won't it also work if each layer sets their desired chunk_sectors
> > without considering their lower layers? The commit that initially
> > stacked chunk_sectors doesn't provide any explanation.
> 
> There could be several reasons:
> 
> 1) some limits have to be stacking, such as logical block size, because
> lower layering may not handle un-aligned IO
> 
> 2) performance reason, if every limits are stacked on topmost layer, in
> theory IO just needs to be splitted in top layer, and not need to be
> splitted further from all lower layer at all. But there should be exceptions
> in unusual case, such as, lowering queue's limit changed after the stacking
> limits are setup.
> 
> 3) history reason, bio splitting is much younger than stacking queue
> limits.
> 
> Maybe others?

Hannes didn't actually justify why he added chunk_sectors to
blk_stack_limits:

commit 987b3b26eb7b19960160505faf9b2f50ae77e14d
Author: Hannes Reinecke <hare@suse.de>
Date:   Tue Oct 18 15:40:31 2016 +0900

    block: update chunk_sectors in blk_stack_limits()

    Signed-off-by: Hannes Reinecke <hare@suse.com>
    Signed-off-by: Damien Le Moal <damien.lemoal@hgst.com>
    Reviewed-by: Christoph Hellwig <hch@lst.de>
    Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
    Reviewed-by: Shaun Tancheff <shaun.tancheff@seagate.com>
    Tested-by: Shaun Tancheff <shaun.tancheff@seagate.com>
    Signed-off-by: Jens Axboe <axboe@fb.com>

Likely felt it needed for zoned or NVMe devices.. dunno.

But given how we now have a model where block core, or DM core, will
split as needed I don't think normalizing chunk_sectors (to the degree
full use of blk_stack_limits does) and than using it as basis for
splitting makes a lot of sense.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

