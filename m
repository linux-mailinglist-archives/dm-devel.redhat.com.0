Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 85088365B5E
	for <lists+dm-devel@lfdr.de>; Tue, 20 Apr 2021 16:41:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618929684;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2UxGCMJnl4xmkH/CbdI2610PIvKAZgKLz+dx63ssmD4=;
	b=eBP8P5Ft5etd1BHrr3RqMpb1R3ljp0na66VEyki6DyyvGi2ndlhYYfEKqqJBFx9ri3pR9p
	pS4grX5SFvumWt2pNAMTt5HMCdIZ2zbvDfK1kSLTSF+jfl0pRaFEUEGNu1KOuYnhE5Yhna
	7/iw2Y5XcloPP2lm1LDmy8osYoqIso8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-xKYeBwv2PoieuUW0_6U9Wg-1; Tue, 20 Apr 2021 10:41:20 -0400
X-MC-Unique: xKYeBwv2PoieuUW0_6U9Wg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4685B64157;
	Tue, 20 Apr 2021 14:41:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAC565D9CD;
	Tue, 20 Apr 2021 14:41:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0092644A58;
	Tue, 20 Apr 2021 14:41:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13KEcukI007663 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 20 Apr 2021 10:38:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E5F681B5C0; Tue, 20 Apr 2021 14:38:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AD2C60916;
	Tue, 20 Apr 2021 14:38:53 +0000 (UTC)
Date: Tue, 20 Apr 2021 10:38:52 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210420143852.GB14523@redhat.com>
References: <20210416235329.49234-1-snitzer@redhat.com>
	<20210420093720.GA28874@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210420093720.GA28874@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-nvme@lists.infradead.org
Subject: Re: [dm-devel] [PATCH v3 0/4] nvme: improve error handling and
 ana_state to work well with dm-multipath
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

On Tue, Apr 20 2021 at  5:37am -0400,
Christoph Hellwig <hch@lst.de> wrote:

> > RHEL9 is coming, would really prefer that these changes land upstream
> > rather than carry them within RHEL.
> 
> We've told from the very beginning that dm-multipth on nvme is not
> a support configuration.

You have some high quality revisionist history there. But other than
pointing that out I'm not going to dwell on our past discussions on how
NVMe multipathing would be.

> Red Hat decided to ignore that and live with the pain.

Red Hat supports both native nvme-multipath _and_ DM-multipath on NVMe.

The only "pain" I've been living with is trying to get you to be
impartial and allow others to provide Linux multipathing as they see
fit.

> Your major version change is a chance to fix this up on the Red Hat
> side, not to resubmit bogus patches upstream.

Please spare me the vapid and baseless assertion about patches you
refuse to review technically without political motivation.

> In other words: please get your house in order NOW.

My simple 3 patch submission was an attempt to do so. Reality is the
Linux NVMe maintainers need to get their collective house in order.

Until sanity prevails these NVMe changes will be carried in RHEL. And if
you go out of your way to cause trivial, or elaborate, conflicts now
that you _know_ that changes that are being carried it will be handled
without issue.

Sad this is where we are but it is what it is.

Linux is about choice that is founded upon need. Hostile action that
unilaterally limits choice is antithetical to Linux and Open Source.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

