Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2F95523C09A
	for <lists+dm-devel@lfdr.de>; Tue,  4 Aug 2020 22:16:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-uS5wTjPiO3iD00GGVCMMdg-1; Tue, 04 Aug 2020 16:16:14 -0400
X-MC-Unique: uS5wTjPiO3iD00GGVCMMdg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79F42100AA23;
	Tue,  4 Aug 2020 20:16:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29CC110013C4;
	Tue,  4 Aug 2020 20:16:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7132496903;
	Tue,  4 Aug 2020 20:16:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 074KG2Bq025185 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 16:16:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BFC082022ADE; Tue,  4 Aug 2020 20:16:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBB022026D69
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 20:15:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7FEE800050
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 20:15:59 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-40-B9c6djoRN_GQ760hToH8Kw-1;
	Tue, 04 Aug 2020 16:15:55 -0400
X-MC-Unique: B9c6djoRN_GQ760hToH8Kw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 23CC2AC52;
	Tue,  4 Aug 2020 20:16:10 +0000 (UTC)
Message-ID: <e978bc3dd9244d705eb4b1673490816768fffb5c.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 04 Aug 2020 22:15:53 +0200
In-Reply-To: <20200804172936.GK19233@octiron.msp.redhat.com>
References: <20200709101620.6786-1-mwilck@suse.com>
	<20200709101620.6786-13-mwilck@suse.com>
	<20200716221848.GN11089@octiron.msp.redhat.com>
	<246f58856cdc0c5d80046ca7d740ff92f91b0f87.camel@suse.com>
	<20200804172936.GK19233@octiron.msp.redhat.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-08-04 at 12:29 -0500, Benjamin Marzinski wrote:
> On Tue, Aug 04, 2020 at 05:36:31PM +0200, Martin Wilck wrote:
> > On Thu, 2020-07-16 at 17:18 -0500, Benjamin Marzinski wrote:
> > > On Thu, Jul 09, 2020 at 12:15:57PM +0200, mwilck@suse.com wrote:
> > > > From: Martin Wilck <mwilck@suse.com>
> > > > 
> > > > Also remove the redundant local variables. It's not necessary
> > > > to
> > > > make "restrict" work, but it makes the intention more clear.
> > > > 
> > > > Signed-off-by: Martin Wilck <mwilck@suse.com>
> > > > ---
> > > >  libmultipath/util.c | 28 ++++++++++++----------------
> > > >  libmultipath/util.h |  4 ++--
> > > >  2 files changed, 14 insertions(+), 18 deletions(-)
> > > > 
> > > > diff --git a/libmultipath/util.c b/libmultipath/util.c
> > > > index 957fb97..f965094 100644
> > > > --- a/libmultipath/util.c
> > > > +++ b/libmultipath/util.c
> > > > 
> > > > -size_t strlcat(char *dst, const char *src, size_t size)
> > > > +size_t strlcat(char * restrict dst, const char * restrict src,
> > > > size_t size)
> > > >  {
> > > >  	size_t bytes = 0;
> > > > -	char *q = dst;
> > > > -	const char *p = src;
> > > >  	char ch;
> > > >  
> > > > -	while (bytes < size && *q) {
> > > > -		q++;
> > > > +	while (bytes < size && *dst) {
> > > > +		dst++;
> > > >  		bytes++;
> > > >  	}
> > > >  	if (bytes == size)
> > > 
> > > this should return the strlen(dst) + strlen(src). It wouldn't in
> > > the
> > > admittedly weird case where size isn't large enough to fit dst.
> > 
> > Are you sure?
> > 
> 
> Nope. But I might be right.
> 
> > https://linux.die.net/man/3/strlcat
> > 
> > "Note, however, that if strlcat() traverses size characters without
> > finding a NUL, the length of the string is considered to be size
> > and
> > the destination string will not be NUL-terminated (since there was
> > no
> > space for the NUL)."
> > 
> > The way I understand this is that the current code is actually
> > correct
> > in returning bytes + strlen(src).
> > 
> > This is also consistent with what I see elsewhere
> > 
> > https://github.com/ffainelli/uClibc/blob/master/libc/string/strlcat.c
> 
> This returns bytes + strlen(src) like you think is correct
> 
> > https://github.com/freebsd/freebsd/blob/master/crypto/heimdal/lib/roken/strlcat.c
> 
> This returns strlen(dst) + strlen(src) like I think is correct

... only if strnlen() is unavailable. Otherwise it returns
dst_sz + strlen(src) (= bytes + strlen(src)), because len never exceeds
dst_sz.

This one:
https://opensource.apple.com/source/Libc/Libc-1244.30.3/string/strlcat.c.auto.html
also behaves like the current code (using strnlen()).

To be fair, https://www.sudo.ws/todd/papers/strlcpy.html
says that strlcat should return "the number of bytes needed to store
the entire string".

On https://elixir.bootlin.com/linux/latest/source/lib/string.c#L325
we see that the kernel would actually crash in the corner case we're
discussing.

> I would argue that the important lines from 
> https://linux.die.net/man/3/strlcat
> are
> 
> "The strlcpy() and strlcat() functions return the total length of the
> string they tried to create."
> 
> and
> 
> "For strlcat() that means the initial length of dst plus the length
> of
> src."
> 
> 
> The alternative to strlen(dst) + strlen(src) (which follows the
> snprintf
> convention, and I think makes the most sense) seems to be "the length
> of
> the string is considered to be size" which I assume means it should
> return bytes. According to the man page, the reason for this is to
> keep
> "strlcat() from running off the end of a string". I admit to being
> kinda
> confused about this. I suppose if you assume that you can't trust the
> strings enough to run strlen() this makes sense.  But if you can't
> trust
> strlen(dst), you shouldn't be able to trust strlen(src) either, which
> means that strlcat() should never return more than bytes, and that is
> clearly at odds with other statements in the man page.
> 
> In my mind, there is value in returning strlen(dst) + strlen(src),
> since
> that is the size needed to hold the strings.  Returning bytes means
> you can
> write strlcat to avoid trusting strlen(). bytes + strlen(src) is a
> meaningless value, and getting that value doesn't protect you against
> src not being null terminated.

I agree with everything you say. Except that I believe that the authors
thought indeed this is a security feature.
https://stackoverflow.com/questions/33154740/strlcat-is-dst-always-nul-terminated-what-are-size-and-the-returned-value
provides a hint about the rationale: 
"size is expected to be the size of the memory region containing dst,
so that dst[size] is assumed to be an invalid memory reference." With
this in mind, passing a non-nul-terminated string to strlcat is an
error for "src", but not for "dst", and calling strlen(dst) from
strlcat() would be a bug.

> Clearly this is a nitpicky corner case, and I don't think we need
> protection against src not being null terminated, so I'm not strongly
> against bytes + strlen(src), if you prefer that.
rationale
That code line wasn't touched by my patch anyway, so I propose that we
leave it as-is for now.

Best,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

