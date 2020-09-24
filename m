Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CAC0B2765D2
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 03:28:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600910886;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SLwbB9S0S+gjcziwDmmozALCwn2xyZ5rsWob+i50OH4=;
	b=OhzFP+8mCr4K+Fn/jRe290bJ8+wseQUchQBSw2qX03aDEENUtqtKYSMtoTcOFp7G3CUx07
	wuUzWv5Ftyvf43hM/2z7E7qTe1bssUR0JTKGBxVN13qe3mRlP+Z5EHHqnI1OeB3QWVTrfx
	nKLptcPyC1qfddODyuB9Rj3QNuh+Mb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-A7yXdbTvOTy8wLoOR97frA-1; Wed, 23 Sep 2020 21:28:04 -0400
X-MC-Unique: A7yXdbTvOTy8wLoOR97frA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF44B1005E72;
	Thu, 24 Sep 2020 01:27:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4BFE78822;
	Thu, 24 Sep 2020 01:27:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 669A0183D040;
	Thu, 24 Sep 2020 01:27:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08O1Rbxk002341 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 21:27:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 048DF1975E; Thu, 24 Sep 2020 01:27:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33D481972B;
	Thu, 24 Sep 2020 01:27:33 +0000 (UTC)
Date: Wed, 23 Sep 2020 21:27:32 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com>
Message-ID: <20200924012732.GA10766@redhat.com>
References: <1600281606-1446-1-git-send-email-sudhakar.panneerselvam@oracle.com>
	<3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
MIME-Version: 1.0
In-Reply-To: <3be1ea32-b6a8-41ef-a9ba-ed691434d068@default>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Damien.LeMoal@wdc.com, ssudhakarp@gmail.com,
	Martin Petersen <martin.petersen@oracle.com>, dm-crypt@saout.de,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

You've clearly done a nice job with these changes.  Looks clean.

BUT, I'm struggling to just accept that dm-crypt needs to go to these
extra lengths purely because of one bad apple usecase.

These alignment constraints aren't new.  Are there other portions of
Linux's crypto subsystem that needed comparable fixes in order to work
with Microsfot OS initiated IO through a guest?

You forecast that these same kinds of changes are needed for AEAD and
dm-integrity... that's alarming.

Are we _certain_ there is no other way forward?
(Sorry I don't have suggestions.. I'm in "fact finding mode" ;)

Thanks,
Mike

On Wed, Sep 23 2020 at  1:01pm -0400,
Sudhakar Panneerselvam <sudhakar.panneerselvam@oracle.com> wrote:

> Could someone review this patch set, please?
> 
> Thanks
> Sudhakar
> 
> > -----Original Message-----
> > From: Sudhakar Panneerselvam
> > Sent: Wednesday, September 16, 2020 12:40 PM
> > To: agk@redhat.com; snitzer@redhat.com; dm-devel@redhat.com
> > Cc: Shirley Ma <shirley.ma@oracle.com>; ssudhakarp@gmail.com; Martin
> > Petersen <martin.petersen@oracle.com>
> > Subject: [dm-devel] [RFC PATCH 0/2] dm crypt: Allow unaligned buffer lengths
> > for skcipher devices
> > 
> > Hi,
> > 
> > This changeset allows processing of unaligned bio requests in dm crypt
> > for the I/Os generated from a windows guest OS in a QEMU environment. If
> > this changeset is accepted, then I will be submitting another changeset that
> > addresses the similar issue in AEAD disks and dm-integrity module.
> > 
> > Thanks
> > Sudhakar
> > 
> > Sudhakar Panneerselvam (2):
> >   dm crypt: Allow unaligned bio buffer lengths for skcipher devices
> >   dm crypt: Handle unaligned bio buffer lengths for lmk and tcw
> > 
> >  drivers/md/dm-crypt.c | 154 +++++++++++++++++++++++++++++++++++----
> > -----------
> >  1 file changed, 108 insertions(+), 46 deletions(-)
> > 
> > --
> > 1.8.3.1
> > 
> > --
> > dm-devel mailing list
> > dm-devel@redhat.com
> > https://www.redhat.com/mailman/listinfo/dm-devel
> > 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

