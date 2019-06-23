Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C494FAF6
	for <lists+dm-devel@lfdr.de>; Sun, 23 Jun 2019 11:31:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1AFC98667D;
	Sun, 23 Jun 2019 09:31:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D0E519C78;
	Sun, 23 Jun 2019 09:31:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B32E91806B0E;
	Sun, 23 Jun 2019 09:31:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5N9Uw7F014538 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 23 Jun 2019 05:30:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4C75A6090E; Sun, 23 Jun 2019 09:30:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4624B608D0
	for <dm-devel@redhat.com>; Sun, 23 Jun 2019 09:30:56 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59FAC307D84B
	for <dm-devel@redhat.com>; Sun, 23 Jun 2019 09:30:55 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id w25so170758ioc.8
	for <dm-devel@redhat.com>; Sun, 23 Jun 2019 02:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wvgYQJkZGqcc1lfJilFFMb7xsNi0HiPMMJpo064zefM=;
	b=XIWvSciJXTWxUHdpOJ/Jiw7mhnXChMAz38UwfOCNYhyxtiP5995AZVApj5EI1r64qE
	G5Wb50bCXsb63Sy0BT9k05wbOEaMxUv54DGQFr61UYycrgIvHMzur3LWuloXlUEBCCaw
	dtFMdlCVVo3+ieBGYj2lThfkRy8GABw5srKabwQYjzqsUnZt0LRsesAbKNb+ATr9jcPw
	iah80UTd4lExTLdH1RzhcUQ4it23dakXPQiMyqQpY4Yp0RS8wvEIV6o8w/mkaNN5d98P
	yAk/MjnWrm0JKZw9hhyk9KJDeSjzHSgAZL2sMFJOkgPmwLTOa2yjnFos/mv5KvelBlLz
	29rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wvgYQJkZGqcc1lfJilFFMb7xsNi0HiPMMJpo064zefM=;
	b=I/g0T5SmD1Kl7f/bIAA0Kqt4SebDz0LzzQP36y3DK9O4X/tOM7Vvd+/UsvfnlMiTMf
	e2Na5yjqN2/QFNGyiBVfYzXhJxqNW8tL5mMP7YxAx0eTbq30+e+fDGqbRpxFzufWQ81v
	La90sYfaKfii/GEUf0VZxSPeC5ahRDMEp1jH8RFFvPkur7IoBRsKYUcFML/lOVYuoXqP
	oV9W1xf0W2YdJ1Hks0s8ajp4jw3Tkg64NEAHFW1zxUiY9593AL7Hxuph3MjmttNf74oE
	zWAZ2TIyU1FLxtSeTldxvAeN7wAdiqQ+pD243CeqRAyx0WykJx+zWEwagT6eev4CX6bO
	lJ7Q==
X-Gm-Message-State: APjAAAWPppCbCJUcL0pckgIEpS0FDCPSuULD4ZHYW+ZSbxqS1T2VX74L
	cMKjfu2lwi0rQj3dJFmrz/d1fncGytlNsvB4SDdmPg==
X-Google-Smtp-Source: APXvYqw231WPDSV0vp3+/kcuJTLLvj6P/KErcOQKt6Gw4rdKpxSKVjzoeHQpp0qSCZAo3xz5kn3MmfYU0+FjLta6sSY=
X-Received: by 2002:a5e:d51a:: with SMTP id e26mr503654iom.71.1561282254656;
	Sun, 23 Jun 2019 02:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190621080918.22809-1-ard.biesheuvel@arm.com>
In-Reply-To: <20190621080918.22809-1-ard.biesheuvel@arm.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Sun, 23 Jun 2019 11:30:41 +0200
Message-ID: <CAKv+Gu-ZO9Fnfx06XYJ-tp+6nrk0D8TBGa2chmxFW-kjPMmLCw@mail.gmail.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Sun, 23 Jun 2019 09:30:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Sun, 23 Jun 2019 09:30:55 +0000 (UTC) for IP:'209.85.166.67'
	DOMAIN:'mail-io1-f67.google.com' HELO:'mail-io1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.67 mail-io1-f67.google.com 209.85.166.67
	mail-io1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v4 0/6] crypto: switch to crypto API for
	ESSIV generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Sun, 23 Jun 2019 09:31:35 +0000 (UTC)

On Fri, 21 Jun 2019 at 10:09, Ard Biesheuvel <ard.biesheuvel@arm.com> wrote:
>
> From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>
...
>
> - given that hardware already exists that can perform en/decryption including
>   ESSIV generation of a range of blocks, it would be useful to encapsulate
>   this in the ESSIV template, and teach at least dm-crypt how to use it
>   (given that it often processes 8 512-byte sectors at a time)

I thought about this a bit more, and it occurred to me that the
capability of issuing several sectors at a time and letting the lower
layers increment the IV between sectors is orthogonal to whether ESSIV
is being used or not, and so it probably belongs in another wrapper.

I.e., if we define a skcipher template like dmplain64le(), which is
defined as taking a sector size as part of the key, and which
increments a 64 LE counter between sectors if multiple are passed, it
can be used not only for ESSIV but also for XTS, which I assume can be
h/w accelerated in the same way.

So with that in mind, I think we should decouple the multi-sector
discussion and leave it for a followup series, preferably proposed by
someone who also has access to some hardware to prototype it on.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
