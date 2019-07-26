Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F2B76171
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jul 2019 11:01:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BAF6F308424C;
	Fri, 26 Jul 2019 09:00:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF7CD3AC8;
	Fri, 26 Jul 2019 09:00:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11F3218089C8;
	Fri, 26 Jul 2019 09:00:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6Q90aeh026683 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jul 2019 05:00:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4E8417265; Fri, 26 Jul 2019 09:00:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDD395C888
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 09:00:34 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F4A53086211
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 09:00:33 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n4so53655550wrs.3
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 02:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dJVx4P/EeCRADCgDlxio4Ghh0z07e18qae2iw3g0/Tw=;
	b=QB+uiNder4J7yPGtQrufMvro7531SU0nH/jVWiroocLxSGVsqmHDTT/+MfDK/IB3fU
	8a2HXVGXvw3+xRO0cPl6XTHndoaYdUUB9CEmv/3OmS1qGRuqXrlp7F7i4hr4kEbJb1PC
	rNmX8HaQ31+627HAa8ccPgAOLHxpk+X18gXF0yTWbYzKwcBfGkXTD5hICizmDcKXn73B
	IZrrKNkoI3ahlxvu2AuMQcs/IE7VxmhXV/TizoyZux1GUvzJGoctLVIZ1RfEvD/7N5rq
	0fOG6tLb9CupWe2/L0MjyrrOmqZeWOG61NNUj67w8VaDxlq3uJEnNnlcMql6WLYLNZZU
	sfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dJVx4P/EeCRADCgDlxio4Ghh0z07e18qae2iw3g0/Tw=;
	b=HI6xinC27X+sX4d68jFplN1/bRyF1dR/q5dz1iUlZ56VQAWIxCV8b8JSGBg1TLMrif
	RHt3kIf5Jiiq55fZCaAXYtvXgYZIkYLPEcl3a1NE0AnOE4MKc56cSZ0UApYzcqsyDFxj
	Bo+3PciR9EGECrkrzOsgsiIztegHHrhQ+LrNgd6/YvjJz5X6yhaqLV/QlbwVdwTUM6L2
	RBiBWJimluUvzldevMQKKK0T+3b0NgVrkKtg0RbjG4NoO39HZ5qKxDvFFuyASTzGWhPa
	c93y4k3WTafQnYgx5o5xFKqnDcmy+abldOjVgfHRGjXvYzO0hx/V9IrjEoACqCwKqTf8
	fv/Q==
X-Gm-Message-State: APjAAAX9uRMWMYBZAb78q3Za89NrcMDRfhwkU4qT0V8vrR30k9LJhSts
	lxPtKlyIc86btQZ1aK+QSQ7uKHnEUaXTb+OZHR+0Iw==
X-Google-Smtp-Source: APXvYqx7bUMqy+QSbXLNhmTp4DIf55sDRBr+HazKXdlvNwnSDKJEyJkJ3VlANZxNeJ7joo3dbTP9dkBrOhCiZU6qkQM=
X-Received: by 2002:adf:9ccf:: with SMTP id h15mr84833859wre.241.1564131631933;
	Fri, 26 Jul 2019 02:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190704183017.31570-2-ard.biesheuvel@linaro.org>
	<20190726043117.GA654@gondor.apana.org.au>
In-Reply-To: <20190726043117.GA654@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 26 Jul 2019 12:00:20 +0300
Message-ID: <CAKv+Gu_Pir7uU4h6GQfh2my2Fu-j2AGPLWNZKzc9_iG6n4xJNA@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 26 Jul 2019 09:00:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 26 Jul 2019 09:00:33 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Fri, 26 Jul 2019 09:01:00 +0000 (UTC)

On Fri, 26 Jul 2019 at 07:31, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >
> > + * The typical use of this template is to instantiate the skcipher
> > + * 'essiv(cbc(aes),aes,sha256)', which is the only instantiation used by
> > + * fscrypt, and the most relevant one for dm-crypt. However, dm-crypt
> > + * also permits ESSIV to be used in combination with the authenc template,
> > + * e.g., 'essiv(authenc(hmac(sha256),cbc(aes)),aes,sha256)', in which case
> > + * we need to instantiate an aead that accepts the same special key format
> > + * as the authenc template, and deals with the way the encrypted IV is
> > + * embedded into the AAD area of the aead request. This means the AEAD
> > + * flavor produced by this template is tightly coupled to the way dm-crypt
> > + * happens to use it.
>
> IIRC only authenc is allowed in dm-crypt currently in conjunction
> with ESSIV.  Does it ever allow a different hash algorithm in
> authenc compared to the one used for ESSIV? IOW given
>
>         essiv(authenc(hmac(X),cbc(Y)),Z,U)
>
> is it currently possible for X != U or Y != Z? If not then let's
> just make the algorithm name be essiv(Y,X).
>

X and U are independent, since the dm-crypt userland API permits you
to specify both, and the only requirement is that the digest size of U
is a valid jey size for Z.

For Y and Z, it is not straightforward either: since the crypto API
permits the use of driver names in addition to the plain CRA names,
we'd have to infer from the first parameter which cipher is being
used.

E.g., this could be

authenc-hmac-sha1-cbc-aes-chcr
authenc-hmac-sha1-cbc-aes-iproc
authenc-hmac-sha1-cbc-aes-caam-qi
authenc-hmac-sha1-cbc-aes-ccree
safexcel-authenc-hmac-sha1-cbc-aes
authenc-hmac-sha1-cbc-aes-picoxcell
qat_aes_cbc_hmac_sha1
authenc-hmac-sha1-cbc-aes-talitos

but also

authenc(..., cbc-ppc-spe))
authenc(..., cbc-aes-s390))
authenc(..., cbc-aes-ppc4xx))
authenc(..., artpec6-cbc-aes))
authenc(..., cbc-aes-iproc))
authenc(..., cbc-aes-caam))
authenc(..., cbc-aes-caam-qi))
authenc(..., cbc-aes-caam-qi2))
authenc(..., cavium-cbc-aes))
authenc(..., n5_cbc(aes)))
authenc(..., cbc-aes-geode))
authenc(..., hisi_sec_aes_cbc))
authenc(..., safexcel-cbc-aes))
authenc(..., mv-cbc-aes))
authenc(..., cbc-aes-nx))
authenc(..., cbc-aes-padlock))
authenc(..., cbc-aes-picoxcell))
authenc(..., qat_aes_cbc))
authenc(..., cbc-aes-sun4i-ss))
authenc(..., cbc-aes-talitos))
authenc(..., cbc-des-talitos))
authenc(..., cbc-aes-ux500))
authenc(..., virtio_crypto_aes_cbc))
authenc(..., p8_aes_cbc))

where the first one does not even have the cipher in its name.

So the only way to deal with this is to instantiate the AEAD and then
parse the name.

Unfortunately, this means that patch #3 in this series is broken,
since it assumes that we can infer authenc'ness from the user
specified cipher string.

> Because this is legacy stuff, I don't want it to support any more
> than what is currently being supported by dm-crypt.
>
> Similary for the skcipher case, given
>
>         essiv(cbc(X),Y,Z)
>
> is it ever possible for X != Y? If not then we should just make the
> algorithm name essiv(X,Z).
>

Same problem. We'd need to instantiate the skcipher and parse the cra_name.

Perhaps we should introduce a crypto API call that infers the cra_name
from a cra_driver_name?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
