Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE73345CA2
	for <lists+dm-devel@lfdr.de>; Tue, 23 Mar 2021 12:18:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616498302;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fQtJTXTILyJ5fdebM34gh4VxEzjvUioqw8m5p/it8v0=;
	b=CJ4dih8Vbwda4OqUmhvGVSVjpzChZREvThCnr/EaYbZBENI0Q3sTFnrNhedV5yaH0FlQsv
	78r6nZtX9gGNfxCbNRD+r34H/30x8BRDTPc4mzbN6z/fy0srLqr7tvQrL7jttzoNWaRbO7
	Cfi8xo4wQXFHVxGtjU3YH3tFX6egmEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-5tgi4GIEMau1nDok_ddahA-1; Tue, 23 Mar 2021 07:18:20 -0400
X-MC-Unique: 5tgi4GIEMau1nDok_ddahA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E240E8030B5;
	Tue, 23 Mar 2021 11:18:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DEA36A8EA;
	Tue, 23 Mar 2021 11:18:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 876CE1809C83;
	Tue, 23 Mar 2021 11:18:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NBHqeb023318 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 07:17:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4AAAC10074FC; Tue, 23 Mar 2021 11:17:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-13-171.pek2.redhat.com [10.72.13.171])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FD871002D71;
	Tue, 23 Mar 2021 11:17:38 +0000 (UTC)
Date: Tue, 23 Mar 2021 19:17:31 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <YFnOS23G0OcL34RI@T590>
References: <20210318164827.1481133-1-ming.lei@redhat.com>
	<20210318164827.1481133-2-ming.lei@redhat.com>
	<20210319165241.GA9938@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210319165241.GA9938@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [RFC PATCH V2 01/13] block: add helper of
	blk_queue_poll
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

On Fri, Mar 19, 2021 at 12:52:42PM -0400, Mike Snitzer wrote:
> On Thu, Mar 18 2021 at 12:48pm -0400,
> Ming Lei <ming.lei@redhat.com> wrote:
> 
> > There has been 3 users, and will be more, so add one such helper.
> > 
> > Signed-off-by: Ming Lei <ming.lei@redhat.com>
> 
> Not sure if you're collecting Reviewed-by or Acked-by at this point?
> Seems you dropped Chaitanya's Reviewed-by to v1:
> https://listman.redhat.com/archives/dm-devel/2021-March/msg00166.html

Sorry, that should be an accident.

> 
> Do you plan to iterate a lot more before you put out a non-RFC?  For
> this RFC v2, I'll withhold adding any of my Reviewed-by tags and just
> reply where I see things that might need folding into the next
> iteration.

If no one objects the basic approach taken in V2, I will remove RFC in
V3.

-- 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

