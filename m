Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D8E3B3FBE4B
	for <lists+dm-devel@lfdr.de>; Mon, 30 Aug 2021 23:29:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630358950;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nRwYv/DPgq1mEwKXdrMF2RF8bj33pD+udPu425110xk=;
	b=XD1P+j4yZUzXqj8ZPGLa3K+TwKOoH0Oc+KAp0qc4+Y3WJ/bmVRFciQNRRUUdjDoZ6A94LR
	0CLWAlEw8CrfNqzABk1HSesaUvkGplCo8BZceQ65IQ9WkIeQucnEmZSXuP4LxlyMdZQY9p
	1YEV0e1AV3M2BlCKr45607tiIFw7P7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-fDnD2bYzPtK_iQCpT93Q6w-1; Mon, 30 Aug 2021 17:28:27 -0400
X-MC-Unique: fDnD2bYzPtK_iQCpT93Q6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76ECE1008066;
	Mon, 30 Aug 2021 21:28:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 522BA10023AC;
	Mon, 30 Aug 2021 21:28:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4AFD44A7C9;
	Mon, 30 Aug 2021 21:28:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17ULSHLs008859 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Aug 2021 17:28:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2F172226E2; Mon, 30 Aug 2021 21:28:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CF5D60939;
	Mon, 30 Aug 2021 21:28:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 17ULSBaa022803; 
	Mon, 30 Aug 2021 16:28:11 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 17ULSBuJ022802;
	Mon, 30 Aug 2021 16:28:11 -0500
Date: Mon, 30 Aug 2021 16:28:10 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20210830212810.GB3087@octiron.msp.redhat.com>
References: <1627595165-19980-1-git-send-email-bmarzins@redhat.com>
	<1627595165-19980-4-git-send-email-bmarzins@redhat.com>
	<a6c0dff1b97512eb4150969894de22c3d2d0efc8.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <a6c0dff1b97512eb4150969894de22c3d2d0efc8.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/5] multipath: print warning if multipathd
 is not running.
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 12, 2021 at 10:23:09AM +0000, Martin Wilck wrote:
> On Do, 2021-07-29 at 16:46 -0500, Benjamin Marzinski wrote:
> > If multipath notices that multipath devices exist or were created,
> > and
> > multipathd is not running, it now prints a warning message, so users
> > are
> > notified of the issue.
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> I'm not sure about this. Are there zero valid use cases for using
> multipath without multipathd?

There certainly are. That's why I tried to limit the warning to only
cases where the user was creating, reloading, or listing devices and
found/created some. In testing, sure, you might want multipathd
disabled, but in general, if you have multipath devices, you want
multipathd running.  If you have it temporarily disabled for some
reason, I don't see much harm in having multipath remind you of that.

> On production systems, I agree,
> multipathd should always be running. Personally wouldn't want to see
> this warning every time I run "multipath" while multipathd is
> (temporarily) disabled. Have you got user requests for this feature?

Well, Support has requested this.  Apparently they have repeatedly seen
cases where people don't have any multipath devices present, because
multipathd is not running.  They run multipath, the devices appear, and
they move on, unaware that multipathd isn't running for whatever
reason.
 
> In particular, I dislike the idea of putting this code into
> libmultipath. I would love to get rid of the "is_daemon" logic some
> day. If at all, the detection of the situation and the warning should
> be implemented in multipath, IMO.

Sure. I can rework this to keep the logic inside multipath,

> The message should be prefixed with the word "Warning: " to make sure
> the admin understands that he's supposed to take action.

Makes sense.

-Ben

> Regards,
> Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

