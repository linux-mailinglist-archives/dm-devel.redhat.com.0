Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 633C02CE6C2
	for <lists+dm-devel@lfdr.de>; Fri,  4 Dec 2020 05:00:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607054408;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4DwNfF0ZaIEBYnjQdW4uRxMBqgIU42XfNFgsMrc+YAg=;
	b=BZ3CNB+84PBn0e2QZG3odXHuSFo7Egh3orPPE2+8lqpSj+GFhgyGXfatUXXfAP2LAmoV27
	OaLzz0Fba9KgQHFvcFekLyJH9mWwiBdC73rblcTe6SiM48kPngaOT1hxEX8afHiKDqBSL5
	Y+Irk7t3VUVmbtsJTGRBFjcKYWaS8rM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-JmIMJvcQOhWQayN5zQkoVA-1; Thu, 03 Dec 2020 23:00:06 -0500
X-MC-Unique: JmIMJvcQOhWQayN5zQkoVA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A2A5107ACE3;
	Fri,  4 Dec 2020 04:00:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0263A5D9CA;
	Fri,  4 Dec 2020 03:59:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD1254E58E;
	Fri,  4 Dec 2020 03:59:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B43xiO5014595 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 22:59:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 87E955C1D5; Fri,  4 Dec 2020 03:59:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from T590 (ovpn-12-155.pek2.redhat.com [10.72.12.155])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 244A05C1CF;
	Fri,  4 Dec 2020 03:59:28 +0000 (UTC)
Date: Fri, 4 Dec 2020 11:59:24 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20201204035924.GD661914@T590>
References: <20201130171805.77712-1-snitzer@redhat.com>
	<20201201160709.31748-1-snitzer@redhat.com>
	<20201203032608.GD540033@T590> <20201203143359.GA29261@redhat.com>
	<20201204011243.GB661914@T590> <20201204020343.GA32150@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201204020343.GA32150@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 03, 2020 at 09:03:43PM -0500, Mike Snitzer wrote:
> On Thu, Dec 03 2020 at  8:12pm -0500,
> Ming Lei <ming.lei@redhat.com> wrote:
> 
> > On Thu, Dec 03, 2020 at 09:33:59AM -0500, Mike Snitzer wrote:
> > > On Wed, Dec 02 2020 at 10:26pm -0500,
> > > Ming Lei <ming.lei@redhat.com> wrote:
> > > 
> > > > On Tue, Dec 01, 2020 at 11:07:09AM -0500, Mike Snitzer wrote:
> > > > > commit 22ada802ede8 ("block: use lcm_not_zero() when stacking
> > > > > chunk_sectors") broke chunk_sectors limit stacking. chunk_sectors must
> > > > > reflect the most limited of all devices in the IO stack.
> > > > > 
> > > > > Otherwise malformed IO may result. E.g.: prior to this fix,
> > > > > ->chunk_sectors = lcm_not_zero(8, 128) would result in
> > > > > blk_max_size_offset() splitting IO at 128 sectors rather than the
> > > > > required more restrictive 8 sectors.
> > > > 
> > > > What is the user-visible result of splitting IO at 128 sectors?
> > > 
> > > The VDO dm target fails because it requires IO it receives to be split
> > > as it advertised (8 sectors).
> > 
> > OK, looks VDO's chunk_sector limit is one hard constraint, even though it
> > is one DM device, so I guess you are talking about DM over VDO?
> > 
> > Another reason should be that VDO doesn't use blk_queue_split(), otherwise it
> > won't be a trouble, right?
> > 
> > Frankly speaking, if the stacking driver/device has its own hard queue limit
> > like normal hardware drive, the driver should be responsible for the splitting.
> 
> DM core does the splitting for VDO (just like any other DM target).
> In 5.9 I updated DM to use chunk_sectors, use blk_stack_limits()
> stacking of it, and also use blk_max_size_offset().
> 
> But all that block core code has shown itself to be too rigid for DM.  I
> tried to force the issue by stacking DM targets' ti->max_io_len with
> chunk_sectors.  But really I'd need to be able to pass in the per-target
> max_io_len to blk_max_size_offset() to salvage using it.
> 
> Stacking chunk_sectors seems ill-conceived.  One size-fits-all splitting
> is too rigid.

DM/VDO knows exactly it is one hard chunk_sectors limit, and DM shouldn't play
the stacking trick on VDO's chunk_sectors limit, should it?


Thanks, 
Ming

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

