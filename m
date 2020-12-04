Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7C82CE4CC
	for <lists+dm-devel@lfdr.de>; Fri,  4 Dec 2020 02:13:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607044419;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gL8XAJ+FVZKtVNYxSEQzOlICl4y+GAEJ1x9/TWhN3HY=;
	b=F+Y9RRbZDpL65yN4sMDmvZy3n7bGBoSGmkmidWXFZfguaVLwe9/GLciXnWqwPFWcTSmA4G
	rFe5C+v9u9FIuvK9Jm8UdEqbpHJELnR893G2lmSt82tsTD+SaoUwZ7N8KlfJwCyBHlZTPn
	tpzepcQRQdyWkPl6Z6xUuOCxzRNJiYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-wtYbv2swO4y9xbwQv3xG7w-1; Thu, 03 Dec 2020 20:13:37 -0500
X-MC-Unique: wtYbv2swO4y9xbwQv3xG7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAD9F107ACE6;
	Fri,  4 Dec 2020 01:13:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A02585C1B4;
	Fri,  4 Dec 2020 01:13:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B8E24A7C6;
	Fri,  4 Dec 2020 01:13:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B41D4Oa028465 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 20:13:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 33393189B6; Fri,  4 Dec 2020 01:13:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-155.pek2.redhat.com [10.72.12.155])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB8FB189B8;
	Fri,  4 Dec 2020 01:12:47 +0000 (UTC)
Date: Fri, 4 Dec 2020 09:12:43 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20201204011243.GB661914@T590>
References: <20201130171805.77712-1-snitzer@redhat.com>
	<20201201160709.31748-1-snitzer@redhat.com>
	<20201203032608.GD540033@T590> <20201203143359.GA29261@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203143359.GA29261@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, martin.petersen@oracle.com, jdorminy@redhat.com,
	bjohnsto@redhat.com, linux-block@vger.kernel.org, dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 03, 2020 at 09:33:59AM -0500, Mike Snitzer wrote:
> On Wed, Dec 02 2020 at 10:26pm -0500,
> Ming Lei <ming.lei@redhat.com> wrote:
> 
> > On Tue, Dec 01, 2020 at 11:07:09AM -0500, Mike Snitzer wrote:
> > > commit 22ada802ede8 ("block: use lcm_not_zero() when stacking
> > > chunk_sectors") broke chunk_sectors limit stacking. chunk_sectors must
> > > reflect the most limited of all devices in the IO stack.
> > > 
> > > Otherwise malformed IO may result. E.g.: prior to this fix,
> > > ->chunk_sectors = lcm_not_zero(8, 128) would result in
> > > blk_max_size_offset() splitting IO at 128 sectors rather than the
> > > required more restrictive 8 sectors.
> > 
> > What is the user-visible result of splitting IO at 128 sectors?
> 
> The VDO dm target fails because it requires IO it receives to be split
> as it advertised (8 sectors).

OK, looks VDO's chunk_sector limit is one hard constraint, even though it
is one DM device, so I guess you are talking about DM over VDO?

Another reason should be that VDO doesn't use blk_queue_split(), otherwise it
won't be a trouble, right?

Frankly speaking, if the stacking driver/device has its own hard queue limit
like normal hardware drive, the driver should be responsible for the splitting.

> 
> > I understand it isn't related with correctness, because the underlying
> > queue can split by its own chunk_sectors limit further. So is the issue
> > too many further-splitting on queue with chunk_sectors 8? then CPU
> > utilization is increased? Or other issue?
> 
> No, this is all about correctness.
> 
> Seems you're confining the definition of the possible stacking so that
> the top-level device isn't allowed to have its own hard requirements on

I just don't know this story, thanks for your clarification.

As I mentioned above, if the stacking driver has its own hard queue
limit, it should be the driver's responsibility to respect it via
blk_queue_split() or whatever.


Thanks,
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

