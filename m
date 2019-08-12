Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0818A8A099
	for <lists+dm-devel@lfdr.de>; Mon, 12 Aug 2019 16:20:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A040A30622EA;
	Mon, 12 Aug 2019 14:19:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B4091001281;
	Mon, 12 Aug 2019 14:19:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E80E180B536;
	Mon, 12 Aug 2019 14:19:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7CEJkor023366 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Aug 2019 10:19:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 783C61001958; Mon, 12 Aug 2019 14:19:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 720F71001947
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 14:19:44 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDA3C64457
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 14:19:42 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v15so12344346wml.0
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 07:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rjvKcpCdQy4Fb58ugbqz4IBMCEH2qfwlqKGn/IbXyKU=;
	b=yLeiwepqLD+fzOmGB/TMVxXWqsg3LGD/Cy06GePwEfqZyBsQqvcRzYytHbubf9vGzJ
	UeQ6AiHpX+UcjO0lvm/+A0PBPQthqa+VDCNMuaR2jeS//V48OwMA9DyEN23wTBL+NQiS
	LIaLMhAVDcg/ZCW68Qkl8BrZBKsxPEAlhcMtBSEw4BVgfsq9j68BMbpvO2hO0zHN63Jv
	OLoEUWsQkXqv+sQ22DecHcDZF57LLQiQrfG0r3edOgvFpVeQQv0TgdW/czCr1Vw0thzW
	6OR98OuImqfAOK3t32AfccRgC0XAjeJzEkeHMylCHcfk5RFyD0otVSJtLfIg24DOCa30
	7Rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rjvKcpCdQy4Fb58ugbqz4IBMCEH2qfwlqKGn/IbXyKU=;
	b=ExTdulVzJC8pvxLTnRYlyVwdJmKcj3NMtjIwb2T//kqqFBtBXThERhzMkaQz39vyYN
	Nh+Ja00rnhlhvPgBwAvpFRfg7S8ROLU5MddT+1bCkLktKuBGR12G1UBgzj0mnUp5zYkJ
	hQhUOsQz1Eb6DqwHUBHnxdI+p8acUAkeNTbyEM+MvhuIpakNL6hKicNHRV7axb6DqyC/
	A7FEW0lsvui43kfiOEQEjDFZl6+heC9OoPg48ZNL9hfsmAsn7cf2KU7fhlKlIe11+6wn
	5rOQxrNxqvcGT8Wp+cgOVMNlvptk9ohuP8r5R9EQPaopZR5gcGFCvyo0UO02roG3Csuk
	3GkQ==
X-Gm-Message-State: APjAAAUvJWhoemK3p4MJswR77NO3T27GR8owA9bSXjeEeGzJL61Bqgza
	9YcNZa68wl+Qlnk+XWlDRafXGYKNv252srgEKQsF9Q==
X-Google-Smtp-Source: APXvYqznI6bUbr7GlJMRPRCyx9+eTwBaPF6WjOHdOQu8SNnMZHNCH7GhZfj8X8bjavC3mQnpvz/6J5R4WNNWk4Lk8u4=
X-Received: by 2002:a05:600c:231a:: with SMTP id
	26mr13970077wmo.136.1565619581427; 
	Mon, 12 Aug 2019 07:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190810094053.7423-1-ard.biesheuvel@linaro.org>
	<20190810094053.7423-4-ard.biesheuvel@linaro.org>
	<8679d2f5-b005-cd89-957e-d79440b78086@gmail.com>
	<CAKv+Gu-ZPPR5xQSR6T4o+8yJvsHY2a3xXZ5zsM_aGS3frVChgQ@mail.gmail.com>
	<82a87cae-8eb7-828c-35c3-fb39a9abe692@gmail.com>
	<CAKv+Gu_d+3NsTKFZbS+xeuxf5uCz=ENmPX-a=s-2kgLrW4d7cQ@mail.gmail.com>
	<7b3365a9-42ca-5426-660f-e87898bb9f7a@gmail.com>
In-Reply-To: <7b3365a9-42ca-5426-660f-e87898bb9f7a@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 12 Aug 2019 17:19:29 +0300
Message-ID: <CAKv+Gu_V+i=j9u-vZABN_ArWtwVbXPVjG=xOdj-RDWWHs2w08Q@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 12 Aug 2019 14:19:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Mon, 12 Aug 2019 14:19:43 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 12 Aug 2019 14:20:01 +0000 (UTC)

On Mon, 12 Aug 2019 at 16:51, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 12/08/2019 09:50, Ard Biesheuvel wrote:
> > On Mon, 12 Aug 2019 at 10:44, Milan Broz <gmazyland@gmail.com> wrote:
> >>
> >> On 12/08/2019 08:54, Ard Biesheuvel wrote:
> >>> On Mon, 12 Aug 2019 at 09:33, Milan Broz <gmazyland@gmail.com> wrote:
> >>>> Try for example
> >>>> # cryptsetup luksFormat /dev/sdc -c aes-cbc-essiv:sha256 --integrity hmac-sha256 -q -i1
> >>>>
> >>>> It should produce Crypto API string
> >>>>   authenc(hmac(sha256),essiv(cbc(aes),sha256))
> >>>> while it produces
> >>>>   essiv(authenc(hmac(sha256),cbc(aes)),sha256)
> >>>> (and fails).
> >>>>
> >>>
> >>> No. I don't know why it fails, but the latter is actually the correct
> >>> string. The essiv template is instantiated either as a skcipher or as
> >>> an aead, and it encapsulates the entire transformation. (This is
> >>> necessary considering that the IV is passed via the AAD and so the
> >>> ESSIV handling needs to touch that as well)
> >>
> >> Hm. Constructing these strings seems to be more confusing than dmcrypt mode combinations :-)
> >>
> >> But you are right, I actually tried the former string (authenc(hmac(sha256),essiv(cbc(aes),sha256)))
> >> and it worked, but I guess the authenticated IV (AAD) was actually the input to IV (plain sector number)
> >> not the output of ESSIV? Do I understand it correctly now?
> >>
> >
> > Indeed. The former string instantiates the skcipher version of the
> > ESSIV template, and so the AAD handling is omitted, and we end up
> > using the plain IV in the authentication rather than the encrypted IV.
> >
> > So when using the latter string, does it produce any error messages
> > when it fails?
>
> The error is
> table: 253:1: crypt: Error decoding and setting key
>
> and it is failing in crypt_setkey() int this  crypto_aead_setkey();
>
> And it is because it now wrongly calculates MAC key length.
> (We have two keys here - one for length-preserving CBC-ESSIV encryption
> and one for HMAC.)
>
> This super-ugly hotfix helps here... I guess it can be done better :-)
>

Weird. It did work fine before, but now that I have dropped the 'md:
dm-crypt: infer ESSIV block cipher from cipher string directly' patch,
we are probably taking a different code path and hitting this error.

I'll try to fix this cleanly. Thanks for doing the diagnosis.


> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index e9a0093c88ee..7b06d975a2e1 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -2342,6 +2342,9 @@ static int crypt_ctr_auth_cipher(struct crypt_config *cc, char *cipher_api)
>         char *start, *end, *mac_alg = NULL;
>         struct crypto_ahash *mac;
>
> +       if (strstarts(cipher_api, "essiv(authenc("))
> +               cipher_api += strlen("essiv(");
> +
>         if (!strstarts(cipher_api, "authenc("))
>                 return 0;
>
> Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
