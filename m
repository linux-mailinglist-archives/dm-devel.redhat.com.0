Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA972A4F55
	for <lists+dm-devel@lfdr.de>; Tue,  3 Nov 2020 19:49:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604429367;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jcIqE4crss77D+7ZBJ//s7Qg0Uji7DCunNrbO8V5QwI=;
	b=LqvJdUTUBezHRyupY2gAqqEhc517GDSU7ruZ5oU0GxHJIxpDLcX8cHmBBr28Oel9oQZjJY
	S58sDzMhRqqYZ6E1wP9RSrmhn3I/wx6gFvF/mxvPmLq2bZeHSENZazz7Q0lkIe9ZaVZqRk
	tc1HvFsgbM7cH18QwoYisIF7xdRk9gE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-lryoTPjhM_Wrm4njUgBY-Q-1; Tue, 03 Nov 2020 13:49:24 -0500
X-MC-Unique: lryoTPjhM_Wrm4njUgBY-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56EF51868412;
	Tue,  3 Nov 2020 18:49:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B5435B4D7;
	Tue,  3 Nov 2020 18:49:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B656B85CD;
	Tue,  3 Nov 2020 18:48:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A3Imilj030364 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Nov 2020 13:48:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7BE4A6EF6E; Tue,  3 Nov 2020 18:48:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D11C16EF58;
	Tue,  3 Nov 2020 18:48:40 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0A3ImdGB019167; 
	Tue, 3 Nov 2020 12:48:39 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0A3Imct0019166;
	Tue, 3 Nov 2020 12:48:38 -0600
Date: Tue, 3 Nov 2020 12:48:36 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20201103184836.GB3384@octiron.msp.redhat.com>
References: <1603487708-12547-1-git-send-email-bmarzins@redhat.com>
	<1603487708-12547-6-git-send-email-bmarzins@redhat.com>
	<095833a0bcbc5f1bb792555b43ebf526553d0c99.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <095833a0bcbc5f1bb792555b43ebf526553d0c99.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 5/5] libmultipath: don't dlclose tur checker
	DSO
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 30, 2020 at 09:15:39PM +0000, Martin Wilck wrote:
> On Fri, 2020-10-23 at 16:15 -0500, Benjamin Marzinski wrote:
> > The multipathd tur checker thread is designed to be able to finish at
> > any time, even after the tur checker itself has been freed. The
> > multipathd shutdown code makes sure all the checkers have been freed
> > before freeing the checker_class and calling dlclose() to unload the
> > DSO, but this doesn't guarantee that the checker threads have
> > finished.
> > If one hasn't, the DSO will get unloaded while the thread still
> > running
> > code from it, causing a segfault. Unfortunately, it's not possible to
> > be
> > sure that all tur checker threads have ended during shutdown, without
> > making them joinable.
> > 
> > However, since libmultipath will never be reinitialized after it has
> > been uninitialzed, not dlclosing the tur checker DSO once a thread is
> > started has minimal cost (keeping the DSO code around until the
> > program
> > exits, which usually happens right after freeing the checkers).
> 
> I'm not against this, but have you considered using an atomic  refcount
> for the DSO? With every tur thread starting, we could increase it, and
> decrease it in the cleanup function of the thread when it exits. That
> should be safe. If the refcount was positive when we exit, we could
> refrain from unloading the DSO.
> 
> Regards,
> Martin

NAK. I apparently forgot to commit the version file changes.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

