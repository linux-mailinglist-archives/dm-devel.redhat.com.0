Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8B12E0FA2
	for <lists+dm-devel@lfdr.de>; Tue, 22 Dec 2020 22:07:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608671271;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1JAeAfTeyO4c3JjT/l/kNb6NLzRgGd2UHD+46n5J+ws=;
	b=hcV853AND2rskSxcQ3xEocuFgUS4BExeIySdGohtPtcurNFs638XDZvBZl0cqom5+uhE1f
	/u50AdYyZtckGzAuhTAUXEOX3b0aj9Hka/Cr5K2BlNEMZQ4eeiGrD6yDU0ctZsxSWmFeMy
	e2IOm4/9y4eLnpubJD1GsHeUxwuNT5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-tUf9yiMIOQG6nC1QdenZvQ-1; Tue, 22 Dec 2020 16:07:49 -0500
X-MC-Unique: tUf9yiMIOQG6nC1QdenZvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB5DF10054FF;
	Tue, 22 Dec 2020 21:07:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F86A60BF1;
	Tue, 22 Dec 2020 21:07:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9326180954D;
	Tue, 22 Dec 2020 21:07:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BML6FuN001656 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 22 Dec 2020 16:06:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4AE0E60C69; Tue, 22 Dec 2020 21:06:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 130E060BF1;
	Tue, 22 Dec 2020 21:06:06 +0000 (UTC)
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1kror6-0008DP-Kd; Tue, 22 Dec 2020 21:06:04 +0000
Date: Tue, 22 Dec 2020 21:06:04 +0000
From: Alasdair G Kergon <agk@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20201222210604.GD29336@agk.fab.redhat.com>
Mail-Followup-To: Hannes Reinecke <hare@suse.de>,
	Mike Snitzer <snitzer@redhat.com>, Christoph Hellwig <hch@lst.de>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jens Axboe <axboe@kernel.dk>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Alasdair G Kergon <agk@redhat.com>
References: <20201222095056.7a5ac0a0@canb.auug.org.au>
	<20201222131528.GA29822@lst.de> <20201222145327.GC12885@redhat.com>
	<288d1c58-c0e2-9d6f-4816-48c66536fe8b@suse.de>
Mime-Version: 1.0
In-Reply-To: <288d1c58-c0e2-9d6f-4816-48c66536fe8b@suse.de>
User-Agent: Mutt/1.4.1i
Organization: Red Hat UK Ltd. Registered in England and Wales,
	number 03798903. Registered Office: Amberley Place,
	107-111 Peascod Street, Windsor, Berkshire, SL4 1TE.
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Christoph Hellwig <hch@lst.de>, Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] DM's filesystem lookup in dm_get_dev_t() [was: Re:
	linux-next: manual merge of the device-mapper tree with Linus' tree]
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 22, 2020 at 06:24:09PM +0100, Hannes Reinecke wrote:
> However, lookup_bdev() now always recurses into the filesystem, causing 
> multipath to stall in an all-paths-down scenario.
 
I have not read the background about whatever the new problem is - I'm
jumping in cold seeing this message - but from the very beginning of
device-mapper we have strongly recommended that userspace supplies the
block device in the form MAJOR:MINOR and all our own tools do that.  We
guarantee not to deadlock in these places when this is done.

We also accept the device in the form of a path name as we know there
are times when this is safe and convenient, but then we offer no
guarantees - we place the responsibility upon userspace only to do this
when it knows it is safe to do so i.e. no race and no deadlock.

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

