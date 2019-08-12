Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2056F89847
	for <lists+dm-devel@lfdr.de>; Mon, 12 Aug 2019 09:50:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 42E7A69099;
	Mon, 12 Aug 2019 07:50:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 440065D9C9;
	Mon, 12 Aug 2019 07:50:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A71D24F30;
	Mon, 12 Aug 2019 07:50:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7C7oY1c009260 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Aug 2019 03:50:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CEC1B646AB; Mon, 12 Aug 2019 07:50:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8C7A646AA
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 07:50:32 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F9A046660
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 07:50:31 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 207so11248869wma.1
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 00:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=P3fUIo7bf1pVPngPlyIX37AdYP0H8U4V2yGXzc3Q8PU=;
	b=oTfqh5iRHusnTRpAqy4qvCs8UwHzoKalNbqMK/GjgIboOgPnfdXRyXnph+Q37L7hc6
	5L8nRT1ZtexlBg+WQw5KrY1H+fYbgWjHqv9QL8Vg2kzsKzb2kYJPeOT2RZz4GFhzthnj
	2hKX6j7vrWopkZGcewExFiAeKafnl/M8gLPo2ku/KWuX0IG7cSgEIYJa41kqEKSwa/R7
	UDQ/J9fuH6hoNIYy7Gls/PJ2v3y7+aDjRhmBQwjqLNz29KSh+BgPUiiNdg1RIDJxB5E7
	NiNuN5ngcwxOe+en/TyM5rgehfOAJa54oo+rSMScntSkZDQfPLq1mJt0haiJX1v4UCm0
	obCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=P3fUIo7bf1pVPngPlyIX37AdYP0H8U4V2yGXzc3Q8PU=;
	b=Qifg5fdvd3o/bPFwJFcYEHOvndlCaMPBaSkfaH067GIFcZTw7CI1zCwJe9Mi5IRcdQ
	SkU9XLmQ5gbigm1L+KOrmCFM7BC1FRlGPo3kr83ESoE4iLqwmT/CnbCZelTK1+cpLWYJ
	rw9lhpw/8wkVp/8UDpsWepDB22y3A9XXmmG9UOxbWGqdL0adBbzhi9e6LvMs4tMGwykl
	+DThJBjzxGgoNEB9MD8AIZY7woyls8suuq2yquqqwsDafZMfSG+XPQeTrz2jbjwUlhr7
	phigDcDfubzw6WcsKK8o5J49meww1YokZ4rTFGqT6tXaGCorqBL4WtKjaUhonGgHVeF4
	85Ig==
X-Gm-Message-State: APjAAAWWcVXBZC1V0OWht1pIBzJPzNq7/O1jJNuoOcfVqJpgpZhXhf94
	2YZjn8nG6F7S9KlR97f6LI4I91xBzxJd9fqHYubPBQ==
X-Google-Smtp-Source: APXvYqwgX4GSGhKVfxz1Y7uXiz3RKDX4LiVGl3zj4caTjar5UkkOQnpMqABzSOE6jltHT5IOZsjPe+lkzp++qlubqQ4=
X-Received: by 2002:a7b:cb8e:: with SMTP id m14mr5924657wmi.10.1565596229982; 
	Mon, 12 Aug 2019 00:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190810094053.7423-1-ard.biesheuvel@linaro.org>
	<20190810094053.7423-4-ard.biesheuvel@linaro.org>
	<8679d2f5-b005-cd89-957e-d79440b78086@gmail.com>
	<CAKv+Gu-ZPPR5xQSR6T4o+8yJvsHY2a3xXZ5zsM_aGS3frVChgQ@mail.gmail.com>
	<82a87cae-8eb7-828c-35c3-fb39a9abe692@gmail.com>
In-Reply-To: <82a87cae-8eb7-828c-35c3-fb39a9abe692@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 12 Aug 2019 10:50:18 +0300
Message-ID: <CAKv+Gu_d+3NsTKFZbS+xeuxf5uCz=ENmPX-a=s-2kgLrW4d7cQ@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 12 Aug 2019 07:50:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Mon, 12 Aug 2019 07:50:31 +0000 (UTC) for IP:'209.85.128.68'
	DOMAIN:'mail-wm1-f68.google.com' HELO:'mail-wm1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.68 mail-wm1-f68.google.com 209.85.128.68
	mail-wm1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 12 Aug 2019 07:50:50 +0000 (UTC)

On Mon, 12 Aug 2019 at 10:44, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 12/08/2019 08:54, Ard Biesheuvel wrote:
> > On Mon, 12 Aug 2019 at 09:33, Milan Broz <gmazyland@gmail.com> wrote:
> >> Try for example
> >> # cryptsetup luksFormat /dev/sdc -c aes-cbc-essiv:sha256 --integrity hmac-sha256 -q -i1
> >>
> >> It should produce Crypto API string
> >>   authenc(hmac(sha256),essiv(cbc(aes),sha256))
> >> while it produces
> >>   essiv(authenc(hmac(sha256),cbc(aes)),sha256)
> >> (and fails).
> >>
> >
> > No. I don't know why it fails, but the latter is actually the correct
> > string. The essiv template is instantiated either as a skcipher or as
> > an aead, and it encapsulates the entire transformation. (This is
> > necessary considering that the IV is passed via the AAD and so the
> > ESSIV handling needs to touch that as well)
>
> Hm. Constructing these strings seems to be more confusing than dmcrypt mode combinations :-)
>
> But you are right, I actually tried the former string (authenc(hmac(sha256),essiv(cbc(aes),sha256)))
> and it worked, but I guess the authenticated IV (AAD) was actually the input to IV (plain sector number)
> not the output of ESSIV? Do I understand it correctly now?
>

Indeed. The former string instantiates the skcipher version of the
ESSIV template, and so the AAD handling is omitted, and we end up
using the plain IV in the authentication rather than the encrypted IV.

So when using the latter string, does it produce any error messages
when it fails?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
