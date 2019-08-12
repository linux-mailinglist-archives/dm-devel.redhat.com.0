Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DC989762
	for <lists+dm-devel@lfdr.de>; Mon, 12 Aug 2019 08:55:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE749307C826;
	Mon, 12 Aug 2019 06:55:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED43F646B4;
	Mon, 12 Aug 2019 06:55:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16A66180B536;
	Mon, 12 Aug 2019 06:55:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7C6svWc007278 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Aug 2019 02:54:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 953307CD83; Mon, 12 Aug 2019 06:54:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FA167CD72
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 06:54:55 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E085301D671
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 06:54:54 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p13so29006975wru.10
	for <dm-devel@redhat.com>; Sun, 11 Aug 2019 23:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ei5+JkViRRRvGnhnLSSk/w3F6iDWCFzFq2bHWTHDj4Q=;
	b=l/UHyvHuPOy0RmjyzYqXC66MlXYLRPd7Mz3PWXStgqevP0+3gtPn8lS98SoU6t78I9
	jv8WL4jZa6S6GOEJwYlMqZK4uwQLRAr/B1GQWjoqu2xMrFsdBZByTY6tPY6TuQGn1vtV
	W8fZXloorn5YC0WAwV44dSrRjOCvO/wtqExPM5NbD5yB+aGlikWqaEMlYmyF9GBj4KZ6
	hdp9z7WJUSWl/31SwwiwjyS/IgW7fX7VTYOGgdBceklFaG67UeZRFbMyElUd0AOd2UtA
	zVTUBwOvgZ5mhRUg3Mw/H4DqoB/fKv7hdx3d3FKD2zGiNUcB/Tw3D/ClQ2dn53i8S+sA
	pPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ei5+JkViRRRvGnhnLSSk/w3F6iDWCFzFq2bHWTHDj4Q=;
	b=GUdFvtKoPLwthGSNupugqGpYbj69xUjHVp1ADK0qno8fZF2VAHv0qcFsOiMx0PE+im
	6Si5U0I2Rm0+p4Nh8BkP8ZiatdW+vHot/+wB0fLAR7RC27N/FRhV4Wtwaq20Ry4e6IQz
	X9HTrl7rN+ejJupPe+8jQtPxMsV9niBAqoa6x3si0zrjHgN0ASz9vsmb6vj18hGh8VJa
	g000BshavP2VObOzjZ1Z2Ga0Ehdw0s8xJM7bkTPc3kHSTm4GbZDrNcd9Wb22ikfZVrko
	wf0n9ql2rPIULR7UDUWymzAJIYSF8TXFznPX3byeaW48H1DNpYb9Tw8xK+x7Fo7MPeA3
	Xu2Q==
X-Gm-Message-State: APjAAAVx4j1LY2MqXPp2JGvvU+6gup4TKfnwUMRZ6lq42ehrYtmTmZ02
	AlRjL3sm5pvbzFRJd6NcSthT3j7Xsy+ODAVMsZwbaQ==
X-Google-Smtp-Source: APXvYqwARCYRYmmX74oKU/J/K18AUPhYy1m1sdeU9FQdVJEds7qCcC3mpjJK8N5OurmTPSC9PdLS6KIxtowC7Ruhuqk=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr28314323wrw.169.1565592892776; 
	Sun, 11 Aug 2019 23:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190810094053.7423-1-ard.biesheuvel@linaro.org>
	<20190810094053.7423-4-ard.biesheuvel@linaro.org>
	<8679d2f5-b005-cd89-957e-d79440b78086@gmail.com>
In-Reply-To: <8679d2f5-b005-cd89-957e-d79440b78086@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 12 Aug 2019 09:54:41 +0300
Message-ID: <CAKv+Gu-ZPPR5xQSR6T4o+8yJvsHY2a3xXZ5zsM_aGS3frVChgQ@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 12 Aug 2019 06:54:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Mon, 12 Aug 2019 06:54:54 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH v9 3/7] md: dm-crypt: switch to ESSIV crypto
	API template
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 12 Aug 2019 06:55:16 +0000 (UTC)

On Mon, 12 Aug 2019 at 09:33, Milan Broz <gmazyland@gmail.com> wrote:
>
> Hi,
>
> On 10/08/2019 11:40, Ard Biesheuvel wrote:
> > Replace the explicit ESSIV handling in the dm-crypt driver with calls
> > into the crypto API, which now possesses the capability to perform
> > this processing within the crypto subsystem.
> >
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > ---
> >  drivers/md/Kconfig    |   1 +
> >  drivers/md/dm-crypt.c | 194 ++++----------------
> >  2 files changed, 33 insertions(+), 162 deletions(-)
> >
> > diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
> > index 3834332f4963..b727e8f15264 100644
> > --- a/drivers/md/Kconfig
> > +++ b/drivers/md/Kconfig
> ...
> > @@ -2493,6 +2339,20 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
> >       if (*ivmode && !strcmp(*ivmode, "lmk"))
> >               cc->tfms_count = 64;
> >
> > +     if (*ivmode && !strcmp(*ivmode, "essiv")) {
> > +             if (!*ivopts) {
> > +                     ti->error = "Digest algorithm missing for ESSIV mode";
> > +                     return -EINVAL;
> > +             }
> > +             ret = snprintf(buf, CRYPTO_MAX_ALG_NAME, "essiv(%s,%s)",
> > +                            cipher_api, *ivopts);
>
> This is wrong. It works only in length-preserving modes, not in AEAD modes.
>
> Try for example
> # cryptsetup luksFormat /dev/sdc -c aes-cbc-essiv:sha256 --integrity hmac-sha256 -q -i1
>
> It should produce Crypto API string
>   authenc(hmac(sha256),essiv(cbc(aes),sha256))
> while it produces
>   essiv(authenc(hmac(sha256),cbc(aes)),sha256)
> (and fails).
>

No. I don't know why it fails, but the latter is actually the correct
string. The essiv template is instantiated either as a skcipher or as
an aead, and it encapsulates the entire transformation. (This is
necessary considering that the IV is passed via the AAD and so the
ESSIV handling needs to touch that as well)

This code worked fine in my testing: I could instantiate

essiv(authenc(hmac(sha256),cbc(aes)),sha256)
essiv(authenc(hmac(sha1),cbc(aes)),sha256)

where the former worked as expected (including fuzz testing of the
arm64 implementation), and the second got instantiated as well, but
with a complaint about a missing test case.

So I'm not sure why this is failing, I will try to check once I have
access to my ordinary development environment.


> You can run "luks2-integrity-test" from cryptsetup test suite to detect it.
>
> Just the test does not fail, it prints N/A for ESSIV use cases - we need to deal with older kernels...
> I can probable change it to fail unconditionally though.
>
> ...
> > @@ -2579,9 +2439,19 @@ static int crypt_ctr_cipher_old(struct dm_target *ti, char *cipher_in, char *key
> >       if (!cipher_api)
> >               goto bad_mem;
> >
> > -     ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
> > -                    "%s(%s)", chainmode, cipher);
> > -     if (ret < 0) {
> > +     if (*ivmode && !strcmp(*ivmode, "essiv")) {
> > +             if (!*ivopts) {
> > +                     ti->error = "Digest algorithm missing for ESSIV mode";
> > +                     kfree(cipher_api);
> > +                     return -EINVAL;
> > +             }
> > +             ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
> > +                            "essiv(%s(%s),%s)", chainmode, cipher, *ivopts);
>
> I guess here it is ok, because old forma cannot use AEAD.
>
> Thanks,
> Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
