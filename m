Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F67449AC4
	for <lists+dm-devel@lfdr.de>; Mon,  8 Nov 2021 18:31:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636392684;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nqwlsM7tjohTJ2mNcarCkhjwMSQlV6tBr+jPcxzT+Q0=;
	b=M6wTLRD6Mf0e3U6O02TikE1jPsLgxuSqzO+4fL2IJ1uflfy/p/5GJSsayJj1+OvSlD1vY2
	3aFnyC9kngFYWssFjMGEYQ81rwJYA1F3ZkcLKgF440unERFfszL5G6CBRlFNWkivy4w4SD
	roC14LGPoLtermLaO3CkCjScc9Yl7ts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-TAQLtqlJOYy8Z_ArN1Z-IA-1; Mon, 08 Nov 2021 12:31:22 -0500
X-MC-Unique: TAQLtqlJOYy8Z_ArN1Z-IA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2DB6804140;
	Mon,  8 Nov 2021 17:31:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7702860657;
	Mon,  8 Nov 2021 17:31:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A6A44A703;
	Mon,  8 Nov 2021 17:30:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A8HUlqL009637 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Nov 2021 12:30:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5BDCA100EA05; Mon,  8 Nov 2021 17:30:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B7071045D12;
	Mon,  8 Nov 2021 17:30:31 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1A8HUTLu030850; 
	Mon, 8 Nov 2021 11:30:29 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1A8HUSmv030849;
	Mon, 8 Nov 2021 11:30:28 -0600
Date: Mon, 8 Nov 2021 11:30:28 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20211108173028.GS19591@octiron.msp.redhat.com>
References: <1634757322-6015-1-git-send-email-bmarzins@redhat.com>
	<1634757322-6015-6-git-send-email-bmarzins@redhat.com>
	<2a319ae1e5eba66db17ab6372c95ac81f75a92e2.camel@suse.com>
	<33b4e4f8942ab340b4fba39e91c3d10e9c6aa402.camel@suse.com>
	<20211105214936.GO19591@octiron.msp.redhat.com>
	<c137193a6dbc7ea9ce25d06766874012de2f8ed0.camel@suse.com>
	<20211108162955.GR19591@octiron.msp.redhat.com>
	<40e458b6a89435469238548fe41a08bad57acad1.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <40e458b6a89435469238548fe41a08bad57acad1.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 5/7] multipathd: fully initialize paths added
 by update_pathvec_from_dm
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 08, 2021 at 04:55:37PM +0000, Martin Wilck wrote:
> On Mon, 2021-11-08 at 10:29 -0600, Benjamin Marzinski wrote:
> > On Fri, Nov 05, 2021 at 11:20:01PM +0000, Martin Wilck wrote:
> > > > 1: udev hasn't gotten an event for a device
> > > 
> > > I don't think we can detect this without listening for kernel
> > > uevents.
> > > And even if we listen to them, we could have missed some. udevd
> > > doesn't
> > > have an API for it, either, AFAIK.
> > 
> > Isn't this the most common INIT_PARTIAL case, where we are waiting
> > for
> > the coldplug uevent? If there is no database file when we are
> > processing
> > the device, we are in this state. Correct? 
> 
> Not necessarily. udev may have got an event, but not have finished
> processing it, or failed to process it entirely (e.g. because of a
> timeout, your case 2.). When udevd sees an "add" or "change" event for
> a device for the first time, creating the db entry is the last action
> it takes. During coldplug, udevd will receive a lot of events almost
> simultaneously, but it may take considerable time until it has
> processed them all.

Fair enough. So if the first uevent hasn't completed already
successfully, it's gonna be hard to know why.
 
> > > > 2: udev got an event but timed out or failed while processing it
> > > 
> > > This would be the USEC_INITIALIZED case, IMO
> > 
> > If udev has, in the past, successfully processed an event for a
> > device,
> > but fails while processing a later uevent, it doesn't keep th data
> > from
> > the previous event. So it could lose the uid_attribute. But the
> > database file should still exist. Correct?
> 
> That's true. But we can't do anything about it. libudev will return
> what the database currently contains, which is the content from the
> last successfuly processed "add" or "change" uevent, whether or not
> other uevents are in the queue or being processed. I don't think this
> scenario matters in the current discussion about partially initialized
> paths. This is the "changed wwid" scenario which I think we handle
> quite nicely today already. Or am I misunderstanding?

If both events occurred before multipathd started up, then this wouldn't
simply be a "changed WWID".  The hope is to be able to reliably
distinguish this from case 3, where the data from udev is fine, but the
uid_attribute still isn't there.

-Ben

> Cheers,
> Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

