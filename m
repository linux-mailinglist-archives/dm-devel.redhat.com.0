Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B688D342278
	for <lists+dm-devel@lfdr.de>; Fri, 19 Mar 2021 17:53:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616172808;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=crFdvstGFny7m5PdTYXQmEs+StjERZzn14f8ypdydv8=;
	b=HlVd1uKcFkmus7QZZnlsz5DA2+5v9dtX7peINlKBD5wD9vDl6tlgSwsO4iSpMgpJ3x/Bwg
	ZKY45Gp7TFLuVGZ3nZmVEtAJSmqUGtBS25emBpno4jlMaGmK0Z6+GkQj4XLyZ46qkQH8Dg
	dhQMgBBLY46Lfbt8GPjXZMWHhCnL1s0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-Q6Gz0aOUPx2AkMEjVkvlbQ-1; Fri, 19 Mar 2021 12:53:21 -0400
X-MC-Unique: Q6Gz0aOUPx2AkMEjVkvlbQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 812FD1009456;
	Fri, 19 Mar 2021 16:53:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3EC65D9E3;
	Fri, 19 Mar 2021 16:53:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16F294BB7C;
	Fri, 19 Mar 2021 16:53:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12JGqowM014276 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Mar 2021 12:52:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 95B046090F; Fri, 19 Mar 2021 16:52:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 715F060CD0;
	Fri, 19 Mar 2021 16:52:42 +0000 (UTC)
Date: Fri, 19 Mar 2021 12:52:42 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20210319165241.GA9938@redhat.com>
References: <20210318164827.1481133-1-ming.lei@redhat.com>
	<20210318164827.1481133-2-ming.lei@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210318164827.1481133-2-ming.lei@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 18 2021 at 12:48pm -0400,
Ming Lei <ming.lei@redhat.com> wrote:

> There has been 3 users, and will be more, so add one such helper.
> 
> Signed-off-by: Ming Lei <ming.lei@redhat.com>

Not sure if you're collecting Reviewed-by or Acked-by at this point?
Seems you dropped Chaitanya's Reviewed-by to v1:
https://listman.redhat.com/archives/dm-devel/2021-March/msg00166.html

Do you plan to iterate a lot more before you put out a non-RFC?  For
this RFC v2, I'll withhold adding any of my Reviewed-by tags and just
reply where I see things that might need folding into the next
iteration.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

