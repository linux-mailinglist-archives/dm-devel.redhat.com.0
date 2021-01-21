Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 010872FF308
	for <lists+dm-devel@lfdr.de>; Thu, 21 Jan 2021 19:21:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611253262;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jafe+BeCx+4aUTKtmR1PoxVi2r9m3vxEKKkBJs0ca3k=;
	b=XfiaIKehiLO9TKmcwLZVFkM8EznLmn3fZk1XWK0U7MOwolrkBc0NW4l5v/ma/AXQKjwPR6
	R8R417KvdQyfbQ4RyrhuG9uxeiXhlmO4MR38SD0AGinErUAsvKCFI4fanewkwIWLNnT1xW
	5B8vMMZb/HeW3AAkt6c9CqgHMwP/ZhM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-N0i_lRgeNO6X5BnGQk6pxA-1; Thu, 21 Jan 2021 13:20:59 -0500
X-MC-Unique: N0i_lRgeNO6X5BnGQk6pxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59B3F107ACF6;
	Thu, 21 Jan 2021 18:20:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8787A19CB1;
	Thu, 21 Jan 2021 18:20:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F250D180954D;
	Thu, 21 Jan 2021 18:20:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10LIKdHT011939 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 Jan 2021 13:20:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 47A3061F55; Thu, 21 Jan 2021 18:20:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F07C5D749;
	Thu, 21 Jan 2021 18:20:36 +0000 (UTC)
Date: Thu, 21 Jan 2021 13:20:35 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <20210121182035.GB4662@redhat.com>
References: <20210121130733.1649-1-ardb@kernel.org>
	<20210121130733.1649-6-ardb@kernel.org>
	<YAnCbnnFCQkyBpUA@sol.localdomain>
	<CAMj1kXEycOHSMQu2T1tdQrmapk+g0oQFDiWXDo0J0BKg4QgEuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMj1kXEycOHSMQu2T1tdQrmapk+g0oQFDiWXDo0J0BKg4QgEuQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>, dm-devel@redhat.com,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Milan Broz <gmazyland@gmail.com>, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 5/5] crypto: remove Salsa20 stream cipher
	algorithm
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

On Thu, Jan 21 2021 at  1:09pm -0500,
Ard Biesheuvel <ardb@kernel.org> wrote:

> On Thu, 21 Jan 2021 at 19:05, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Thu, Jan 21, 2021 at 02:07:33PM +0100, Ard Biesheuvel wrote:
> > > Salsa20 is not used anywhere in the kernel, is not suitable for disk
> > > encryption, and widely considered to have been superseded by ChaCha20.
> > > So let's remove it.
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > >  Documentation/admin-guide/device-mapper/dm-integrity.rst |    4 +-
> > >  crypto/Kconfig                                           |   12 -
> > >  crypto/Makefile                                          |    1 -
> > >  crypto/salsa20_generic.c                                 |  212 ----
> > >  crypto/tcrypt.c                                          |   11 +-
> > >  crypto/testmgr.c                                         |    6 -
> > >  crypto/testmgr.h                                         | 1162 --------------------
> > >  7 files changed, 3 insertions(+), 1405 deletions(-)
> > >
> > > diff --git a/Documentation/admin-guide/device-mapper/dm-integrity.rst b/Documentation/admin-guide/device-mapper/dm-integrity.rst
> > > index 4e6f504474ac..d56112e2e354 100644
> > > --- a/Documentation/admin-guide/device-mapper/dm-integrity.rst
> > > +++ b/Documentation/admin-guide/device-mapper/dm-integrity.rst
> > > @@ -143,8 +143,8 @@ recalculate
> > >  journal_crypt:algorithm(:key)        (the key is optional)
> > >       Encrypt the journal using given algorithm to make sure that the
> > >       attacker can't read the journal. You can use a block cipher here
> > > -     (such as "cbc(aes)") or a stream cipher (for example "chacha20",
> > > -     "salsa20" or "ctr(aes)").
> > > +     (such as "cbc(aes)") or a stream cipher (for example "chacha20"
> > > +     or "ctr(aes)").
> >
> > You should check with the dm-integrity maintainers how likely it is that people
> > are using salsa20 with dm-integrity.  It's possible that people are using it,
> > especially since the documentation says that dm-integrity can use a stream
> > cipher and specifically gives salsa20 as an example.
> >
> 
> Good point - cc'ed them now.
> 

No problem here, if others don't find utility in salsa20 then
dm-integrity certainly isn't the hold-out.

Acked-by:  Mike Snitzer <snitzer@redhat.com>

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

