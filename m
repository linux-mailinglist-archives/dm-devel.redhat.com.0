Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AA6482CB43F
	for <lists+dm-devel@lfdr.de>; Wed,  2 Dec 2020 06:15:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606886105;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bITD7fpxluM3HTPIq3yD2NPl5ebhtvMMA7Rp2i9DfwY=;
	b=LCJYlDtPrSbr/lAIfDcsYvz2iklGq1FevGdi/nfoi7lyDt7KkWo/HKK1QI7P6+jUcC5aZ7
	doKuFmGq3YTUeh371U+rQ++50qlXTTg56JpCFrTupTicKoQvZILnSgPhjmg3tzHaQRBbuk
	+CEOFtRfVyyETgEzVozlddrJIbnOCSA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-21zKmU1CNg6NLqBzS5Bqdg-1; Wed, 02 Dec 2020 00:15:03 -0500
X-MC-Unique: 21zKmU1CNg6NLqBzS5Bqdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 965BD1005E44;
	Wed,  2 Dec 2020 05:14:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF2D419C44;
	Wed,  2 Dec 2020 05:14:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 645DF180954D;
	Wed,  2 Dec 2020 05:14:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B25EgGn010869 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Dec 2020 00:14:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3547B5C1BD; Wed,  2 Dec 2020 05:14:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15AE15C1B4;
	Wed,  2 Dec 2020 05:14:38 +0000 (UTC)
Date: Wed, 2 Dec 2020 00:14:38 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <20201202051438.GB20535@redhat.com>
References: <20201201160709.31748-1-snitzer@redhat.com>
	<20201202033855.60882-1-jefflexu@linux.alibaba.com>
	<20201202033855.60882-2-jefflexu@linux.alibaba.com>
	<feb19a02-5ece-505f-e905-86dc84cdb204@linux.alibaba.com>
	<20201202050343.GA20535@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201202050343.GA20535@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com
Subject: Re: [dm-devel] dm: use gcd() to fix chunk_sectors limit stacking
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 02 2020 at 12:03am -0500,
Mike Snitzer <snitzer@redhat.com> wrote:

> What you've done here is fairly chaotic/disruptive:
> 1) you emailed a patch out that isn't needed or ideal, I dealt already
>    staged a DM fix in linux-next for 5.10-rcX, see:
>    https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.10-rcX&id=f28de262ddf09b635095bdeaf0e07ff507b3c41b
> 2) you replied to your patch and started referencing snippets of this
>    other patch's header (now staged for 5.10-rcX via Jens' block tree):
>    https://git.kernel.dk/cgit/linux-block/commit/?h=block-5.10&id=7e7986f9d3ba69a7375a41080a1f8c8012cb0923
>    - why not reply to _that_ patch in response something stated in it?

I now see you did reply to the original v2 patch:
https://www.redhat.com/archives/dm-devel/2020-December/msg00006.html

but you changed the Subject to have a "dm" prefix for some reason.
Strange but OK.. though it got really weird when you cut-and-paste your
other DM patch in reply at the bottom of your email.  If you find
yourself cross referencing emails and cutting and pasting like that, you
probably shouldn't.  Makes it chaotic for others to follow along.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

