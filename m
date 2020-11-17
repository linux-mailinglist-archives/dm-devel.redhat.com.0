Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F19902B6AF5
	for <lists+dm-devel@lfdr.de>; Tue, 17 Nov 2020 18:02:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605632527;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PqnJg61mvfGWkFOpLxsrmRMuekVL5kMe9cbOQPyS5X4=;
	b=bnhww2sfibBDpJ/fELIU4N9J6VsMGDJRxR8kv8Qz8N4YgeH8Feb3vL5dbyfducpsKfDoy6
	7Bdp4i+GHMsLZaEwrf/BIsgi24d6ItuSa4oEsnWzJo6dFt6yWgPiMJwwTBmAU/MTO61hq+
	2w51IRJSwRIvpVdGTSw8Gc5A8i5EzcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-Rv1QokzqNV2MYySgbuEdXg-1; Tue, 17 Nov 2020 12:02:01 -0500
X-MC-Unique: Rv1QokzqNV2MYySgbuEdXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE11A64097;
	Tue, 17 Nov 2020 17:01:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9741F100238C;
	Tue, 17 Nov 2020 17:01:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C59DD86BE8;
	Tue, 17 Nov 2020 17:01:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AHGA3wJ027874 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 17 Nov 2020 11:10:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8ED55176BB; Tue, 17 Nov 2020 16:10:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0A3C62934;
	Tue, 17 Nov 2020 16:09:59 +0000 (UTC)
Date: Tue, 17 Nov 2020 11:09:59 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201117160958.GB27085@redhat.com>
References: <20201116212020.1099154-1-hch@lst.de>
	<20201117154629.GA27085@redhat.com> <20201117155100.GA20977@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201117155100.GA20977@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, linux-block@vger.kernel.org
Subject: Re: [dm-devel] misc struct block_device related driver cleanups
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 17 2020 at 10:51am -0500,
Christoph Hellwig <hch@lst.de> wrote:

> On Tue, Nov 17, 2020 at 10:46:29AM -0500, Mike Snitzer wrote:
> > On Mon, Nov 16 2020 at  4:20pm -0500,
> > Christoph Hellwig <hch@lst.de> wrote:
> > 
> > > Hi Jens, Minchan and Mike,
> > > 
> > > this series cleans up a few interactions of driver with struct
> > > block_device, in preparation for big changes to struct block_device
> > > that I plan to send soon.
> > 
> > Thanks, I've picked up 5 and 6 for 5.11.
> 
> I actually need them in Jens' for-5.11/block tree for my next series..

Ah, OK.. no problem.

I'll reply with my Acked-by:s

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

