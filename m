Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD1648017
	for <lists+dm-devel@lfdr.de>; Mon, 17 Jun 2019 13:00:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0BEA30C318C;
	Mon, 17 Jun 2019 11:00:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D2DF89591;
	Mon, 17 Jun 2019 11:00:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 817691806B12;
	Mon, 17 Jun 2019 10:59:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5HAx4nN015168 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 06:59:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 67B533781; Mon, 17 Jun 2019 10:59:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6294789588
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 10:59:02 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AFE3D81DFA
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 10:58:52 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id e5so20207212iok.4
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 03:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3uIDgkFwtV6fC3eHfwnFIXovpwkgGVEyNZtxQ+vCmvg=;
	b=JyHeUQCgQDBcUhjSLdwEL8Non5+SLMigJ0PDAlIIuhknO4X5oUbxBkiZYVpmXLa4gA
	Buz67cfsk+9bw8Vv1Pm5nOcAqCW6SZaPP5nCPy86Dz+AbXsP/11/qja9qmhFADgnCGZ9
	5KaURNH578Xhj8iACk3jVQaeW4BK2PHzfCUtJExY0Y5n24EtmG3tBFbzu13xsGAHwniZ
	34caVsTHGlNRMRDUIq27W+Y+yUnVRrWQlsvBWRJ+FtYZBLk0iBCKjaeLuIYpghgVUfT8
	dg4GNkfLH1Q/FEc6yQl0wmx0RNymYEhvTvDwRY1GcQjoivZHwwJwS9OcGD1b23nGF8f6
	ge+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3uIDgkFwtV6fC3eHfwnFIXovpwkgGVEyNZtxQ+vCmvg=;
	b=svFr5iqINEGnG0noCi02/bKJdu+LMXhechBeIlMFAFU9U6/H6uzhPwWu00CskUUFMx
	+Y9yXhGGPWDrRbOxa5USpQJPjpZSIlsvdC9Lb+I98bf772ffSo4BrtY2GnbrzjT2eAXS
	D17M3ZCn2idiiXTeSlULQ2EiX++vTl0Y5wYH+P2N8kQi4NOlO7bfy3NYXQOncSzfgytq
	NcqJiqcPBYWu/lW8/SFt8+oIrN1iM8kJj31jTDzJ39EkRObmfGwjscCPqB0ok2M4/GUU
	GOTJMD0lseyFWbO8Lqwx3DUJ8K0pM4R2NgxyK8m4LS0ShTp30wHNDtPTBf5fip+Qr+bH
	cZMQ==
X-Gm-Message-State: APjAAAXNnkWqFto3/GP4qBIHsUVkpM/YS9bw6NGxHsvZ4meT8nRB78Z3
	NuwhwYDMITUG1+0y2kflEkWqQ0I1eaaTXavkYhrUdw==
X-Google-Smtp-Source: APXvYqyxdE7l3lJcOdchpE8rrs9ZQMQ4kYYp6o01m0KkPFK5LIm/xPhYSHQJwPgx1cUDNx+W0ofU7Kz/el3U4ETPYto=
X-Received: by 2002:a02:c90d:: with SMTP id t13mr61091069jao.62.1560769131916; 
	Mon, 17 Jun 2019 03:58:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
	<20190616204419.GE923@sol.localdomain>
	<CAOtvUMf86_TGYLoAHWuRW0Jz2=cXbHHJnAsZhEvy6SpSp_xgOQ@mail.gmail.com>
	<CAKv+Gu_r_WXf2y=FVYHL-T8gFSV6e4TmGkLNJ-cw6UjK_s=A=g@mail.gmail.com>
	<8e58230a-cf0e-5a81-886b-6aa72a8e5265@gmail.com>
In-Reply-To: <8e58230a-cf0e-5a81-886b-6aa72a8e5265@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 17 Jun 2019 12:58:40 +0200
Message-ID: <CAKv+Gu9sb0t6EC=MwVfqTw5TKtatK-c8k3ryNUhV8O0876NV7g@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 17 Jun 2019 10:58:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Mon, 17 Jun 2019 10:58:52 +0000 (UTC) for IP:'209.85.166.68'
	DOMAIN:'mail-io1-f68.google.com' HELO:'mail-io1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.68 mail-io1-f68.google.com 209.85.166.68
	mail-io1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>, Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [RFC PATCH 0/3] crypto: switch to shash for ESSIV
	generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 17 Jun 2019 11:00:40 +0000 (UTC)

On Mon, 17 Jun 2019 at 12:39, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 17/06/2019 11:15, Ard Biesheuvel wrote:
> >> I will also add that going the skcipher route rather than shash will
> >> allow hardware tfm providers like CryptoCell that can do the ESSIV
> >> part in hardware implement that as a single API call and/or hardware
> >> invocation flow.
> >> For those system that benefit from hardware providers this can be beneficial.
> >>
> >
> > Ah yes, thanks for reminding me. There was some debate in the past
> > about this, but I don't remember the details.
> >
> > I think implementing essiv() as a skcipher template is indeed going to
> > be the best approach, I will look into that.
>
> For ESSIV (that is de-facto standard now), I think there is no problem
> to move it to crypto API.
>
> The problem is with some other IV generators in dm-crypt.
>
> Some do a lot of more work than just IV (it is hackish, it can modify data, this applies
> for loop AES "lmk" and compatible TrueCrypt "tcw" IV implementations).
>
> For these I would strongly say it should remain "hacked" inside dm-crypt only
> (it is unusable for anything else than disk encryption and should not be visible outside).
>
> Moreover, it is purely legacy code - we provide it for users can access old systems only.
>
> If you end with rewriting all IVs as templates, I think it is not a good idea.
>
> If it is only about ESSIV, and patch for dm-crypt is simple, it is a reasonable approach.
>
> (The same applies for simple dmcryp IVs like "plain" "plain64", "plain64be and "benbi" that
> are just linear IVs in various encoded variants.)
>

Agreed.

I am mostly only interested in ensuring that the bare 'cipher'
interface is no longer used outside of the crypto subsystem itself.
Since ESSIV is the only one using that, ESSIV is the only one I intend
to change.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
