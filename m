Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 09DCB23BEDE
	for <lists+dm-devel@lfdr.de>; Tue,  4 Aug 2020 19:30:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596562220;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HsbMqx4ZJ+Eay1VYSYMZ3EYmwKIx6hxuLqMPWb1n/U8=;
	b=aEJasFJPb2Xe/cZQolDh4UArPHKQJ5IprYnxzuJ4E/j8uhWW3g/4aGBfaxfuyQKz0c7aNb
	g7TBgOUp4UKViJhZVSnN6s1OVvP++3BzPLJErZ/dF7PcrHmJQek2sdWcPBFRion5e2ekQF
	XL9i1GOEeswjEvuGt74BObt8EtcUrZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-1AMAqfBAPQGe-zND5m3CJA-1; Tue, 04 Aug 2020 13:30:14 -0400
X-MC-Unique: 1AMAqfBAPQGe-zND5m3CJA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E81D780BCA2;
	Tue,  4 Aug 2020 17:30:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F44A88D63;
	Tue,  4 Aug 2020 17:30:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E84CE9A117;
	Tue,  4 Aug 2020 17:29:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 074HTfZa005946 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 13:29:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B82188D58; Tue,  4 Aug 2020 17:29:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B060872E48;
	Tue,  4 Aug 2020 17:29:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 074HTbFF028296; 
	Tue, 4 Aug 2020 12:29:37 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 074HTaeb028295;
	Tue, 4 Aug 2020 12:29:36 -0500
Date: Tue, 4 Aug 2020 12:29:36 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200804172936.GK19233@octiron.msp.redhat.com>
References: <20200709101620.6786-1-mwilck@suse.com>
	<20200709101620.6786-13-mwilck@suse.com>
	<20200716221848.GN11089@octiron.msp.redhat.com>
	<246f58856cdc0c5d80046ca7d740ff92f91b0f87.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <246f58856cdc0c5d80046ca7d740ff92f91b0f87.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 12/35] libmultipath: strlcpy()/strlcat(): use
 restrict qualifier
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Aug 04, 2020 at 05:36:31PM +0200, Martin Wilck wrote:
> On Thu, 2020-07-16 at 17:18 -0500, Benjamin Marzinski wrote:
> > On Thu, Jul 09, 2020 at 12:15:57PM +0200, mwilck@suse.com wrote:
> > > From: Martin Wilck <mwilck@suse.com>
> > > 
> > > Also remove the redundant local variables. It's not necessary to
> > > make "restrict" work, but it makes the intention more clear.
> > > 
> > > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > > ---
> > >  libmultipath/util.c | 28 ++++++++++++----------------
> > >  libmultipath/util.h |  4 ++--
> > >  2 files changed, 14 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/libmultipath/util.c b/libmultipath/util.c
> > > index 957fb97..f965094 100644
> > > --- a/libmultipath/util.c
> > > +++ b/libmultipath/util.c
> > > 
> > > -size_t strlcat(char *dst, const char *src, size_t size)
> > > +size_t strlcat(char * restrict dst, const char * restrict src,
> > > size_t size)
> > >  {
> > >  	size_t bytes = 0;
> > > -	char *q = dst;
> > > -	const char *p = src;
> > >  	char ch;
> > >  
> > > -	while (bytes < size && *q) {
> > > -		q++;
> > > +	while (bytes < size && *dst) {
> > > +		dst++;
> > >  		bytes++;
> > >  	}
> > >  	if (bytes == size)
> > 
> > this should return the strlen(dst) + strlen(src). It wouldn't in the
> > admittedly weird case where size isn't large enough to fit dst.
> 
> Are you sure?
> 

Nope. But I might be right.

> https://linux.die.net/man/3/strlcat
> 
> "Note, however, that if strlcat() traverses size characters without
> finding a NUL, the length of the string is considered to be size and
> the destination string will not be NUL-terminated (since there was no
> space for the NUL)."
> 
> The way I understand this is that the current code is actually correct
> in returning bytes + strlen(src).
> 
> This is also consistent with what I see elsewhere
> 
> https://github.com/ffainelli/uClibc/blob/master/libc/string/strlcat.c

This returns bytes + strlen(src) like you think is correct

> https://github.com/freebsd/freebsd/blob/master/crypto/heimdal/lib/roken/strlcat.c

This returns strlen(dst) + strlen(src) like I think is correct


I would argue that the important lines from https://linux.die.net/man/3/strlcat
are

"The strlcpy() and strlcat() functions return the total length of the
string they tried to create."

and

"For strlcat() that means the initial length of dst plus the length of
src."


The alternative to strlen(dst) + strlen(src) (which follows the snprintf
convention, and I think makes the most sense) seems to be "the length of
the string is considered to be size" which I assume means it should
return bytes. According to the man page, the reason for this is to keep
"strlcat() from running off the end of a string". I admit to being kinda
confused about this. I suppose if you assume that you can't trust the
strings enough to run strlen() this makes sense.  But if you can't trust
strlen(dst), you shouldn't be able to trust strlen(src) either, which
means that strlcat() should never return more than bytes, and that is
clearly at odds with other statements in the man page.

In my mind, there is value in returning strlen(dst) + strlen(src), since
that is the size needed to hold the strings.  Returning bytes means you can
write strlcat to avoid trusting strlen(). bytes + strlen(src) is a
meaningless value, and getting that value doesn't protect you against
src not being null terminated.

Clearly this is a nitpicky corner case, and I don't think we need
protection against src not being null terminated, so I'm not strongly
against bytes + strlen(src), if you prefer that.

-Ben

> Regards
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

