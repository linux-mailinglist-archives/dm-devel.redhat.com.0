Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DE70F2CE550
	for <lists+dm-devel@lfdr.de>; Fri,  4 Dec 2020 02:46:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607046383;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gWFHqCNU1hzQ3PceekXhAdc4rBvL3XaeA4CbMdlFUTo=;
	b=T5+DKQfdKMSr0qFtPsZFAZLur8zJcBaqpvuVq3tteqRQ5rgDA2Nrqw+ThppWp8teRoATxK
	j/Okp/UUC82OWh5dndx0sNtS9sDdnRinvbRkkMEI6fgRNLZb2SoK+h1TvmoSn5HJqgY8cL
	Y7GkteHx1Dvaq5CvoEe7D6er8RsDcXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-qDJLK23ZMmeeMApYgsnKvw-1; Thu, 03 Dec 2020 20:46:22 -0500
X-MC-Unique: qDJLK23ZMmeeMApYgsnKvw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02B6F2AB;
	Fri,  4 Dec 2020 01:46:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B4FF1A890;
	Fri,  4 Dec 2020 01:46:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DA864A7C6;
	Fri,  4 Dec 2020 01:46:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B41jtMC031368 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 20:45:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AE63A1A8A2; Fri,  4 Dec 2020 01:45:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-155.pek2.redhat.com [10.72.12.155])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A24D1A890;
	Fri,  4 Dec 2020 01:45:40 +0000 (UTC)
Date: Fri, 4 Dec 2020 09:45:35 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Keith Busch <kbusch@kernel.org>
Message-ID: <20201204014535.GC661914@T590>
References: <20201130171805.77712-1-snitzer@redhat.com>
	<20201201160709.31748-1-snitzer@redhat.com>
	<20201203032608.GD540033@T590> <20201203143359.GA29261@redhat.com>
	<20201203162738.GA3404013@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
In-Reply-To: <20201203162738.GA3404013@dhcp-10-100-145-180.wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, martin.petersen@oracle.com, jdorminy@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, bjohnsto@redhat.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 03, 2020 at 08:27:38AM -0800, Keith Busch wrote:
> On Thu, Dec 03, 2020 at 09:33:59AM -0500, Mike Snitzer wrote:
> > On Wed, Dec 02 2020 at 10:26pm -0500,
> > Ming Lei <ming.lei@redhat.com> wrote:
> > 
> > > I understand it isn't related with correctness, because the underlying
> > > queue can split by its own chunk_sectors limit further. So is the issue
> > > too many further-splitting on queue with chunk_sectors 8? then CPU
> > > utilization is increased? Or other issue?
> > 
> > No, this is all about correctness.
> > 
> > Seems you're confining the definition of the possible stacking so that
> > the top-level device isn't allowed to have its own hard requirements on
> > IO sizes it sends to its internal implementation.  Just because the
> > underlying device can split further doesn't mean that the top-level
> > virtual driver can service larger IO sizes (not if the chunk_sectors
> > stacking throws away the hint the virtual driver provided because it
> > used lcm_not_zero).
> 
> I may be missing something obvious here, but if the lower layers split
> to their desired boundary already, why does this limit need to stack?
> Won't it also work if each layer sets their desired chunk_sectors
> without considering their lower layers? The commit that initially
> stacked chunk_sectors doesn't provide any explanation.

There could be several reasons:

1) some limits have to be stacking, such as logical block size, because
lower layering may not handle un-aligned IO

2) performance reason, if every limits are stacked on topmost layer, in
theory IO just needs to be splitted in top layer, and not need to be
splitted further from all lower layer at all. But there should be exceptions
in unusual case, such as, lowering queue's limit changed after the stacking
limits are setup.

3) history reason, bio splitting is much younger than stacking queue
limits.

Maybe others?


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

