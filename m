Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6430475DDC
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jul 2019 06:32:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2248330A7C5C;
	Fri, 26 Jul 2019 04:32:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86DEE5C22F;
	Fri, 26 Jul 2019 04:32:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6923541F40;
	Fri, 26 Jul 2019 04:31:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6Q4VUAG009069 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jul 2019 00:31:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC70319D7C; Fri, 26 Jul 2019 04:31:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-105.bne.redhat.com [10.64.54.105])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9126A19D71
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 04:31:28 +0000 (UTC)
Received: from gondolin.me.apana.org.au ([192.168.0.6]
	helo=gondolin.hengli.com.au)
	by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
	id 1hqrt2-0004DT-7H; Fri, 26 Jul 2019 14:31:20 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1hqrsz-0000Ay-K3; Fri, 26 Jul 2019 14:31:17 +1000
Date: Fri, 26 Jul 2019 14:31:17 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190726043117.GA654@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704183017.31570-2-ard.biesheuvel@linaro.org>
Organization: Core
X-Newsgroups: apana.lists.os.linux.cryptoapi
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: ebiggers@google.com, ard.biesheuvel@linaro.org,
	linux-fscrypt@vger.kernel.org, gilad@benyossef.com,
	dm-devel@redhat.com, linux-crypto@vger.kernel.org, gmazyland@gmail.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 26 Jul 2019 04:32:15 +0000 (UTC)

Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> + * The typical use of this template is to instantiate the skcipher
> + * 'essiv(cbc(aes),aes,sha256)', which is the only instantiation used by
> + * fscrypt, and the most relevant one for dm-crypt. However, dm-crypt
> + * also permits ESSIV to be used in combination with the authenc template,
> + * e.g., 'essiv(authenc(hmac(sha256),cbc(aes)),aes,sha256)', in which case
> + * we need to instantiate an aead that accepts the same special key format
> + * as the authenc template, and deals with the way the encrypted IV is
> + * embedded into the AAD area of the aead request. This means the AEAD
> + * flavor produced by this template is tightly coupled to the way dm-crypt
> + * happens to use it.

IIRC only authenc is allowed in dm-crypt currently in conjunction
with ESSIV.  Does it ever allow a different hash algorithm in
authenc compared to the one used for ESSIV? IOW given

	essiv(authenc(hmac(X),cbc(Y)),Z,U)

is it currently possible for X != U or Y != Z? If not then let's
just make the algorithm name be essiv(Y,X).

Because this is legacy stuff, I don't want it to support any more
than what is currently being supported by dm-crypt.

Similary for the skcipher case, given

	essiv(cbc(X),Y,Z)

is it ever possible for X != Y? If not then we should just make the
algorithm name essiv(X,Z).

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
