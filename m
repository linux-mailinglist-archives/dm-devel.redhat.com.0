Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAD4243F22
	for <lists+dm-devel@lfdr.de>; Thu, 13 Aug 2020 21:05:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597345499;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PiQn1xzy7TAHlkWteXvd9+JtyRUnjSB0WjmW/FfeRI0=;
	b=EYJJOF5W4lRpUWiWkbsPs8g4mZD/fX+C5W1MZOkxeCu4fYLMoNapoqx91SQaLqGbBIHdBN
	dYenj6KwtUERmdYBysc0T6QuMUIdnDgPjbFB36i35T34wEw6z/eTrqdWdFl61qH2e9eMmc
	ZaepW2Bl3akrRA8icUu/odH+wXHyHTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-VjjZ48UzOrOVWOIrh7yptQ-1; Thu, 13 Aug 2020 15:04:54 -0400
X-MC-Unique: VjjZ48UzOrOVWOIrh7yptQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 503521005504;
	Thu, 13 Aug 2020 19:04:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E0046FDB3;
	Thu, 13 Aug 2020 19:04:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 601884EE14;
	Thu, 13 Aug 2020 19:04:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DJ3jE3017719 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 15:03:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DBD6D62A37; Thu, 13 Aug 2020 19:03:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD61F6F9C9;
	Thu, 13 Aug 2020 19:03:42 +0000 (UTC)
Date: Thu, 13 Aug 2020 15:03:42 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200813190342.GA6607@redhat.com>
References: <20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
	<20200810143620.GA19127@redhat.com>
	<20200810172209.GA19535@redhat.com>
	<20200813144811.GA5452@redhat.com>
	<20200813153623.GA30905@infradead.org>
	<20200813174704.GA6137@redhat.com>
	<20200813184349.GA8191@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200813184349.GA8191@infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
	dm-devel@redhat.com, Ewan Milne <emilne@redhat.com>,
	Chao Leng <lengchao@huawei.com>, Keith Busch <kbusch@kernel.org>,
	"Meneghini, John" <John.Meneghini@netapp.com>
Subject: Re: [dm-devel] [RESEND PATCH] nvme: explicitly use normal NVMe
 error handling when appropriate
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Aug 13 2020 at  2:43pm -0400,
Christoph Hellwig <hch@infradead.org> wrote:

> On Thu, Aug 13, 2020 at 01:47:04PM -0400, Mike Snitzer wrote:
> > This is just a tweak to improve the high-level fault tree of core NVMe
> > error handling.  No functional change, but for such basic errors,
> > avoiding entering nvme_failover_req is meaningful on a code flow level.
> > Makes code to handle errors that need local retry clearer by being more
> > structured, less circuitous.
> > 
> > Allows NVMe core's handling of such errors to be more explicit and live
> > in core.c rather than multipath.c -- so things like ACRE handling can be
> > made explicitly part of core and not nested under nvme_failover_req's
> > relatively obscure failsafe that returns false for anything it doesn't
> > care about.
> 
> If we're going that way I'd rather do something like the (untested)
> patch below that adds a dispostion function with a function that
> decides it and then just switches on it:

YES!  That is such a huge improvement (certainly on a code clarity
level).  I haven't reviewed or tested the relative performance or
function of before vs after (will do) but I really like this approach.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

