Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 00927A4562
	for <lists+dm-devel@lfdr.de>; Sat, 31 Aug 2019 18:38:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4538B3083363;
	Sat, 31 Aug 2019 16:38:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3A9D608A5;
	Sat, 31 Aug 2019 16:38:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E2632551C;
	Sat, 31 Aug 2019 16:38:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7VGc5b3029782 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 31 Aug 2019 12:38:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 01B235C21F; Sat, 31 Aug 2019 16:38:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F00785C207
	for <dm-devel@redhat.com>; Sat, 31 Aug 2019 16:38:02 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8534059451
	for <dm-devel@redhat.com>; Sat, 31 Aug 2019 16:38:01 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z11so9882897wrt.4
	for <dm-devel@redhat.com>; Sat, 31 Aug 2019 09:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mHCgJTa167mXOf521wY9Uhp8C8rQVMSZvRt1D4lWNlU=;
	b=dYXFBAYxoNOiN1xNVpdMIn8W8TYv7nuYIRPaL9r9sf2ARnssriUhdkMoOCH8ji3jbb
	y67Np56SMreukzf95+aotZk/sxdeq9j2rEKCTcLkpJcnUI4MYooy/rtu7TBQQORAoxM+
	VSAe9IIfJgUTQETHvvd2mbIEZ2RefeggyVhxa6FgQSnxiiRmIZw9jiLeYBthLnte18ZD
	x45mSZueT0qq9CgxPvD7X/URNqgGSCVS0vONh659TayRHNhrVqMYNb7mE2n9+dowpMqC
	NZJXwH2hZ4F+aZaUKhSfbHROcpn0SK1816l5laIWLogLV3gczX05KA2mlqdae7hTijIr
	9tGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mHCgJTa167mXOf521wY9Uhp8C8rQVMSZvRt1D4lWNlU=;
	b=g46ZAYK2Orh3z9M5tsyaCvNA6r6aZ7FKvy2MDhnxMRXoRd8z4BVn3NN2Y0fM6IQncc
	4II07vDUyVNEiribhuQNZu/l/N3yTwV4XFfbdop+T1jEzcRi+tCe6kh4Q2FnzDm/G014
	d2WPLcNc3BTTUmJ30Te3tjycTPHlpKhaCxa+/fSJ9J7nlSKhjHk23BYy1h5j2ZDxeGXo
	5Pf2azJ/+Esj7t0HyAsoiOM9tKt56dhH3g13+3IUF8LjB0Kqs+xMnmWbE8Ym4gQ0MGo6
	Qp37VVNK/kw8bvKpuqHZ4V1QB2r1YBbuBFPZNeVtqvsi7OJuWL+eOE1GCj/TxLVrjNZ1
	V7hA==
X-Gm-Message-State: APjAAAXe6UESfhlBpjzyhwhV1qrlthBDnaeOLR/OW1e2e+gumX7Kpeko
	8fr3Smm7HJo8MenuAd2Ut6v1QeYv0jamoWIyP6lb0Q==
X-Google-Smtp-Source: APXvYqxOF01WJIu5hP8TwQQKuuOgCrfcvI06umhuEUCpy+lqt2cBpviobMUs+d2ImL+amyZ4Tf04ZZJPwIXR8WA5nmc=
X-Received: by 2002:adf:ee50:: with SMTP id w16mr7303621wro.93.1567269480090; 
	Sat, 31 Aug 2019 09:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190819141738.1231-1-ard.biesheuvel@linaro.org>
	<20190819141738.1231-2-ard.biesheuvel@linaro.org>
	<20190830045822.GA17901@gondor.apana.org.au>
In-Reply-To: <20190830045822.GA17901@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Sat, 31 Aug 2019 19:37:48 +0300
Message-ID: <CAKv+Gu-7c+L4KzC=h=rBxLhZRt3RhK3eO2L2NvVrajR0MX_9+g@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Sat, 31 Aug 2019 16:38:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Sat, 31 Aug 2019 16:38:01 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fscrypt@vger.kernel.org,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Eric Biggers <ebiggers@google.com>
Subject: Re: [dm-devel] [PATCH v13 1/6] crypto: essiv - create wrapper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Sat, 31 Aug 2019 16:38:36 +0000 (UTC)

On Fri, 30 Aug 2019 at 07:58, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Mon, Aug 19, 2019 at 05:17:33PM +0300, Ard Biesheuvel wrote:
> > Implement a template that wraps a (skcipher,shash) or (aead,shash) tuple
> > so that we can consolidate the ESSIV handling in fscrypt and dm-crypt and
> > move it into the crypto API. This will result in better test coverage, and
> > will allow future changes to make the bare cipher interface internal to the
> > crypto subsystem, in order to increase robustness of the API against misuse.
> >
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > ---
> >  crypto/Kconfig  |  28 +
> >  crypto/Makefile |   1 +
> >  crypto/essiv.c  | 663 ++++++++++++++++++++
> >  3 files changed, 692 insertions(+)
>
> Acked-by: Herbert Xu <herbert@gondor.apana.org.au>

Milan,

Hopefully, this can still be taken for v5.4. If not, please coordinate
with Eric on how to get this queued for v5.5

Thanks,
Ard.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
