Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3FC2413F8
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 01:53:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597103627;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xD/ma/OCva4gohWpYlm2wtahEdE/07sBs+rwIIF6Dgs=;
	b=FPqSFZrOvphDWE1Z2ZztTM/E1UBHVILNu3nlibEY4hFPnSYTgOGbkdc/dkaQjFVxnGCZZW
	WOT0NKckMvi/dZj4GWBox38sLFjjvRVLIiO6CYDHkl84ZYuWdlFx9Ov9TvnOxqVlTnaYF4
	9zizPlwRi2knEbfNZAGzOWEl1pGH7dQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-JXK9IdO8MvaMdU3BBhzDBg-1; Mon, 10 Aug 2020 19:53:45 -0400
X-MC-Unique: JXK9IdO8MvaMdU3BBhzDBg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65893106B242;
	Mon, 10 Aug 2020 23:53:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D1975FC2F;
	Mon, 10 Aug 2020 23:53:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C2E8297529;
	Mon, 10 Aug 2020 23:53:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07ANr7aY009308 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 19:53:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F2A3E19C71; Mon, 10 Aug 2020 23:53:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A315819D7F;
	Mon, 10 Aug 2020 23:53:03 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07ANr2U2004123; 
	Mon, 10 Aug 2020 18:53:02 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07ANr1Is004122;
	Mon, 10 Aug 2020 18:53:01 -0500
Date: Mon, 10 Aug 2020 18:53:01 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200810235301.GQ19233@octiron.msp.redhat.com>
References: <20200709103623.8302-1-mwilck@suse.com>
	<20200709103623.8302-3-mwilck@suse.com>
	<20200717212525.GR11089@octiron.msp.redhat.com>
	<7a92c06bdbfdcfd3530607f4b8dbce7a5c9330a5.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <7a92c06bdbfdcfd3530607f4b8dbce7a5c9330a5.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 44/54] libmultipath: adopt_paths(): don't
 bail out on single path failure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 05, 2020 at 02:05:00PM +0200, Martin Wilck wrote:
> On Fri, 2020-07-17 at 16:25 -0500, Benjamin Marzinski wrote:
> > On Thu, Jul 09, 2020 at 12:36:13PM +0200, mwilck@suse.com wrote:
> > > From: Martin Wilck <mwilck@suse.com>
> > > 
> > > If pathinfo fails for one path to be adopted, we currently
> > > fail the entire function. This may cause ev_add_path() for a valid
> > > path to fail because some other path is broken. Fix it by just
> > > skipping paths that don't look healthy.
> > 
> > This looks problematic to me.  While I agree that we shouldn't make
> > ev_add_path fail because some other path failed, but what about if
> > the
> > path we are trying to add fails in pathinfo().  In this case
> > multipathd
> > won't orphan the path and it will report "path added to devmap", even
> > though it wasn't. Also what is the correct response for when you try
> > to create a multipath device but none of the paths can be added.
> > Should multipathd create a device with no paths? 
> 
> There are 3 callers of adopt_path():
> 
>  1 add_map_with_path()
>  2 ev_add_path()
>  3 update_map()
> 
> adopt_paths() only ever adds new paths to a map, so in case 3), the map
> would not come out without paths unless it had been empty before
> already. For this caller, my patch is definitely an improvement.
> 
> For 1) and 2), we are adding a specific path, so we should test in the
> caller whether that specific path was successfully added, and fail
> otherwise. Would that address your concern?

That sounds reasonable

-Ben

> 
> Regards,
> Martin
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

