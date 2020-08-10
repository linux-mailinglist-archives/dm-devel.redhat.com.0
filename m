Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 23343241288
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 23:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597096331;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LhTtarb5gztAFPCqowYTbpwwI5AmKnt8d7z3/LzDh2A=;
	b=MfQGmfmlYOIG7j76mfdlq0yzjn4ScottodIIE5PKsdtpdqZlgGxSZZsYBNnma3zNlhqXDB
	GbPxGeaoGhGhWFdQjiM2rOoUvKEa8ihOxGPW5Yh/fJvpk5cWWppcH7Hmn28NBJi1wEuZJ0
	PL+44Q1hMCRyjqqci5m2+WWpZXdfD10=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-G5BsgNKEP9GVDWb-ZlEUsA-1; Mon, 10 Aug 2020 17:52:09 -0400
X-MC-Unique: G5BsgNKEP9GVDWb-ZlEUsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E0B7800473;
	Mon, 10 Aug 2020 21:52:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C1665F1E4;
	Mon, 10 Aug 2020 21:51:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2A2BF9A10B;
	Mon, 10 Aug 2020 21:51:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07ALpVVP028099 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 17:51:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C2467C10C; Mon, 10 Aug 2020 21:51:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80C9779CF3;
	Mon, 10 Aug 2020 21:51:28 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07ALpQvX003596; 
	Mon, 10 Aug 2020 16:51:27 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07ALpQgI003595;
	Mon, 10 Aug 2020 16:51:26 -0500
Date: Mon, 10 Aug 2020 16:51:25 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200810215125.GO19233@octiron.msp.redhat.com>
References: <1595877868-5595-1-git-send-email-bmarzins@redhat.com>
	<1595877868-5595-4-git-send-email-bmarzins@redhat.com>
	<a8190af67d89edb0819b231417b349e56c3deff1.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <a8190af67d89edb0819b231417b349e56c3deff1.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/6] libmultipath: remove code duplication in
 path counting
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Aug 06, 2020 at 10:48:12AM +0000, Martin Wilck wrote:
> On Mon, 2020-07-27 at 14:24 -0500, Benjamin Marzinski wrote:
> > pathcountgr() is never used except by pathcount(), and neither is the
> > special case for PATH_WILD. Simplify this and make one function that
> > is
> > used by both pathcount() and count_active_paths(). This will be used
> > again in a future patch.
> > 
> > Also use count_active_paths() in mpath_persist.
> 
> The patch looks correct. I had thought about something like it as well
> when I first introduced count_active_paths(). But count_active_paths()
> is used a *lot*, and often in critical situations. I wonder whether it
> deserves an optimized version. The compiler can surely optimize better
> with two constant expressions than with the additional for-loop over an
> array with variable size. That's why back then I decided against
> implementing it as a special case of a generic function. I actually
> considered inlining count_active_paths().
> 
> It's hard to quantify the effect, and I haven't done any benchmarks. 
> But still, can we perhaps keep the optimized version of
> count_active_paths() itself?

Sure.

-Ben

> 
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

