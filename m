Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CC2C9276823
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 07:14:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-Tcr7fwV-PfOmT73hHRC6Rg-1; Thu, 24 Sep 2020 01:14:54 -0400
X-MC-Unique: Tcr7fwV-PfOmT73hHRC6Rg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A1AD1084C91;
	Thu, 24 Sep 2020 05:14:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EC643A40;
	Thu, 24 Sep 2020 05:14:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D42A37A00B;
	Thu, 24 Sep 2020 05:14:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08O5EXts026404 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 01:14:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74E3710FF10; Thu, 24 Sep 2020 05:14:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F75810FF17
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 05:14:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78DB98007DF
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 05:14:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-259-kJ08jl1gMbCgQcM3PDPeRA-1;
	Thu, 24 Sep 2020 01:14:23 -0400
X-MC-Unique: kJ08jl1gMbCgQcM3PDPeRA-1
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
	[172.10.235.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F099A2311A;
	Thu, 24 Sep 2020 05:14:20 +0000 (UTC)
Date: Wed, 23 Sep 2020 22:14:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200924051419.GA16103@sol.localdomain>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
	<3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
	<20200924012732.GA10766@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200924012732.GA10766@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien.LeMoal@wdc.com, ssudhakarp@gmail.com,
	Martin Petersen <martin.petersen@oracle.com>, dm-crypt@saout.de,
	Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>,
	dm-devel@redhat.com, Shirley Ma <shirley.ma@oracle.com>,
	mpatocka@redhat.com, Milan Broz <gmazyland@gmail.com>, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer
 lengths for skcipher devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 23, 2020 at 09:27:32PM -0400, Mike Snitzer wrote:
> You've clearly done a nice job with these changes.  Looks clean.
> 
> BUT, I'm struggling to just accept that dm-crypt needs to go to these
> extra lengths purely because of one bad apple usecase.
> 
> These alignment constraints aren't new.  Are there other portions of
> Linux's crypto subsystem that needed comparable fixes in order to work
> with Microsfot OS initiated IO through a guest?
> 
> You forecast that these same kinds of changes are needed for AEAD and
> dm-integrity... that's alarming.
> 
> Are we _certain_ there is no other way forward?
> (Sorry I don't have suggestions.. I'm in "fact finding mode" ;)
> 

I don't understand why this is needed, since dm-crypt already sets its
logical_block_size to its crypto sector_size.  Isn't it expected that I/O that
isn't aligned to logical_block_size fails?  It's the I/O submitter's
responsibility to ensure logical_block_size alignment of all I/O segments.
Exactly how is the misaligned I/O actually being submitted here?

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

