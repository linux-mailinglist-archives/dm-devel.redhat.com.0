Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED852794A7
	for <lists+dm-devel@lfdr.de>; Sat, 26 Sep 2020 01:23:03 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601076182;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HfLD1bGQ/BFwyV/lF4x876ddBd5zXSxqEPZhwwHTEDQ=;
	b=DuH6ve50V70954/p8fR5ALYxdigxJLTqDd3j25czIkrETmfKk8YmI5piMbC/AXP1p4J5y2
	FGy7Lt6pt9to7Mpn8lu4XUxgf6uzecmMqRfuZ+K8ypqlYu+AbunXqfuzU51occ1BIXGPT7
	PEt2RpvMQDDx5/6xeI82Evd8fR3XLZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-CXtngxf4Mw-zaSKbBDN-qg-1; Fri, 25 Sep 2020 19:23:00 -0400
X-MC-Unique: CXtngxf4Mw-zaSKbBDN-qg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72BF510066FC;
	Fri, 25 Sep 2020 23:22:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C09210027AA;
	Fri, 25 Sep 2020 23:22:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 072741826D2F;
	Fri, 25 Sep 2020 23:22:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08PNMbN0011259 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 19:22:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C16B31002C07; Fri, 25 Sep 2020 23:22:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C69431002C20;
	Fri, 25 Sep 2020 23:22:34 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08PNMXpv004824; 
	Fri, 25 Sep 2020 18:22:33 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08PNMXCR004823;
	Fri, 25 Sep 2020 18:22:33 -0500
Date: Fri, 25 Sep 2020 18:22:32 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200925232232.GE3384@octiron.msp.redhat.com>
References: <20200924133644.14034-1-mwilck@suse.com>
	<20200924133644.14034-11-mwilck@suse.com>
	<20200925040034.GN11108@octiron.msp.redhat.com>
	<d41328cd56bc65f9506d9a7f7548593aa07d775a.camel@suse.com>
	<20200925221022.GB3384@octiron.msp.redhat.com>
	<20200925223207.GC3384@octiron.msp.redhat.com>
	<c0a1e44fcc819583d972884aa126c486fc784fa9.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <c0a1e44fcc819583d972884aa126c486fc784fa9.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 10/11] libmpathpersist: add linker version
 script
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Sep 26, 2020 at 01:07:34AM +0200, Martin Wilck wrote:
> On Fri, 2020-09-25 at 17:32 -0500, Benjamin Marzinski wrote:
> > On Fri, Sep 25, 2020 at 05:10:22PM -0500, Benjamin Marzinski wrote:
> > > On Fri, Sep 25, 2020 at 09:52:51PM +0200, Martin Wilck wrote:
> > > > On Thu, 2020-09-24 at 23:00 -0500, Benjamin Marzinski wrote:
> > > > > On Thu, Sep 24, 2020 at 03:36:43PM +0200, mwilck@suse.com
> > > > > wrote:
> > > > > > --- /dev/null
> > > > > > +++ b/libmpathpersist/libmpathpersist.version
> > > > > > @@ -0,0 +1,20 @@
> > > > > > +LIBMPATHPERSIST_0.8.4.0 {
> > > > > 
> > > > > I have a question about this version. Do you plan on bumping
> > > > > this
> > > > > each
> > > > > time a new release is tagged? It seems like we only ever want
> > > > > to
> > > > > change
> > > > > the version if we actually change the ABI. Or is 0.8.4 just
> > > > > because
> > > > > that's the relesae where we started this?
> > > > 
> > > > That was the idea, yes. And the last digit is because we'll have
> > > > to
> > > > bump it between releases from Christophe. It makes sense for
> > > > libmultipath's rapidly changing ABI; much less so for libmpathcmd
> > > > and
> > > > libmpathpersist, which are meant to be stable. I am open for
> > > > discussing
> > > > these numbers; if you prefer, we might as well use
> > > > LIBMPATHPERSIST_1.0.
> > > > 
> > > > I admit I haven't thought about what would happen once Christophe
> > > > makes
> > > > a new release. Probably, nothing - afaics it's impossible to add
> > > > a new
> > > > version without any new symbols, and *renaming* an existing
> > > > version is
> > > > bad; it would introduce artificial incompatibility. 
> > > > 
> > > > So libmultipath from multipath-tools 0.8.5 would still have a
> > > > 0.8.4.x
> > > > ABI; only the first change after 0.8.5 would get a 0.8.5.1
> > > > number. Hm.
> > > > 
> > > > Again, I'm open for discussion here. We might as well choose to
> > > > not tie
> > > > the ABI version to the libmultipath version at all, and simply
> > > > start at
> > > > 0.1 or whatevever for libmultipath. After all, looking up the ABI
> > > > version in the commit history will be simple enough.
> > > 
> > > Since the ABI version isn't always going to match the release
> > > version, I
> > > think it makes more sense to decouple them, so it's not sometimes
> > > matching and sometimes not. We could go with a MAJOR.MINOR
> > > versioning
> > > scheme, where we bump MINOR whenever we change the interface in a
> > > backwards compatible way (like by adding a new symbol), and bump
> > > the
> > > MAJOR and reset the MINOR whenever we change the interface in a
> > > non-backwards compatible way (like by changing the parameters an
> > > interface function takes, or removing a symbol).
> > 
> > Perhaps we might even want MAJOR.MINOR.RELEASE, where for upstream,
> > RELEASE is always 0. Distros can increment it if they need to
> > backport
> > changes, so that they don't conflict with existing upstream versions.
> 
> Sounds good. What MAJOR.MINOR version should we start with? 0.1 ? 1.0?

I realize that multipath-tools doesn't actually have a 1.0 release, but
1.0+ releases tradiontially mean that you believe that it's stable and
ready for use. Setting the libraries to 0.1 says to me that they aren't
meant for serious use, so I would vote for 1.0.

cc-ing dm-devel, because apparently I forgot to on my last email.

-Ben
 
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

