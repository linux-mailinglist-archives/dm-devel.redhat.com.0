Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 50750316EBF
	for <lists+dm-devel@lfdr.de>; Wed, 10 Feb 2021 19:35:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612982105;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2g0KxIx1kb8wq7Jb/0/c+AJi2AMQ5Xx2TUKWNbp/sRg=;
	b=BcLQVZ2NHpBrrLpkNv4fLhyAddzD0ha9eeVJyVIavjNccBIQkOuWC6xd74U82PM78Sd3pY
	EzRm6uclXvlVDPmNhoH5Hj74jUoyLCipWIWmydoOnQz4sWKEGext2OzvNDFjibGGCWE+/e
	gTvu+lpRDSyaTsEsy5N/l2vKo9tl9Wg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-_evETvCvPfeVrA2a4galSQ-1; Wed, 10 Feb 2021 13:35:02 -0500
X-MC-Unique: _evETvCvPfeVrA2a4galSQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1365E91275;
	Wed, 10 Feb 2021 18:34:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D618A60C17;
	Wed, 10 Feb 2021 18:34:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E320385F0;
	Wed, 10 Feb 2021 18:34:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11AIYVaQ031125 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Feb 2021 13:34:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D95FB18EC5; Wed, 10 Feb 2021 18:34:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A7D960C5C;
	Wed, 10 Feb 2021 18:34:31 +0000 (UTC)
Date: Wed, 10 Feb 2021 13:34:30 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Ming Hung Tsai <mtsai@redhat.com>
Message-ID: <20210210183430.GB7904@redhat.com>
References: <20210122152556.24822-1-ntsironis@arrikto.com>
	<CALjSBEuWgLHiPwkrMCpUWWV3VOOO98ZydCrzs1_qvCjSnyO5GQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALjSBEuWgLHiPwkrMCpUWWV3VOOO98ZydCrzs1_qvCjSnyO5GQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, agk@redhat.com, ntsironis@arrikto.com,
	Edward Thornber <ejt@redhat.com>
Subject: Re: [dm-devel] [PATCH 0/4] dm era: Various minor fixes
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

On Wed, Feb 10 2021 at 12:56pm -0500,
Ming Hung Tsai <mtsai@redhat.com> wrote:

> On Fri, Jan 22, 2021 at 11:30 PM Nikos Tsironis <ntsironis@arrikto.com> wrote:
> >
> > While working on fixing the bugs that cause lost writes, for which I
> > have sent separate emails, I bumped into several other minor issues that
> > I fix in this patch set.
> >
> > In particular, this series of commits introduces the following fixes:
> >
> > 1. Add explicit check that the data block size hasn't changed
> > 2. Fix bitset memory leaks. The in-core bitmaps were never freed.
> > 3. Fix the writeset tree equality test function to use the right value
> >    size.
> > 4. Remove unreachable resize operation in pre-resume function.
> >
> > More information about the fixes can be found in their commit messages.
> >
> > Nikos Tsironis (4):
> >   dm era: Verify the data block size hasn't changed
> >   dm era: Fix bitset memory leaks
> >   dm era: Use correct value size in equality function of writeset tree
> >   dm era: Remove unreachable resize operation in pre-resume function
> >
> >  drivers/md/dm-era-target.c | 27 ++++++++++++++++-----------
> >  1 file changed, 16 insertions(+), 11 deletions(-)
> 
> For the series, except 4/4 where I haven't tried other solutions.
> 
> Reviewed-by: Ming-Hung Tsai <mtsai@redhat.com>

patchwork doesn't parse this, so it falls on me to backfill tags like
this.  In the future, please reply to each patch with your desired tag.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

