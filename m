Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB763485E8
	for <lists+dm-devel@lfdr.de>; Thu, 25 Mar 2021 01:31:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616632273;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lH4YUdt4XhGTyLzSMqZoyI1mcIXpPnvQh9iaegPE/2Q=;
	b=Yf5dVDFselnvBDfS7pketraJUUHljux2rIjoBfX68yZR32hzJkvsJWbW0OJNepaaizXujk
	pjSdIbgX5vzTl3GRuP5hoq+hNtfLXAqgrzSMoHbTiP8ThEgUzlj0W60R458YjEPfrx3gdR
	5ZOggZjMj6qJxOerc3ip+c0P8hbT74U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-kf15mqGDNPaWkXfraqVtiQ-1; Wed, 24 Mar 2021 20:31:11 -0400
X-MC-Unique: kf15mqGDNPaWkXfraqVtiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C16A9801FCE;
	Thu, 25 Mar 2021 00:31:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10118712A5;
	Thu, 25 Mar 2021 00:31:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C1591809C83;
	Thu, 25 Mar 2021 00:30:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12P0UXe4022416 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Mar 2021 20:30:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 08D1B6C354; Thu, 25 Mar 2021 00:30:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-137.pek2.redhat.com [10.72.12.137])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8906963BA7;
	Thu, 25 Mar 2021 00:30:20 +0000 (UTC)
Date: Thu, 25 Mar 2021 08:30:16 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YFvZmB0LKCQRkoSG@T590>
References: <20210324121927.362525-1-ming.lei@redhat.com>
	<20210324121927.362525-4-ming.lei@redhat.com>
	<YFuCHvUFwhYRNa6Z@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YFuCHvUFwhYRNa6Z@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH V3 03/13] block: add helper of
	blk_create_io_context
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 24, 2021 at 07:17:02PM +0100, Christoph Hellwig wrote:
> On Wed, Mar 24, 2021 at 08:19:17PM +0800, Ming Lei wrote:
> > Add one helper for creating io context and prepare for supporting
> > efficient bio based io poll.
> 
> Looking at what gets added later here I do not think this helper is
> a good idea.  Having a separate one for creating any needed poll-only
> context is a lot more clear.

The poll context actually depends on io_context, that is why I put them
all into one single helper.

thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

