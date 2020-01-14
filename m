Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3809413B010
	for <lists+dm-devel@lfdr.de>; Tue, 14 Jan 2020 17:54:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579020841;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ac9IrF84GxMaBKjgYPCTRw7elIlhtSgc5LARrElvcvA=;
	b=UoFr+vlSfeGpDgDDqq3gDfE2D5aT+jSZR6VdTIcTbPRG4ZkXIxa4y2B12KO92NKtLF0fEq
	Fr28JrfxlcgJrNK3jMYEvTIsz4I04xXmK/ftzQTRhXsL5JivmifutCjqa+iag2F/ZRHHUG
	oLe4RgFfhAs7fSFDojIJmCnpOgueV3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-nmhT52s_OFK4yZzy2Vvw1w-1; Tue, 14 Jan 2020 11:53:58 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 818378D9916;
	Tue, 14 Jan 2020 16:53:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C31780A48;
	Tue, 14 Jan 2020 16:53:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E54A18089CD;
	Tue, 14 Jan 2020 16:53:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EGrWtx022409 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 11:53:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BE7DF675AF; Tue, 14 Jan 2020 16:53:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 331EA842AA;
	Tue, 14 Jan 2020 16:53:30 +0000 (UTC)
Date: Tue, 14 Jan 2020 11:53:29 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200114165329.GA11499@redhat.com>
References: <20200113224127.3367484-1-krisman@collabora.com>
	<20200114161505.GA48507@lobo> <85pnfmyp7t.fsf@collabora.com>
MIME-Version: 1.0
In-Reply-To: <85pnfmyp7t.fsf@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, kernel@collabora.com, khazhy@google.com
Subject: Re: [dm-devel] [PATCH v2] dm mpath: Add timeout mechanism for
	queue_if_no_path
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
X-MC-Unique: nmhT52s_OFK4yZzy2Vvw1w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jan 14 2020 at 11:31am -0500,
Gabriel Krisman Bertazi <krisman@collabora.com> wrote:

> Mike Snitzer <snitzer@redhat.com> writes:
> 
> > On Mon, Jan 13 2020 at  5:41P -0500,
> > Gabriel Krisman Bertazi <krisman@collabora.com> wrote:
> >
> >> From: Anatol Pomazau <anatol@google.com>
> >> 
> >> Add a configurable timeout mechanism to disable queue_if_no_path without
> >> assistance from multipathd.  In reality, this reimplements the
> >> no_path_retry mechanism from multipathd in kernel space, which is
> >> interesting to prevent processes from hanging indefinitely in cases
> >> where the daemon might be unable to respond, after a failure or for
> >> whatever reason.
> >> 
> >> Despite replicating the policy configuration on kernel space, it is
> >> quite an important case to prevent IOs from hanging forever, waiting for
> >> userspace to behave correctly.
> >> 
> >> v2:
> >>   - Use a module parameter instead of configuring per table
> >>   - Simplify code
> >> 
> >> Co-developed-by: Frank Mayhar <fmayhar@google.com>
> >> Signed-off-by: Frank Mayhar <fmayhar@google.com>
> >> Co-developed-by: Bharath Ravi <rbharath@google.com>
> >> Signed-off-by: Bharath Ravi <rbharath@google.com>
> >> Co-developed-by: Khazhismel Kumykov <khazhy@google.com>
> >> Signed-off-by: Khazhismel Kumykov <khazhy@google.com>
> >> Signed-off-by: Anatol Pomazau <anatol@google.com>
> >> Co-developed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> >> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> >
> > All these tags seem rather excessive (especially in that you aren't cc
> > most of them on the submission).  Please review/scrub.  Just seems odd
> > that so many had a hand in this relatively small patch.
> 
> Hey,
> 
> I removed some of the Cc's because those emails addresses were bouncing.
> Still, I kept the lines for credits.  I got the bounces when sending v1.

Hmm, if their emails bounce, not a lot of point detailing them.

> > The Signed-off-by for anatol@google.com seems wrong, or did Anatol
> > shephard this patch at some point?  Or did you mean Reviewed-by?
> > Something else?
> 
> Anatol was the main author, as listed in the From: header.  This
> seems correct with regard to the ordering rules of
> Documentation/process/submitting-patches.rst, in particular the second
> example, (Example of a patch submitted by a Co-developed-by: author::).
> 
> Am I missing something?

No, I missed that Anatol is main author.  I'd have noticed once I
applied the patch via 'git am' but...

> 
> >
> > Anyway, if in the end you hold these tags to reflect the development
> > evolution of this patch then so be it ;)
> >
> > I've reviewed the changes and found various things I felt were
> > worthwhile to modify.  Summary:
> >
> > - included missing <linux/timer.h>
> > - added MODULE_PARM_DESC
> > - moved new functions to reduce needed forward declarations
> > - tweaked queue_if_no_path_timeout_work's DMWARN message
> > - added lockdep_assert_held to enable_nopath_timeout
> > - renamed static queue_if_no_path_timeout to queue_if_no_path_timeout_secs
> > - use READ_ONCE when accessing queue_if_no_path_timeout_secs
> >
> 
> The changes you made look good to me and your version of the patch
> passes my testcase.

OK, thanks.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

