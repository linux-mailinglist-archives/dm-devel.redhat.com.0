Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE2D278D97
	for <lists+dm-devel@lfdr.de>; Fri, 25 Sep 2020 18:06:27 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601049986;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H83HrC6qemZ67S9eTKHk11ugnCq6TKgX5InJ3Zyrv68=;
	b=T0/Y4TtvV4GHi+ZKTgMyPDXeelnxcANXWJlQZ5L5QW2no40NV/fwgMQmBZV186BC21XQ0m
	1YcRmXCI2OfH6cNYFc1OsQ63Pp2dpQseh7uBFdoIdaVUou0uxz1wAGSf5xyIy1kcNM745E
	pEozUoxrN4ygqmzZem14/GELaUb8FbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-dEx4qUlyNyiJOTs3xBZEhA-1; Fri, 25 Sep 2020 12:06:23 -0400
X-MC-Unique: dEx4qUlyNyiJOTs3xBZEhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 750851018F69;
	Fri, 25 Sep 2020 16:06:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 323D960C15;
	Fri, 25 Sep 2020 16:06:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C968544A5E;
	Fri, 25 Sep 2020 16:06:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PG6DNF027361 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 12:06:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 105AE19C66; Fri, 25 Sep 2020 16:06:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8451D19D7C;
	Fri, 25 Sep 2020 16:06:09 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08PG68Aw029255; 
	Fri, 25 Sep 2020 11:06:08 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08PG67mh029254;
	Fri, 25 Sep 2020 11:06:07 -0500
Date: Fri, 25 Sep 2020 11:06:07 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200925160607.GQ11108@octiron.msp.redhat.com>
References: <20200924133644.14034-1-mwilck@suse.com>
	<20200924133644.14034-3-mwilck@suse.com>
	<20200924201245.GH11108@octiron.msp.redhat.com>
	<f3b7a133b11ef4088948c76706ea088d40817039.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <f3b7a133b11ef4088948c76706ea088d40817039.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 02/11] libmultipath: copy mpp->hwe from
	pp->hwe
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

On Fri, Sep 25, 2020 at 06:01:26PM +0200, Martin Wilck wrote:
> On Thu, 2020-09-24 at 15:12 -0500, Benjamin Marzinski wrote:
> > On Thu, Sep 24, 2020 at 03:36:35PM +0200, mwilck@suse.com wrote:
> > > From: Martin Wilck <mwilck@suse.com>
> > > 
> > > Since f0462f0 ("libmultipath: use vector for for pp->hwe and mp-
> > > >hwe"),
> > > we've been trying to fix issues caused by paths getting freed and
> > > mpp->hwe
> > > dangling. This approach couldn't work because we need mpp->hwe to
> > > persist,
> > > even if all paths are removed from the map. Before f0462f0, a
> > > simple
> > > assignment worked, because the lifetime of the hwe wasn't bound to
> > > the
> > > path. But now, we need to copy the vector. It turns out that we
> > > need to set
> > > mpp->hwe only in two places, add_map_with_path() and setup_map(),
> > > and
> > > that the code is simplified overall.
> > 
> > Unless I'm missing someting, it looks like
> > __mpath_persistent_reserve_out() will call select_all_tg_pt(), which
> > uses mpp->hwe, without ever setting it.  Granted, I don't see how
> > this
> > was supposed to work before your patch either.
> 
> Right, it doesn't. Thanks for spotting it.
> Ok to create a new, separate patch for it?

Sure.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> 
> Regards,
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

