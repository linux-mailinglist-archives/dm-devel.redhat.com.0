Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD9548A1F
	for <lists+dm-devel@lfdr.de>; Mon, 17 Jun 2019 19:32:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B1F4A101D;
	Mon, 17 Jun 2019 17:31:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12C831001E61;
	Mon, 17 Jun 2019 17:31:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 960A8206D3;
	Mon, 17 Jun 2019 17:30:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5HHTwCd018585 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 13:30:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 590305C672; Mon, 17 Jun 2019 17:29:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5349D5C66B
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 17:29:56 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D78F9307D986
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 17:29:45 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id s7so22899525iob.11
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 10:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Tx+RieQLyQ+lh9UZ5H0F2WZBvGEsSZxqyVbasY51tYI=;
	b=EvlURp56PD/fZX3/f33oR7xEaNAktTY52gbQTnuJRvCuz7+8Heh+Ogh2nsPdyPhnVb
	q9ugzxFcpzIBHr/3vlnj622rRRZNCvwBaTrDgMvzuhqEKsIpNRpwSPJH2A/mAavcwI+c
	t9lV5X0NeJSUF8ZrXKcB/RRwheqdUONQNKnMrhZ9oGfDargEMn9zhcznvPfFtKs0CTY5
	3hLpyAFpTLDmasBUrothylE6kwy0X4ROxGkA31/Q5oZU4w9GcxajQ5tTg9Ua3ut4z2D8
	G5syZjvMh9NeeIIzkkk44nw9+FAciFINwWM/6CRlfOXjjGHN9cXve/6nMvROqwqxWOvn
	zAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Tx+RieQLyQ+lh9UZ5H0F2WZBvGEsSZxqyVbasY51tYI=;
	b=PfV4Vdx5rTobYPmez6ve8aHvhPUOln4RLCkUzgNJ5+XGOzJ5yT1OzHcM9Hw1GOKxte
	lcLy36r5YffBVCtbf5MV5C9kkObXQrB/po3Mkb9AiRvvoaUvQV+9xCNA9C1F6Bwm6xGm
	1/Y4M+uB0yUeoUajelFpWGGtfxZIWAhhTyeSc3H6cFHbp/Je5GQGG1XtXXLnlYRKGr15
	/ZSYey2ZYszTd96q7ejIBp5+yIlOgnNlSGe7lNDAHiSr380POoKTfmX9QhhUcxUzQdsM
	g8itbnUnI5lxauMCDSZyeIhdLmtWg48nmVNeQITK/byCPDSPgQRs+RPZXs6argnZuOZx
	StZg==
X-Gm-Message-State: APjAAAXIiEpexRSo9sCKkTt3DRSnGexDF9wHQekLya4yMnh9I++FupY9
	a9E+oEFPupbGotrWni9PFjWVvMXpLteaeotd97BJFA==
X-Google-Smtp-Source: APXvYqycFVgNYf56Rc5fCMWC4dEZzi0p52SynbgzsiegdocdCseGuLtCO4YbqRFeNHS67ShUfA/hulHJe9282wYVEoM=
X-Received: by 2002:a5d:9456:: with SMTP id x22mr3034719ior.71.1560792580222; 
	Mon, 17 Jun 2019 10:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
	<20190616204419.GE923@sol.localdomain>
	<CAOtvUMf86_TGYLoAHWuRW0Jz2=cXbHHJnAsZhEvy6SpSp_xgOQ@mail.gmail.com>
	<CAKv+Gu_r_WXf2y=FVYHL-T8gFSV6e4TmGkLNJ-cw6UjK_s=A=g@mail.gmail.com>
	<8e58230a-cf0e-5a81-886b-6aa72a8e5265@gmail.com>
	<CAKv+Gu9sb0t6EC=MwVfqTw5TKtatK-c8k3ryNUhV8O0876NV7g@mail.gmail.com>
	<CAKv+Gu-LFShLW-Tt7hwBpni1vQRvv7k+L_bpP-wU86x88v+eRg@mail.gmail.com>
	<90214c3d-55ef-cc3a-3a04-f200d6f96cfd@gmail.com>
	<CAKv+Gu82BLPWrX1UzUBLf7UB+qJT6ZPtkvJ2Sa9t28OpXArhnw@mail.gmail.com>
	<af1b7ea1-bc98-06ff-e46c-945e6bae20d8@gmail.com>
In-Reply-To: <af1b7ea1-bc98-06ff-e46c-945e6bae20d8@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 17 Jun 2019 19:29:27 +0200
Message-ID: <CAKv+Gu-37P+_4=Men92wR7S7LQS7U-4L2-ZaPdEN18TWAa3QaQ@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 17 Jun 2019 17:29:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 17 Jun 2019 17:29:46 +0000 (UTC) for IP:'209.85.166.68'
	DOMAIN:'mail-io1-f68.google.com' HELO:'mail-io1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.68 mail-io1-f68.google.com 209.85.166.68
	mail-io1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 17 Jun 2019 17:32:07 +0000 (UTC)

On Mon, 17 Jun 2019 at 19:05, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 17/06/2019 16:39, Ard Biesheuvel wrote:
> >>
> >> In other words, if you add some additional limit, we are breaking backward compatibility.
> >> (Despite the configuration is "wrong" from the security point of view.)
> >>
> >
> > Yes, but breaking backward compatibility only happens if you break
> > something that is actually being *used*. So sure,
> > xts(aes)-essiv:sha256 makes no sense but people use it anyway. But is
> > that also true for, say, gcm(aes)-essiv:sha256 ?
>
> These should not be used.  The only way when ESSIV can combine with AEAD mode
> is when you combine length-preserving mode with additional integrity tag, for example
>
>   # cryptsetup luksFormat -c aes-cbc-essiv:sha256 --integrity hmac-sha256 /dev/sdb
>
> it will produce this dm-crypt cipher spec:
>   capi:authenc(hmac(sha256),cbc(aes))-essiv:sha256
>
> the authenc(hmac(sha256),cbc(aes)) is direct crypto API cipher composition, the essiv:sha256
> IV is processed inside dm-crypt as IV.
>
> So if authenc() composition is problem, then yes, I am afraid these can be used in reality.
>
> But for things like gcm(aes)-essiv:sha256 (IOW real AEAD mode with ESSIV) - these are
> not supported by cryptsetup (we support only random IV in this case), so these should
> not be used anywhere.
>

OK, understood. Unfortunately, that means that the essiv template
should be dynamically instantiated as either a aead or a skcipher
depending on the context, but perhaps this is not a big deal in
reality, I will check.

One final question before I can proceed with my v2: in
crypt_ctr_blkdev_cipher(), do you think we could change the code to
look at the cipher string rather than the name of the actual cipher?
In practice, I don't think they can be different, but in order to be
able to instantiate
'essiv(authenc(hmac(sha256),cbc(aes)),sha256,aes)', the cipher part
needs to be parsed before the TFM(s) are instantiated.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
