Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 13D3F13774C
	for <lists+dm-devel@lfdr.de>; Fri, 10 Jan 2020 20:34:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578684855;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8zqffD5PKj0DXiX4k2kOFOVoA9oXXuxB8J7iqSdqkTo=;
	b=PWRS/mXty1EOOqfjxinG0MgbKSAXszi9a63slwi91TUMaMtoN2lPtNIvn41KIvO5evnqN1
	fl8sF9TsqDnOVbA43D0H+DAWluY+oeclPXcPlzDQsq4XPHVVldWkYOi4TGoiIw9HI4cOVn
	+TDrCaHBJ2RgrXQm2BV1YErNqdgpC/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-x8PQj_2PPWywnlMIDi89VA-1; Fri, 10 Jan 2020 14:34:13 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41DC28024FB;
	Fri, 10 Jan 2020 19:34:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DE9E86CA0;
	Fri, 10 Jan 2020 19:34:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E4981809567;
	Fri, 10 Jan 2020 19:33:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00AJXc9d006022 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Jan 2020 14:33:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 748101001925; Fri, 10 Jan 2020 19:33:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D05B81001902;
	Fri, 10 Jan 2020 19:33:35 +0000 (UTC)
Date: Fri, 10 Jan 2020 14:33:34 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Khazhismel Kumykov <khazhy@google.com>
Message-ID: <20200110193334.GA13817@redhat.com>
References: <20200102224512.3605010-1-krisman@collabora.com>
	<20200106162833.GA15829@redhat.com>
	<CACGdZYK25G5BqQeG2AeF9JvwhXOtcFRxxwqGdRugnPC+vYJHXQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGdZYK25G5BqQeG2AeF9JvwhXOtcFRxxwqGdRugnPC+vYJHXQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Frank Mayhar <fmayhar@google.com>, dm-devel@redhat.com,
	Anatol Pomazau <anatol@google.com>,
	Bharath Ravi <rbharath@google.com>, kernel@collabora.com,
	Gabriel Krisman Bertazi <krisman@collabora.com>, agk@redhat.com
Subject: Re: [dm-devel] dm mpath: Add timeout mechanism for queue_if_no_path
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
X-MC-Unique: x8PQj_2PPWywnlMIDi89VA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jan 06 2020 at  4:52pm -0500,
Khazhismel Kumykov <khazhy@google.com> wrote:

> On Mon, Jan 6, 2020 at 11:28 AM Mike Snitzer <snitzer@redhat.com> wrote:
> >
> > On Thu, Jan 02 2020 at  5:45pm -0500,
> > Gabriel Krisman Bertazi <krisman@collabora.com> wrote:
> >
> > > From: Anatol Pomazau <anatol@google.com>
> > >
> > > Add a configurable timeout mechanism to disable queue_if_no_path without
> > > assistance from multipathd.  In reality, this reimplements the
> > > no_path_retry mechanism from multipathd in kernel space, which is
> > > interesting for cases where we cannot rely on a daemon being present all
> > > the time, in case of failure or to reduce the guest footprint of cloud
> > > services.
> > >
> > > Despite replicating the policy configuration on kernel space, it is
> > > quite an important case to prevent IOs from hanging forever, waiting for
> > > userspace to behave correctly.
> > >
> > > Co-developed-by: Frank Mayhar <fmayhar@google.com>
> > > Signed-off-by: Frank Mayhar <fmayhar@google.com>
> > > Co-developed-by: Bharath Ravi <rbharath@google.com>
> > > Signed-off-by: Bharath Ravi <rbharath@google.com>
> > > Co-developed-by: Khazhismel Kumykov <khazhy@google.com>
> > > Signed-off-by: Khazhismel Kumykov <khazhy@google.com>
> > > Signed-off-by: Anatol Pomazau <anatol@google.com>
> > > Co-developed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> > > Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> >
> > This seems like a slippery slope.
> >
> > I've heard this line of dm-multipath concern from Google before
> > (e.g. doesn't want to rely on availability of userspace component).
> >
> > Thing is, to properly use dm-multipath (e.g. to reinstate failed paths)
> > multipathd really is needed no?
> Yeah, in order to reinstate the failed paths, or any full recovery, we
> do need the user space component to be running, and this doesn't aim
> to change the responsibilities here. Rather, we're aiming to avoid
> in-kernel hangs/processes lingering indefinitely in unkillable sleep
> due to buggy/unavailable/down userspace multipath daemon.

Sorry but the above patch header clearly states:
"or to reduce the guest footprint of cloud services"

Which implies that multipathd isn't available by design in the
referenced environment.

> >
> > If not, how is it that the proposed patch is all that is missing when
> > multipathd isn't running?  I find that hard to appreciate.
> >
> > So I'm inclined to not accept this type of change.  But especially not
> > until more comprehensive context is given for how Google is using
> > dm-multipath without multipathd.
> 
> This patch isn't aimed at enabling dm-multipath without a userspace
> multipath daemon, rather to avoid processes hanging indefinitely in
> the event the daemon is unable to proceed (for whatever reason).

Again, I don't buy it given the patch header explicitly says
dm-multipath could be deployed in the cloud without the benefit of
multipathd running.

But I'll meet you half-way to start: rather than make the timeout
configurable on a per multipath table basis, please just set a longer
stopgap default and allow that timeout value to be configured with a
module parameter (e.g. dm_multipath.queue_if_no_path_timeout=120,
and setting it to 0 disables the timeout).

This would follow the same pattern that was established by DM
thin-provisioning's no_space_timeout modparm with these commits:
85ad643b dm thin: add timeout to stop out-of-data-space mode holding IO forever
80c57893 dm thin: add 'no_space_timeout' dm-thin-pool module param

That'd save us from having to do a bunch of fiddley DM multpath table
parsing for now.  But if for some crazy reason in the future it is
determined that a longer duration stop-gap timeout cannot be
one-size-fits-all we can layer per device configuration in at that
time.

How does that sound?

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

