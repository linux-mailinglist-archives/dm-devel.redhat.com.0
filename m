Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3856D1E7
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jul 2019 18:20:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 371642ED2FB;
	Thu, 18 Jul 2019 16:19:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7A9B605C6;
	Thu, 18 Jul 2019 16:19:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A2C11800206;
	Thu, 18 Jul 2019 16:19:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6IGJfR0003132 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 12:19:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4D6DD5D71A; Thu, 18 Jul 2019 16:19:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 480105D719
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 16:19:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45D02C065138
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 16:19:37 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id n4so29398185wrs.3
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 09:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r3GlNBVst9t8jRnUchWq6hQTL9LZJ3mgIWLVfA8vl2E=;
	b=cAvaFYYna2pGYnNS54i+OV8AOmRUdbYBQRhlr+pzWwELtS5raoT2vgQpCKklNjlWU6
	VLffcf3pnj+YtCji6HT/XXsk70R9wkcG6akf+SzUELz1oiWpVwe6DKpAknAUa1fM+MKp
	EkWxzOWiQgaAxMvXQPUQPP2X7pi7WW3TwJLPvWY4o0mIvh1pVSbMqeIiGV0WtoQrThnC
	AgIdDiTjjB6ajoy0MqfFMMixvHcCFMks2f6E+ayof3vHv3CrAIDJ2AId3EUaYCMeks6d
	7PvkM/cZkQuhm5r/GpSe4/xruRWpWC+TN5lACj4Ux6wIOCmnLzmFxBqytDy6E3mH9xww
	wSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r3GlNBVst9t8jRnUchWq6hQTL9LZJ3mgIWLVfA8vl2E=;
	b=dUnQS+91RRsSdZuKjVBujQreexuHd6GKLfRo7M/cdwUCcFT3E1lTCT5Wfpd3QOgJUO
	QQv/YFvkXgQwjJq8oHjCtPolWhru4wRcbOp+nY+vEi79nwPNDOKeeon5fJDzjp0fIHrg
	9k/fY6ELlWlY1Lknb8uDdA9ZOS3H2Cz8WQQo9FjJCOgIJWl/vbFmgv87iDVS9zcY56f2
	sNMmnKkQ14DrSel+yx1NIC6FlIC4o/A6edXCHsN1lfXDDeiW9MWix1vnU7OkpgS6GG+U
	eG08HyNV2tNBZgeLeZEf8xAAn7O38H0c1+b/mc5zuXJWUyRB/VaBm6n8uZM+bc1YaWGE
	CkjQ==
X-Gm-Message-State: APjAAAW3bv/Sh5WfzHhErhAbI/Ixlb3lQOnV+ccKL/sw87mserZGAFwy
	bNcHaxS8NdU6eM/Tl2oDvvQiMxBVvm1eFwheihN0ug==
X-Google-Smtp-Source: APXvYqy+kJgsx7Ky1c4wR0zRzAVUExEZ4EmTRuTx/jL4Gnzjk7syrW8Z87IdmvbJM9CotVHG1uCzQctJPbQU97fHrPg=
X-Received: by 2002:adf:e8c2:: with SMTP id k2mr36541175wrn.198.1563466775933; 
	Thu, 18 Jul 2019 09:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190717172823.GA205944@gmail.com>
	<CAKv+Gu__offPaWvyURJr8v56ig58q-Deo16QhP26EJ32uf5m3w@mail.gmail.com>
	<20190718065223.4xaefcwjoxvujntw@gondor.apana.org.au>
	<CAKv+Gu9-EWNpJ9viSsjhYRdOZb=7a=Mpddmyt8SLEq9aFtawjg@mail.gmail.com>
	<20190718072154.m2umem24x4grbf6w@gondor.apana.org.au>
	<36e78459-1594-6d19-0ab4-95b03a6de036@gmail.com>
	<MN2PR20MB2973E61815F069E8C7D74177CAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
	<20190718152908.xiuze3kb3fdc7ov6@gondor.apana.org.au>
	<MN2PR20MB2973E1A367986303566E80FCCAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
	<20190718155140.b6ig3zq22askmfpy@gondor.apana.org.au>
In-Reply-To: <20190718155140.b6ig3zq22askmfpy@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 18 Jul 2019 18:19:24 +0200
Message-ID: <CAKv+Gu9qm8mDZASJasq18bW=4_oE-cKPGKvdF9+8=7VNo==_fA@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 18 Jul 2019 16:19:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Thu, 18 Jul 2019 16:19:37 +0000 (UTC) for IP:'209.85.221.41'
	DOMAIN:'mail-wr1-f41.google.com' HELO:'mail-wr1-f41.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.41 mail-wr1-f41.google.com 209.85.221.41
	mail-wr1-f41.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Milan Broz <gmazyland@gmail.com>, Horia Geanta <horia.geanta@nxp.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing
	support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 18 Jul 2019 16:20:00 +0000 (UTC)

On Thu, 18 Jul 2019 at 17:51, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Jul 18, 2019 at 03:43:28PM +0000, Pascal Van Leeuwen wrote:
> >
> > Hmmm ... so the generic CTS template would have to figure out whether it is wrapped
> > around ECB, CBC, XTS or whatever and then adjust to that?
>
> That's not hard to do.  Right now cts only supports cbc.  IOW
> if you pass it anything else it will refuse to instantiate.
>
> > For XTS, you have this additional curve ball being thrown in called the "tweak".
> > For encryption, the underlying "xts" would need to be able to chain the tweak,
> > from what I've seen of the source the implementation cannot do that.
>
> You simply use the underlying xts for the first n - 2 blocks and
> do the last two by hand.
>

OK, so it appears the XTS ciphertext stealing algorithm does not
include the peculiar reordering of the 2 final blocks, which means
that the kernel's implementation of XTS already conforms to the spec
for inputs that are a multiple of the block size.

The reason I am not a fan of making any changes here is that there are
no in-kernel users that require ciphertext stealing for XTS, nor is
anyone aware of any reason why we should be adding it to the userland
interface. So we are basically adding dead code so that we are
theoretically compliant in a way that we will never exercise in
practice.

Note that for software algorithms such as the bit sliced NEON
implementation of AES, which can only operate on 8 AES blocks at a
time, doing the final 2 blocks sequentially is going to seriously
impact performance. This means whatever wrapper we invent around xex()
(or whatever we call it) should go out of its way to ensure that the
common, non-CTS case does not regress in performance, and the special
handling is only invoked when necessary (which will be never).

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
