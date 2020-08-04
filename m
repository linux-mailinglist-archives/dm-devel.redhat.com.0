Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 61DDD23BD43
	for <lists+dm-devel@lfdr.de>; Tue,  4 Aug 2020 17:38:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-YmSpUDOFOW-BoNYbfX72SA-1; Tue, 04 Aug 2020 11:37:13 -0400
X-MC-Unique: YmSpUDOFOW-BoNYbfX72SA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42B9B1B18BC9;
	Tue,  4 Aug 2020 15:36:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE5427B906;
	Tue,  4 Aug 2020 15:36:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B6F91809557;
	Tue,  4 Aug 2020 15:36:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 074Faejk021709 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 11:36:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 704771004169; Tue,  4 Aug 2020 15:36:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DBEB110D5A5
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 15:36:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 165D4185A797
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 15:36:38 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-470-TvKfBkuNNrSptMjOSt2VtA-1;
	Tue, 04 Aug 2020 11:36:33 -0400
X-MC-Unique: TvKfBkuNNrSptMjOSt2VtA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8E502B6A1;
	Tue,  4 Aug 2020 15:36:48 +0000 (UTC)
Message-ID: <246f58856cdc0c5d80046ca7d740ff92f91b0f87.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 04 Aug 2020 17:36:31 +0200
In-Reply-To: <20200716221848.GN11089@octiron.msp.redhat.com>
References: <20200709101620.6786-1-mwilck@suse.com>
	<20200709101620.6786-13-mwilck@suse.com>
	<20200716221848.GN11089@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2020-07-16 at 17:18 -0500, Benjamin Marzinski wrote:
> On Thu, Jul 09, 2020 at 12:15:57PM +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > Also remove the redundant local variables. It's not necessary to
> > make "restrict" work, but it makes the intention more clear.
> > 
> > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > ---
> >  libmultipath/util.c | 28 ++++++++++++----------------
> >  libmultipath/util.h |  4 ++--
> >  2 files changed, 14 insertions(+), 18 deletions(-)
> > 
> > diff --git a/libmultipath/util.c b/libmultipath/util.c
> > index 957fb97..f965094 100644
> > --- a/libmultipath/util.c
> > +++ b/libmultipath/util.c
> > 
> > -size_t strlcat(char *dst, const char *src, size_t size)
> > +size_t strlcat(char * restrict dst, const char * restrict src,
> > size_t size)
> >  {
> >  	size_t bytes = 0;
> > -	char *q = dst;
> > -	const char *p = src;
> >  	char ch;
> >  
> > -	while (bytes < size && *q) {
> > -		q++;
> > +	while (bytes < size && *dst) {
> > +		dst++;
> >  		bytes++;
> >  	}
> >  	if (bytes == size)
> 
> this should return the strlen(dst) + strlen(src). It wouldn't in the
> admittedly weird case where size isn't large enough to fit dst.

Are you sure?

https://linux.die.net/man/3/strlcat

"Note, however, that if strlcat() traverses size characters without
finding a NUL, the length of the string is considered to be size and
the destination string will not be NUL-terminated (since there was no
space for the NUL)."

The way I understand this is that the current code is actually correct
in returning bytes + strlen(src).

This is also consistent with what I see elsewhere

https://github.com/ffainelli/uClibc/blob/master/libc/string/strlcat.c
https://github.com/freebsd/freebsd/blob/master/crypto/heimdal/lib/roken/strlcat.c

Regards
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

