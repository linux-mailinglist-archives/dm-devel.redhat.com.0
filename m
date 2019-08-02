Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A90887EAD5
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 05:56:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E649A882FF;
	Fri,  2 Aug 2019 03:56:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92E9119C68;
	Fri,  2 Aug 2019 03:56:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC881264C8;
	Fri,  2 Aug 2019 03:56:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x723tSSI027803 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 1 Aug 2019 23:55:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7AA321001B12; Fri,  2 Aug 2019 03:55:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-105.bne.redhat.com [10.64.54.105])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 852E41001B02
	for <dm-devel@redhat.com>; Fri,  2 Aug 2019 03:55:25 +0000 (UTC)
Received: from gondolin.me.apana.org.au ([192.168.0.6]
	helo=gondolin.hengli.com.au)
	by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
	id 1htOez-00054h-1w; Fri, 02 Aug 2019 13:55:17 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1htOex-00047c-GU; Fri, 02 Aug 2019 13:55:15 +1000
Date: Fri, 2 Aug 2019 13:55:15 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190802035515.GA15758@gondor.apana.org.au>
References: <20190704183017.31570-2-ard.biesheuvel@linaro.org>
	<20190726043117.GA654@gondor.apana.org.au>
	<CAKv+Gu_Pir7uU4h6GQfh2my2Fu-j2AGPLWNZKzc9_iG6n4xJNA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKv+Gu_Pir7uU4h6GQfh2my2Fu-j2AGPLWNZKzc9_iG6n4xJNA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Fri, 02 Aug 2019 03:56:40 +0000 (UTC)

On Fri, Jul 26, 2019 at 12:00:20PM +0300, Ard Biesheuvel wrote:
>
> For Y and Z, it is not straightforward either: since the crypto API
> permits the use of driver names in addition to the plain CRA names,
> we'd have to infer from the first parameter which cipher is being
> used.

We don't really permit that.  It might work but it is certainly not
guaranteed to work.  The only thing we guarantee is that the
algorithm name and the canonical driver name will work.  For example,
with gcm you can either say gcm(aes) or gcm_base(drv_name1, drv_name2).

Anything else is not supported.

So I would envisage something similar for essiv where essiv just has
U, X and Y (as you said that U and X are independent) while you can
then have an essiv_base that spells everything out in detail.

Also, do we allow anything other than HMAC for X? If not then that
should be encoded either into the name by dropping the hmac in the
algorithm name and adding it through the driver name, or by checking
for it in the template creation function.

What I'd like to achieve is a state where we support only what is
currently supported and no more.

> > Because this is legacy stuff, I don't want it to support any more
> > than what is currently being supported by dm-crypt.
> >
> > Similary for the skcipher case, given
> >
> >         essiv(cbc(X),Y,Z)
> >
> > is it ever possible for X != Y? If not then we should just make the
> > algorithm name essiv(X,Z).
> >
> 
> Same problem. We'd need to instantiate the skcipher and parse the cra_name.
> 
> Perhaps we should introduce a crypto API call that infers the cra_name
> from a cra_driver_name?

You don't need to do that.  Just copy whatever gcm does in its
creation function when you invoke it as gcm_base.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
