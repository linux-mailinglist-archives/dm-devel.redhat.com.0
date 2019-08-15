Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B018E2BB
	for <lists+dm-devel@lfdr.de>; Thu, 15 Aug 2019 04:31:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A728EE560;
	Thu, 15 Aug 2019 02:31:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF8125D9DC;
	Thu, 15 Aug 2019 02:31:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0082A18005A4;
	Thu, 15 Aug 2019 02:31:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7F2V9sR013566 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 22:31:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A318445D1; Thu, 15 Aug 2019 02:31:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-105.bne.redhat.com [10.64.54.105])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6612F4299F
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 02:31:06 +0000 (UTC)
Received: from gondolin.me.apana.org.au ([192.168.0.6]
	helo=gondolin.hengli.com.au)
	by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
	id 1hy5XW-0003By-W8; Thu, 15 Aug 2019 12:30:59 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1hy5XV-0006DV-2C; Thu, 15 Aug 2019 12:30:57 +1000
Date: Thu, 15 Aug 2019 12:30:57 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190815023056.GA23782@gondor.apana.org.au>
References: <20190704183017.31570-2-ard.biesheuvel@linaro.org>
	<20190726043117.GA654@gondor.apana.org.au>
	<CAKv+Gu_Pir7uU4h6GQfh2my2Fu-j2AGPLWNZKzc9_iG6n4xJNA@mail.gmail.com>
	<20190802035515.GA15758@gondor.apana.org.au>
	<CAKv+Gu_a-tpc4+b4aopGZxHizkOgnqkFMCTzeF0uFo5iXXf24Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKv+Gu_a-tpc4+b4aopGZxHizkOgnqkFMCTzeF0uFo5iXXf24Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v8 1/7] crypto: essiv - create wrapper
 template for ESSIV generation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Thu, 15 Aug 2019 02:31:37 +0000 (UTC)

On Sat, Aug 03, 2019 at 10:36:44AM +0300, Ard Biesheuvel wrote:
> 
> To use your GCM analogy: gcm_base(ctr-ppc-spe, ghash-generic) is a
> supported aead identifier, but  there is nothing in the name that
> identifies the skcipher as one that encapsulates AES.

I would've thought that you would first grab (literally :) ahold
of ctr-ppc-spe, at which point you could query its cra_name and then
derive AES from that.  Is that going to be a problem?

> > So I would envisage something similar for essiv where essiv just has
> > U, X and Y (as you said that U and X are independent) while you can
> > then have an essiv_base that spells everything out in detail.
> >
> 
> That might be a useful enhancement by itself, but it does not fix the
> issue above. The only way to instantiate the same cipher as the one
> encapsulated by "cbc-ppc-spe" is to instantiate the latter, parse the
> cipher name and pass it to crypto_alloc_cipher()

That's pretty much what I'm suggesting.  Except that I would point
out that you don't need to instantiate it (i.e., allocate a tfm),
you just need to grab ahold of the algorithm object.

The actual allocation of the AES cipher can be done in the cra_init
function.

We only need to grab algorithms that form a core part of the
resultant instance.  IOW, if the underlying algorithm is replaced,
you would always recreate the instance on top of it.  This is not
the case with AES here, since it's just used for a very small part
in the instance and we don't really care about recreating the essiv
intance when the block AES algorithm changes.

> > Also, do we allow anything other than HMAC for X? If not then that
> > should be encoded either into the name by dropping the hmac in the
> > algorithm name and adding it through the driver name, or by checking
> > for it in the template creation function.
> >
> > What I'd like to achieve is a state where we support only what is
> > currently supported and no more.
> >
> 
> Yeah, that makes sense. But we have h/w drivers that instantiate
> authenc(X,Y) in its entirety, and passing those driver names is
> something that is supported today, so we can't just remove that.

Sure, we only need to impose a restriction on the cra_name, not
on the driver name.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
